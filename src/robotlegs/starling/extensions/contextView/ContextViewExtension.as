package robotlegs.starling.extensions.contextView {

import robotlegs.bender.extensions.matching.instanceOfType;
import robotlegs.bender.framework.api.IContext;
import robotlegs.bender.framework.api.IExtension;
import robotlegs.bender.framework.api.IInjector;
import robotlegs.bender.framework.api.ILogger;

public class ContextViewExtension implements IExtension {

    private var _injector:IInjector;
    private var _logger:ILogger;

    public function extend(context:IContext):void {
        _injector = context.injector;
        _logger = context.getLogger(this);
        context.beforeInitializing(beforeInitializing);
        context.addConfigHandler(instanceOfType(ContextView), handleContextView);
    }

    private function handleContextView(contextView:ContextView):void {
        if (_injector.hasDirectMapping(ContextView)) {
            _logger.warn('A contextView has already been installed, ignoring {0}', [contextView.view]);
        }
        else {
            _logger.debug("Mapping {0} as contextView", [contextView.view]);
            _injector.map(ContextView).toValue(contextView);
        }
    }

    private function beforeInitializing():void {
        if (!_injector.hasDirectMapping(ContextView)) {
            _logger.error("A ContextView must be installed if you install the ContextViewExtension.");
        }
    }
}
}
