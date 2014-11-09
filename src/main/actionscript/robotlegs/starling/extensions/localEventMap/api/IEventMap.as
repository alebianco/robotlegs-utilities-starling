//------------------------------------------------------------------------------
//  Copyright (c) 2009-2013 the original author or authors. All Rights Reserved.
//
//  NOTICE: You are permitted to use, modify, and distribute this file
//  in accordance with the terms of the license agreement accompanying it.
//------------------------------------------------------------------------------

package robotlegs.starling.extensions.localEventMap.api
{
	import starling.events.EventDispatcher;

	/**
	 * The Event Map keeps track of listeners and provides the ability
	 * to unregister all listeners with a single method call.
	 */
	public interface IEventMap
	{
		/**
		 * The same as calling <code>addEventListener</code> directly on the <code>IEventDispatcher</code>,
		 * but keeps a list of listeners for easy (usually automatic) removal.
		 *
		 * @param dispatcher The <code>IEventDispatcher</code> to listen to
		 * @param type The <code>Event</code> type to listen for
		 * @param listener The <code>Event</code> handler
		 * @param eventClass Optional Event class for a stronger mapping. Defaults to <code>flash.events.Event</code>.
		 */
		function mapListener(dispatcher:EventDispatcher, type:String, listener:Function, eventClass:Class = null):void;

		/**
		 * The same as calling <code>removeEventListener</code> directly on the <code>IEventDispatcher</code>,
		 * but updates our local list of listeners.
		 *
		 * @param dispatcher The <code>IEventDispatcher</code>
		 * @param type The <code>Event</code> type
		 * @param listener The <code>Event</code> handler
		 * @param eventClass Optional Event class for a stronger mapping. Defaults to <code>flash.events.Event</code>.
		 */
		function unmapListener(dispatcher:EventDispatcher, type:String, listener:Function, eventClass:Class = null):void;

		/**
		 * Removes all listeners registered through <code>mapListener</code>
		 */
		function unmapListeners():void;

		/**
		 * Suspends all listeners registered through <code>mapListener</code>
		 */
		function suspend():void;

		/**
		 * Resumes all listeners registered through <code>mapListener</code>
		 */
		function resume():void;
	}
}