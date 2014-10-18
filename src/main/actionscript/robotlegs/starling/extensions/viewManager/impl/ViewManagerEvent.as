//------------------------------------------------------------------------------
//  Copyright (c) 2012 the original author or authors. All Rights Reserved. 
// 
//  NOTICE: You are permitted to use, modify, and distribute this file 
//  in accordance with the terms of the license agreement accompanying it. 
//------------------------------------------------------------------------------

package robotlegs.starling.extensions.viewManager.impl {
import robotlegs.starling.extensions.viewManager.api.IViewHandler;

import starling.display.DisplayObjectContainer;
import starling.events.Event;

/**
 * Container existence event
 * @private
 */
public class ViewManagerEvent extends Event {

    /*============================================================================*/
    /* Public Static Properties                                                   */
    /*============================================================================*/

    public static const CONTAINER_ADD:String = 'containerAdd';

    public static const CONTAINER_REMOVE:String = 'containerRemove';

    public static const HANDLER_ADD:String = 'handlerAdd';

    public static const HANDLER_REMOVE:String = 'handlerRemove';

    /*============================================================================*/
    /* Public Properties                                                          */
    /*============================================================================*/

    /**
     * The container associated with this event
     */
    public function get container():DisplayObjectContainer {
        return data.container as DisplayObjectContainer;
    }

    /**
     * The view handler associated with this event
     */
    public function get handler():IViewHandler {
        return data.handler as IViewHandler;
    }

    /*============================================================================*/
    /* Constructor                                                                */
    /*============================================================================*/

    /**
     * Creates a view manager event
     * @param type The event type
     * @param container The container associated with this event
     * @param handler The view handler associated with this event
     */
    public function ViewManagerEvent(type:String, container:DisplayObjectContainer = null, handler:IViewHandler = null) {
        super(type, false, {container: container, handler: handler});
    }
}
}
