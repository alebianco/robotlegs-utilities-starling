/**
 * Author:  Alessandro Bianco
 * Website: http://alessandrobianco.eu
 * Twitter: @alebianco
 * Created: 06/05/13 19.22
 *
 * Copyright © 2013 Alessandro Bianco
 */
package robotlegs.starling.extensions.contextView {

import robotlegs.bender.extensions.matching.instanceOfType;
import robotlegs.bender.framework.api.IContext;
import robotlegs.bender.framework.api.IExtension;
import robotlegs.bender.framework.api.ILogger;

import starling.core.Starling;
import starling.events.Event;

public class StageSyncExtension implements IExtension {

    private var _context:IContext;
    private var _contextView:Starling;
    private var _logger:ILogger;

    public function extend(context:IContext):void {
        _context = context;
        _logger = context.getLogger(this);
        _context.addConfigHandler(
                instanceOfType(ContextView),
                handleContextView);
    }

    private function handleContextView(contextView:ContextView):void {
        if (_contextView) {
            _logger.warn('A contextView has already been installed, ignoring {0}', [contextView.view]);
            return;
        }
        _contextView = contextView.view;
        if (_contextView.root) {
            initializeContext();
        } else {
            _logger.debug("Context root has not been created yet. Waiting...");
            _contextView.addEventListener(Event.ROOT_CREATED, onRootCreated);
        }
    }

    private function onRootCreated(event:Event):void {
        _contextView.removeEventListener(Event.ROOT_CREATED, onRootCreated);
        if (_contextView.root.stage) {
            initializeContext();
        } else {
            _logger.debug("Context view is not yet on stage. Waiting...");
            _contextView.root.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
        }
    }

    private function onAddedToStage(event:Event):void {
        _contextView.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
        initializeContext();
    }

    private function initializeContext():void {
        _logger.debug("Context view is now ready and on stage. Initializing context...");
        _context.initialize();
        _contextView.root.addEventListener(Event.REMOVED_FROM_STAGE, onRemovedFromStage);
    }

    private function onRemovedFromStage(event:Event):void {
        _logger.debug("Context view has left the stage. Destroying context...");
        _contextView.root.removeEventListener(Event.REMOVED_FROM_STAGE, onRemovedFromStage);
        _context.destroy();
    }
}
}
