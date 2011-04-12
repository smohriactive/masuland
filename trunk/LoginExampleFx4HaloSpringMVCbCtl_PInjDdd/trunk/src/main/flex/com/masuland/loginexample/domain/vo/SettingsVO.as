package com.masuland.loginexample.domain.vo
{
	import mx.collections.ArrayCollection;

	[Bindable]
	/**
	 * 
	 * @author Sebastian.Mohr (masuland@gmail.com)
	 */
	public class SettingsVO
	{
		public var name:String;
		public var description:String;
		public var version:String;
		public var date:Date;
		
		public var layouts:ArrayCollection;
		
		public function SettingsVO() {}
	}
}