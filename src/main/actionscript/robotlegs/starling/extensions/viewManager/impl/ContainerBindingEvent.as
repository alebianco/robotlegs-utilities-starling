//------------------------------------------------------------------------------
//  Copyright (c) 2012 the original author or authors. All Rights Reserved. 
// 
//  NOTICE: You are permitted to use, modify, and distribute this file 
//  in accordance with the terms of the license agreement accompanying it. 
//------------------------------------------------------------------------------

package robotlegs.starling.extensions.viewManager.impl {
import starling.events.Event;

/**
 * @private
 */
public class ContainerBindingEvent extends Event {

    /*============================================================================*/
    /* Public Static Properties                                                   */
    /*============================================================================*/

    public static const BINDING_EMPTY:String = 'bindingEmpty';

    /*============================================================================*/
    /* Constructor                                                                */
    /*============================================================================*/

    /**
     * @private
     */
    public function ContainerBindingEvent(type:String) {
        super(type);
    }

}
}
