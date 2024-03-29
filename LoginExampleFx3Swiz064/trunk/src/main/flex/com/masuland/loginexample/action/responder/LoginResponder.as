package com.masuland.loginexample.action.responder
{	
	import com.masuland.loginexample.data.AppModel;
	import com.masuland.loginexample.data.state.AppStackState;
	import com.masuland.loginexample.data.state.LoginBoxState;
	import com.masuland.loginexample.data.vo.UserVO;
	
	import flash.events.Event;
	
	import mx.rpc.IResponder;
	
	import org.swizframework.Swiz;

	/**
	 * @author masuland.com
	 */
	public class LoginResponder implements IResponder
	{
		//----------------------
		// Properties
		//----------------------
		
		[Bindable]
		[Autowire]
		public var appModel:AppModel;
		
		public var nextEvent:Event;
		
		//----------------------
		// Constructor
		//----------------------
		
		public function LoginResponder(nextEvent:Event = null) 
		{
			Swiz.autowire(this);
			
			this.nextEvent = nextEvent;
		}

		//----------------------
		// Methods
		//----------------------
		
		public function result(data:Object):void
		{
			appModel.currentUser = UserVO( data.result );
			appModel.appStackState = AppStackState.USER;
			appModel.loginBoxState = LoginBoxState.HIDDEN;
		}
		
		public function fault(info:Object):void
		{
			appModel.loginBoxState = LoginBoxState.LOGIN;
		}
	}
}