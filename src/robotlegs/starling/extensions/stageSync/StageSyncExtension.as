/**
 * Author:  Alessandro Bianco
 * Website: http://alessandrobianco.eu
 * Twitter: @alebianco
 * Created: 06/05/13 19.22
 *
 * Copyright © 2013 Alessandro Bianco
 */
package robotlegs.starling.extensions.stageSync {

import robotlegs.bender.extensions.utils.instanceOfType;
import robotlegs.bender.framework.api.IContext;
import robotlegs.bender.framework.api.IExtension;
import robotlegs.bender.framework.api.ILogger;
import robotlegs.starling.extensions.contextView.ContextView;

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
        if (_contextView.stage.numChildren > 0) {
            initializeContext();
        } else {
            _logger.debug("Context view is not yet on stage. Waiting...");
            _contextView.addEventListener(Event.CONTEXT3D_CREATE, onContextCreated);
        }
    }

    private function onContextCreated(event:Event):void {
        _logger.debug("Starling context view added on stage.");
        initializeContext();
    }

    private function initializeContext():void {
        _logger.debug("Context view is now on stage. Initializing context...");
        _context.initialize();
        // TODO detect dispose
    }
}
}
