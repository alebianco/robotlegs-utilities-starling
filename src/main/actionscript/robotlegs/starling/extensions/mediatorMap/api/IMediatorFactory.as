//------------------------------------------------------------------------------
//  Copyright (c) 2012 the original author or authors. All Rights Reserved. 
// 
//  NOTICE: You are permitted to use, modify, and distribute this file 
//  in accordance with the terms of the license agreement accompanying it. 
//------------------------------------------------------------------------------

package robotlegs.starling.extensions.mediatorMap.api {

[Event(name="mediatorCreate", type="robotlegs.starling.extensions.mediatorMap.api.MediatorFactoryEvent")]
[Event(name="mediatorRemove", type="robotlegs.starling.extensions.mediatorMap.api.MediatorFactoryEvent")]
/**
 * @private
 */
public interface IMediatorFactory {

    function addEventListener(type:String, listener:Function):void;

    function removeEventListener(type:String, listener:Function):void;

    /**
     * @private
     */
    function getMediator(view:Object, mapping:IMediatorMapping):Object;

    /**
     * @private
     */
    function createMediators(view:Object, type:Class, mappings:Array):Array;

    /**
     * @private
     */
    function removeMediators(view:Object):void;

    /**
     * @private
     */
    function removeAllMediators():void;
}
}
