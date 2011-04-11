package com.masuland.loginexample.view.cb
{
	import com.masuland.loginexample.vo.LayoutVO;

	public class AppViewCB
	{
		//----------------------
		// Properties
		//----------------------
		
		[Inject(name='appModel', property='isApplicationVisible')]
		[Bindable]
		public var isApplicationVisible:Boolean;

		[Inject(name='appModel', property='currentLayout')]
		[Bindable]
		public var currentLayout:LayoutVO;
		
		[Inject(name='appModel', property='settingsBoxState')]
		[Bindable]
		public var settingsBoxState:String;
	}
}