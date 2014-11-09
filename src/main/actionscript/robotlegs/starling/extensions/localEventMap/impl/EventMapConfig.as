//------------------------------------------------------------------------------
//  Copyright (c) 2009-2013 the original author or authors. All Rights Reserved.
//
//  NOTICE: You are permitted to use, modify, and distribute this file
//  in accordance with the terms of the license agreement accompanying it.
//------------------------------------------------------------------------------

package robotlegs.starling.extensions.localEventMap.impl
{
	import starling.events.EventDispatcher;

	/**
	 * @private
	 */
	public class EventMapConfig
	{

		/*============================================================================*/
		/* Public Properties                                                          */
		/*============================================================================*/

		private var _dispatcher:EventDispatcher;

		/**
		 * @private
		 */
		public function get dispatcher():EventDispatcher
		{
			return _dispatcher;
		}

		private var _eventString:String;

		/**
		 * @private
		 */
		public function get eventString():String
		{
			return _eventString;
		}

		private var _listener:Function;

		/**
		 * @private
		 */
		public function get listener():Function
		{
			return _listener;
		}

		private var _eventClass:Class;

		/**
		 * @private
		 */
		public function get eventClass():Class
		{
			return _eventClass;
		}

		private var _callback:Function;

		/**
		 * @private
		 */
		public function get callback():Function
		{
			return _callback;
		}

		private var _useCapture:Boolean;

		/**
		 * @private
		 */
		public function get useCapture():Boolean
		{
			return _useCapture;
		}

		/*============================================================================*/
		/* Constructor                                                                */
		/*============================================================================*/

		/**
		 * @private
		 */
		public function EventMapConfig(
				dispatcher:EventDispatcher,
				eventString:String,
				listener:Function,
				eventClass:Class,
				callback:Function)
		{
			_dispatcher = dispatcher;
			_eventString = eventString;
			_listener = listener;
			_eventClass = eventClass;
			_callback = callback;
		}

		public function equalTo(
				dispatcher:EventDispatcher,
				eventString:String,
				listener:Function,
				eventClass:Class):Boolean
		{
			return _eventString == eventString
					&& _eventClass == eventClass
					&& _dispatcher == dispatcher
					&& _listener == listener;
		}
	}
}