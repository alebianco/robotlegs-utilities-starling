//------------------------------------------------------------------------------
//  Copyright (c) 2009-2013 the original author or authors. All Rights Reserved.
//
//  NOTICE: You are permitted to use, modify, and distribute this file
//  in accordance with the terms of the license agreement accompanying it.
//------------------------------------------------------------------------------

package robotlegs.starling.extensions.localEventMap.impl
{
	import starling.events.EventDispatcher;
	import flash.events.IEventDispatcher;

	import starling.events.Event;
	import robotlegs.starling.extensions.localEventMap.api.IEventMap;

	/**
	 * @private
	 */
	public class EventMap implements IEventMap
	{

		/*============================================================================*/
		/* Private Properties                                                         */
		/*============================================================================*/

		private const _listeners:Vector.<EventMapConfig> = new Vector.<EventMapConfig>();

		private const _suspendedListeners:Vector.<EventMapConfig> = new Vector.<EventMapConfig>();

		private var _suspended:Boolean = false;

		/*============================================================================*/
		/* Public Functions                                                           */
		/*============================================================================*/

		/**
		 * @inheritDoc
		 */
		public function mapListener(
				dispatcher:EventDispatcher,
				eventString:String,
				listener:Function,
				eventClass:Class = null):void
		{
			eventClass ||= Event;

			const currentListeners:Vector.<EventMapConfig> = _suspended
					? _suspendedListeners
					: _listeners;

			var config:EventMapConfig;

			var i:int = currentListeners.length;
			while (i--)
			{
				config = currentListeners[i];
				if (config.equalTo(dispatcher, eventString, listener, eventClass))
				{
					return;
				}
			}

			const callback:Function = eventClass == Event
					? listener
					: function(event:Event):void
			{
				routeEventToListener(event, listener, eventClass);
			};

			config = new EventMapConfig(dispatcher,
					eventString,
					listener,
					eventClass,
					callback);

			currentListeners.push(config);

			if (!_suspended)
			{
				dispatcher.addEventListener(eventString, callback);
			}
		}

		/**
		 * @inheritDoc
		 */
		public function unmapListener(
				dispatcher:EventDispatcher,
				eventString:String,
				listener:Function,
				eventClass:Class = null):void
		{
			eventClass ||= Event;

			const currentListeners:Vector.<EventMapConfig> = _suspended
					? _suspendedListeners
					: _listeners;

			var i:int = currentListeners.length;
			while (i--)
			{
				var config:EventMapConfig = currentListeners[i];
				if (config.equalTo(dispatcher, eventString, listener, eventClass))
				{
					if (!_suspended)
					{
						dispatcher.removeEventListener(eventString, config.callback);
					}
					currentListeners.splice(i, 1);
					return;
				}
			}
		}

		/**
		 * @inheritDoc
		 */
		public function unmapListeners():void
		{
			const currentListeners:Vector.<EventMapConfig> = _suspended ? _suspendedListeners : _listeners;

			var eventConfig:EventMapConfig;
			var dispatcher:EventDispatcher;
			while (eventConfig = currentListeners.pop())
			{
				if (!_suspended)
				{
					dispatcher = eventConfig.dispatcher;
					dispatcher.removeEventListener(eventConfig.eventString, eventConfig.callback);
				}
			}
		}

		/**
		 * @inheritDoc
		 */
		public function suspend():void
		{
			if (_suspended)
				return;

			_suspended = true;

			var eventConfig:EventMapConfig;
			var dispatcher:EventDispatcher;
			while (eventConfig = _listeners.pop())
			{
				dispatcher = eventConfig.dispatcher;
				dispatcher.removeEventListener(eventConfig.eventString, eventConfig.callback);
				_suspendedListeners.push(eventConfig);
			}
		}

		/**
		 * @inheritDoc
		 */
		public function resume():void
		{
			if (!_suspended)
				return;

			_suspended = false;

			var eventConfig:EventMapConfig;
			var dispatcher:EventDispatcher;
			while (eventConfig = _suspendedListeners.pop())
			{
				dispatcher = eventConfig.dispatcher;
				dispatcher.addEventListener(eventConfig.eventString, eventConfig.callback);
				_listeners.push(eventConfig);
			}
		}

		/*============================================================================*/
		/* Protected Functions                                                        */
		/*============================================================================*/

		/**
		 * Event Handler
		 *
		 * @param event The <code>Event</code>
		 * @param listener
		 * @param originalEventClass
		 */
		protected function routeEventToListener(event:Event, listener:Function, originalEventClass:Class):void
		{
			if (event is originalEventClass)
			{
				listener(event);
			}
		}
	}
}