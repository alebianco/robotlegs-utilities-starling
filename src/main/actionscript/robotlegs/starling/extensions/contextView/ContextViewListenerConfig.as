package robotlegs.starling.extensions.contextView {

import robotlegs.starling.extensions.viewManager.api.IViewManager;

public class ContextViewListenerConfig {

    [Inject]
    public var contextView:ContextView;

    [Inject]
    public var viewManager:IViewManager;

    [PostConstruct]
    public function init():void {
        viewManager.addContainer(contextView.view.stage);
    }
}
}
