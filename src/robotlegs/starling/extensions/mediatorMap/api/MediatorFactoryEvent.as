//------------------------------------------------------------------------------
//  Copyright (c) 2012 the original author or authors. All Rights Reserved. 
// 
//  NOTICE: You are permitted to use, modify, and distribute this file 
//  in accordance with the terms of the license agreement accompanying it. 
//------------------------------------------------------------------------------

package robotlegs.starling.extensions.mediatorMap.api {
import starling.events.Event;

/**
 * Mediator Existence Event
 * @private
 */
public class MediatorFactoryEvent extends Event {

    /*============================================================================*/
    /* Public Static Properties                                                   */
    /*============================================================================*/

    public static const MEDIATOR_CREATE:String = 'mediatorCreate';

    public static const MEDIATOR_REMOVE:String = 'mediatorRemove';

    /*============================================================================*/
    /* Public Properties                                                          */
    /*============================================================================*/

    /**
     * The mediator instance associated with this event
     */
    public function get mediator():Object {
        return data.mediator;
    }

    /**
     * The mediated item associated with this event
     */
    public function get mediatedItem():Object {
        return data.mediatedItem;
    }

    /**
     * The mediator mapping associated with this event
     */
    public function get mapping():IMediatorMapping {
        return data.mapping;
    }

    /**
     * The mediator factory associated with this event
     */
    public function get factory():IMediatorFactory {
        return data.factory;
    }

    /*============================================================================*/
    /* Constructor                                                                */
    /*============================================================================*/

    /**
     * Creates a Mediator Existence Event
     * @param type
     * @param mediator
     * @param mediatedItem
     * @param mapping
     * @param factory
     */
    public function MediatorFactoryEvent(type:String, mediator:Object, mediatedItem:Object, mapping:IMediatorMapping, factory:IMediatorFactory) {
        super(type, false, {
            mediator: mediator,
            mediatedItem: mediatedItem,
            mapping: mapping,
            factory: factory
        })
    }
}
}
