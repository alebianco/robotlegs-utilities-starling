//------------------------------------------------------------------------------
//  Copyright (c) 2012 the original author or authors. All Rights Reserved. 
// 
//  NOTICE: You are permitted to use, modify, and distribute this file 
//  in accordance with the terms of the license agreement accompanying it. 
//------------------------------------------------------------------------------

package robotlegs.starling.extensions.mediatorMap.impl {
import robotlegs.starling.extensions.mediatorMap.dsl.IMediatorUnmapper;

/**
 * @private
 */
public class NullMediatorUnmapper implements IMediatorUnmapper {

    /*============================================================================*/
    /* Public Functions                                                           */
    /*============================================================================*/

    /**
     * @private
     */
    public function fromMediator(mediatorClass:Class):void {
    }

    /**
     * @private
     */
    public function fromAll():void {
    }
}
}
