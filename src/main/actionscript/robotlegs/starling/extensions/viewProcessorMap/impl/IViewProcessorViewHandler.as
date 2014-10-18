//------------------------------------------------------------------------------
//  Copyright (c) 2009-2013 the original author or authors. All Rights Reserved. 
// 
//  NOTICE: You are permitted to use, modify, and distribute this file 
//  in accordance with the terms of the license agreement accompanying it. 
//------------------------------------------------------------------------------

package robotlegs.starling.extensions.viewProcessorMap.impl {
import robotlegs.starling.extensions.viewProcessorMap.dsl.IViewProcessorMapping;

/**
 * @private
 */
public interface IViewProcessorViewHandler {
    /**
     * @private
     */
    function addMapping(mapping:IViewProcessorMapping):void;

    /**
     * @private
     */
    function removeMapping(mapping:IViewProcessorMapping):void;

    /**
     * @private
     */
    function processItem(item:Object, type:Class):void;

    /**
     * @private
     */
    function unprocessItem(item:Object, type:Class):void;
}
}
