//------------------------------------------------------------------------------
//  Copyright (c) 2012 the original author or authors. All Rights Reserved. 
// 
//  NOTICE: You are permitted to use, modify, and distribute this file 
//  in accordance with the terms of the license agreement accompanying it. 
//------------------------------------------------------------------------------

package robotlegs.starling.extensions.viewManager.impl {
import starling.display.DisplayObjectContainer;
import starling.events.Event;

/**
 * Container existence event
 * @private
 */
public class ContainerRegistryEvent extends Event {

    /*============================================================================*/
    /* Public Static Properties                                                   */
    /*============================================================================*/

    public static const CONTAINER_ADD:String = 'containerAdd';

    public static const CONTAINER_REMOVE:String = 'containerRemove';

    public static const ROOT_CONTAINER_ADD:String = 'rootContainerAdd';

    public static const ROOT_CONTAINER_REMOVE:String = 'rootContainerRemove';

    /*============================================================================*/
    /* Public Properties                                                          */
    /*============================================================================*/

    /**
     * The container associated with this event
     */
    public function get container():DisplayObjectContainer {
        return data as DisplayObjectContainer;
    }

    /*============================================================================*/
    /* Constructor                                                                */
    /*============================================================================*/

    /**
     * Creates a new container existence event
     * @param type The event type
     * @param container The container associated with this event
     */
    public function ContainerRegistryEvent(type:String, container:DisplayObjectContainer) {
        super(type, false, container);
    }
}
}
