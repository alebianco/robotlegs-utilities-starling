/**
 * Author:  Alessandro Bianco
 * Website: http://alessandrobianco.eu
 * Twitter: @alebianco
 * Created: 06/05/13 18.56
 *
 * Copyright © 2013 Alessandro Bianco
 */
package robotlegs.starling.bundles.mvcs {

import robotlegs.bender.extensions.enhancedLogging.InjectableLoggerExtension;
import robotlegs.bender.extensions.enhancedLogging.TraceLoggingExtension;
import robotlegs.bender.extensions.eventCommandMap.EventCommandMapExtension;
import robotlegs.bender.extensions.eventDispatcher.EventDispatcherExtension;
import robotlegs.bender.extensions.localEventMap.LocalEventMapExtension;
import robotlegs.bender.extensions.vigilance.VigilanceExtension;
import robotlegs.bender.framework.api.IBundle;
import robotlegs.bender.framework.api.IContext;
import robotlegs.bender.framework.api.LogLevel;
import robotlegs.starling.extensions.contextView.ContextViewExtension;
import robotlegs.starling.extensions.contextView.ContextViewListenerConfig;
import robotlegs.starling.extensions.contextView.StageSyncExtension;
import robotlegs.starling.extensions.mediatorMap.MediatorMapExtension;
import robotlegs.starling.extensions.viewManager.ManualStageObserverExtension;
import robotlegs.starling.extensions.viewManager.StageCrawlerExtension;
import robotlegs.starling.extensions.viewManager.StageObserverExtension;
import robotlegs.starling.extensions.viewManager.ViewManagerExtension;

public class StarlingBundle implements IBundle {
    public function extend(context:IContext):void {
        context.logLevel = LogLevel.DEBUG;

        context.install(
                TraceLoggingExtension,
                VigilanceExtension,
                InjectableLoggerExtension,
                ContextViewExtension,
                EventDispatcherExtension,
                //ModularityExtension,
                EventCommandMapExtension,
                LocalEventMapExtension,
                ViewManagerExtension,
                StageObserverExtension,
                ManualStageObserverExtension,
                MediatorMapExtension,
                StageCrawlerExtension,
                StageSyncExtension);

        context.configure(ContextViewListenerConfig);
    }
}
}
