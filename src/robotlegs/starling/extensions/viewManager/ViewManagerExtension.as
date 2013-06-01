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
import robotlegs.starling.extensions.viewManager.api.IViewManager;
import robotlegs.starling.extensions.viewManager.impl.ContainerRegistry;
import robotlegs.starling.extensions.viewManager.impl.ViewManager;

/**
 * This extension install a View Manager into the context
 */
public class ViewManagerExtension implements IExtension {

    /*============================================================================*/
    /* Private Static Properties                                                  */
    /*============================================================================*/

    // Really? Yes, there can be only one.
    private static var _containerRegistry:ContainerRegistry;

    /*============================================================================*/
    /* Private Properties                                                         */
    /*============================================================================*/

    private var _injector:Injector;

    private var _viewManager:IViewManager;

    /*============================================================================*/
    /* Public Functions                                                           */
    /*============================================================================*/

    /**
     * @inheritDoc
     */
    public function extend(context:IContext):void {
        context.whenInitializing(whenInitializing);
        context.whenDestroying(whenDestroying);

        _injector = context.injector;

        // Just one Container Registry
        _containerRegistry ||= new ContainerRegistry();
        _injector.map(ContainerRegistry).toValue(_containerRegistry);

        // But you get your own View Manager
        _injector.map(IViewManager).toSingleton(ViewManager);
    }

    /*============================================================================*/
    /* Private Functions                                                          */
    /*============================================================================*/

    private function whenInitializing():void {
        _viewManager = _injector.getInstance(IViewManager);
    }

    private function whenDestroying():void {
        _viewManager.removeAllHandlers();
        _injector.unmap(IViewManager);
        _injector.unmap(ContainerRegistry);
    }
}
}
