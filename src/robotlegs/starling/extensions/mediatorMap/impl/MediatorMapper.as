//------------------------------------------------------------------------------
//  Copyright (c) 2012 the original author or authors. All Rights Reserved. 
// 
//  NOTICE: You are permitted to use, modify, and distribute this file 
//  in accordance with the terms of the license agreement accompanying it. 
//------------------------------------------------------------------------------

package robotlegs.starling.extensions.mediatorMap.impl {
import flash.utils.Dictionary;

import robotlegs.bender.extensions.matching.ITypeFilter;
import robotlegs.bender.framework.api.ILogger;
import robotlegs.starling.extensions.mediatorMap.api.IMediatorMapping;
import robotlegs.starling.extensions.mediatorMap.api.IMediatorViewHandler;
import robotlegs.starling.extensions.mediatorMap.dsl.IMediatorMapper;
import robotlegs.starling.extensions.mediatorMap.dsl.IMediatorMappingConfig;
import robotlegs.starling.extensions.mediatorMap.dsl.IMediatorUnmapper;

/**
 * @private
 */
public class MediatorMapper implements IMediatorMapper, IMediatorUnmapper {

    /*============================================================================*/
    /* Private Properties                                                         */
    /*============================================================================*/

    private const _mappings:Dictionary = new Dictionary();

    private var _typeFilter:ITypeFilter;

    private var _handler:IMediatorViewHandler;

    private var _logger:ILogger;

    /*============================================================================*/
    /* Constructor                                                                */
    /*============================================================================*/

    /**
     * @private
     */
    public function MediatorMapper(typeFilter:ITypeFilter, handler:IMediatorViewHandler, logger:ILogger = null) {
        _typeFilter = typeFilter;
        _handler = handler;
        _logger = logger;
    }

    /*============================================================================*/
    /* Public Functions                                                           */
    /*============================================================================*/

    /**
     * @inheritDoc
     */
    public function toMediator(mediatorClass:Class):IMediatorMappingConfig {
        const mapping:IMediatorMapping = _mappings[mediatorClass];
        return mapping
                ? overwriteMapping(mapping)
                : createMapping(mediatorClass);
    }

    /**
     * @inheritDoc
     */
    public function fromMediator(mediatorClass:Class):void {
        const mapping:IMediatorMapping = _mappings[mediatorClass];
        mapping && deleteMapping(mapping);
    }

    /**
     * @inheritDoc
     */
    public function fromAll():void {
        for each (var mapping:IMediatorMapping in _mappings) {
            deleteMapping(mapping);
        }
    }

    /*============================================================================*/
    /* Private Functions                                                          */
    /*============================================================================*/

    private function createMapping(mediatorClass:Class):MediatorMapping {
        const mapping:MediatorMapping = new MediatorMapping(_typeFilter, mediatorClass);
        _handler.addMapping(mapping);
        _mappings[mediatorClass] = mapping;
        _logger && _logger.debug('{0} mapped to {1}', [_typeFilter, mapping]);
        return mapping;
    }

    private function deleteMapping(mapping:IMediatorMapping):void {
        _handler.removeMapping(mapping);
        delete _mappings[mapping.mediatorClass];
        _logger && _logger.debug('{0} unmapped from {1}', [_typeFilter, mapping]);
    }

    private function overwriteMapping(mapping:IMediatorMapping):IMediatorMappingConfig {
        _logger && _logger.warn('{0} already mapped to {1}\n' +
                'If you have overridden this mapping intentionally you can use "unmap()" ' +
                'prior to your replacement mapping in order to avoid seeing this message.\n',
                [_typeFilter, mapping]);
        deleteMapping(mapping);
        return createMapping(mapping.mediatorClass);
    }
}
}
