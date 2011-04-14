package com.masuland.loginexample.view.cb
{
	import com.masuland.loginexample.control.event.LoadLayoutEvent;
	import com.masuland.loginexample.control.event.LoadLocaleEvent;
	import com.masuland.loginexample.control.event.LoadStyleEvent;
	import com.masuland.loginexample.model.AppModel;
	import com.masuland.loginexample.state.SettingsBoxState;
	import com.masuland.loginexample.vo.LayoutVO;
	import com.masuland.loginexample.vo.LocaleVO;
	import com.masuland.loginexample.vo.SettingsVO;
	import com.masuland.loginexample.vo.StyleVO;
	
	import flash.events.IEventDispatcher;

	public class SettingsBoxCB
	{
		//----------------------
		// Properties
		//----------------------
		
		[Inject]
		[Bindable]
		public var appModel:AppModel;
		
		[Inject(source="appModel.settings", bind="true")]
		[Bindable]
		public var settings:SettingsVO;
		
		[Inject(source="appModel.currentLayout", bind="true")]
		[Bindable]
		public var currentLayout:LayoutVO;
		
		[Inject(source="appModel.currentStyle", bind="true")]
		[Bindable]
		public var currentStyle:StyleVO;
		
		[Inject(source="appModel.currentLocale", bind="true")]
		[Bindable]
		public var currentLocale:LocaleVO;
		
		[Inject(source="appModel.settingsBoxState", bind="true")]
		[Bindable]
		public var settingsBoxState:String;

		[Dispatcher]
		public var dispatcher:IEventDispatcher;
		
		//----------------------
		// Methods
		//----------------------
		
		public function toggleSettingsBox():void
		{
			if (appModel.settingsBoxState == SettingsBoxState.CLOSED)
			{
				appModel.settingsBoxState = SettingsBoxState.OPEN;
			}
			else
			{
				appModel.settingsBoxState = SettingsBoxState.CLOSED;
			}
		}

		public function loadStyle(style:StyleVO):void
		{
			dispatcher.dispatchEvent(new LoadStyleEvent(style));
		}
		
		public function loadLayout(layout:LayoutVO):void
		{
			dispatcher.dispatchEvent(new LoadLayoutEvent(layout));
		}
		
		public function loadLocale(locale:LocaleVO):void
		{
			dispatcher.dispatchEvent(new LoadLocaleEvent(locale));
		}
	}
}