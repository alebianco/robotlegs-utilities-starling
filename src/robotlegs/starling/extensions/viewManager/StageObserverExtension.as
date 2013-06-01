//------------------------------------------------------------------------------
//  Copyright (c) 2012 the original author or authors. All Rights Reserved. 
// 
//  NOTICE: You are permitted to use, modify, and distribute this file 
//  in accordance with the terms of the license agreement accompanying it. 
//------------------------------------------------------------------------------

package robotlegs.starling.extensions.viewManager {
import org.swiftsuspenders.Injector;

import robotlegs.bender.framework.api.IContext;
import robotlegs.bender.framework.api.IExtension;
import robotlegs.bender.framework.api.ILogger;
import robotlegs.starling.extensions.viewManager.impl.ContainerRegistry;
import robotlegs.starling.extensions.viewManager.impl.StageObserver;

/**
 * This extension install an automatic Stage Observer
 */
public class StageObserverExtension implements IExtension {

    /*============================================================================*/
    /* Private Static Properties                                                  */
    /*============================================================================*/

    // Really? Yes, there can be only one.
    private static var _stageObserver:StageObserver;

    private static var _installCount:uint;

    /*============================================================================*/
    /* Private Properties                                                         */
    /*============================================================================*/

    private var _injector:Injector;

    private var _logger:ILogger;

    /*============================================================================*/
    /* Public Functions                                                           */
    /*============================================================================*/

    /**
     * @inheritDoc
     */
    public function extend(context:IContext):void {
        context.whenInitializing(whenInitializing);
        context.whenDestroying(whenDestroying);
        _installCount++;
        _injector = context.injector;
        _logger = context.getLogger(this);
    }

    /*============================================================================*/
    /* Private Functions                                                          */
    /*============================================================================*/

    private function whenInitializing():void {
        // Hark, an actual Singleton!
        if (!_stageObserver) {
            const containerRegistry:ContainerRegistry = _injector.getInstance(ContainerRegistry);
            _logger.debug("Creating genuine StageObserver Singleton");
            _stageObserver = new StageObserver(containerRegistry);
        }
    }

    private function whenDestroying():void {
        _installCount--;
        if (_installCount == 0) {
            _logger.debug("Destroying genuine StageObserver Singleton");
            _stageObserver.destroy();
            _stageObserver = null;
        }
    }
}
}
