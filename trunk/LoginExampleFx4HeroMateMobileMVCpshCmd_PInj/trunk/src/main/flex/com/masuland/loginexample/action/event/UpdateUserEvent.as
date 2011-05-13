package com.masuland.loginexample.action.event
{	
	import com.masuland.loginexample.data.vo.UserVO;
	
	import flash.events.Event;

	/**
	 * @author masuland.com
	 */
	public class UpdateUserEvent extends Event
	{	
		//----------------------
		// Constants
		//----------------------
		
		public static const EVENT_NAME:String = 'UpdateUserEvent.EVENT_NAME';
		
		//----------------------
		// Properties
		//----------------------
		
		public var user:UserVO;
		
		//----------------------
		// Constructor
		//----------------------
		
		public function UpdateUserEvent(user:UserVO, bubbles:Boolean=true, cancelable:Boolean=false)
		{
			super(EVENT_NAME, bubbles, cancelable);
			
			this.user = user;
		}
		
		//----------------------
		// Methods
		//----------------------
		
		override public function clone():Event
		{
			return new UpdateUserEvent(user);
		}
	}
}
