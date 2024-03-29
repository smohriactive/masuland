package org.apache.flex.apps.loginexample.action.event
{	
	import org.apache.flex.apps.loginexample.data.vo.LayoutVO;
	
	import flash.events.Event;

	/**
	 * 
	 */
	public class LoadLayoutEvent extends Event
	{	
		//----------------------
		// Constants
		//----------------------
		
		public static const EVENT_NAME:String = 'LoadLayoutEvent.EVENT_NAME';
		
		//----------------------
		// Properties
		//----------------------
		
		public var layout:LayoutVO;
		
		//----------------------
		// Constructor
		//----------------------
		
		public function LoadLayoutEvent(layout:LayoutVO, bubbles:Boolean=true, cancelable:Boolean=true)
		{
			super(EVENT_NAME, bubbles, cancelable);
			
			this.layout = layout;
		}
		
		//----------------------
		// Methods
		//----------------------
		
		override public function clone():Event
		{
			return new LoadLayoutEvent(layout);
		}
	}
}
