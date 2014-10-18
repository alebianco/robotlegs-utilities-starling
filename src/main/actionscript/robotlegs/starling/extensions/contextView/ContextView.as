package robotlegs.starling.extensions.contextView {

import starling.core.Starling;

public class ContextView {

    private var _view:Starling;

    public function get view():Starling {
        return _view;
    }

    public function ContextView(view:Starling) {
        _view = view;
    }
}
}
