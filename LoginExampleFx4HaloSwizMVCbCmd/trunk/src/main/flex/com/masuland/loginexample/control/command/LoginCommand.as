package com.masuland.loginexample.control.command
{
	import com.masuland.loginexample.business.IAppDelegate;
	import com.masuland.loginexample.model.AppModel;
	import com.masuland.loginexample.state.AppStackState;
	import com.masuland.loginexample.state.LoginBoxState;
	import com.masuland.loginexample.vo.AuthenticationVO;
	import com.masuland.loginexample.vo.UserVO;
	
	import flash.events.Event;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.Responder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;

	public class LoginCommand
	{
		//----------------------
		// Properties
		//----------------------
		
		[Inject]
		public var appModel:AppModel;
		
		[Inject]
		public var appDelegate:IAppDelegate;
		
		//----------------------
		// Methods
		//----------------------
		
		[EventHandler(event='LoginEvent.EVENT_NAME', properties='auth')]
		public function login(auth:AuthenticationVO, nextEvent:Event=null):void
		{
			appModel.loginBoxState = LoginBoxState.LOGIN_PROGRESS;
			
			var token:AsyncToken = appDelegate.login(auth);
			token.addResponder(new Responder(login_resultHandler, login_faultHandler));
		}
		
		//----------------------
		// Handler
		//----------------------
		
		/**  */
		protected function login_resultHandler(event:ResultEvent):void
		{
			appModel.currentUser = UserVO( event.result );
			appModel.appStackState = AppStackState.USER;
			appModel.loginBoxState = LoginBoxState.HIDDEN;
		}
		
		/**  */
		protected function login_faultHandler(event:FaultEvent):void
		{
			appModel.loginBoxState = LoginBoxState.LOGIN;
		}
	}
}