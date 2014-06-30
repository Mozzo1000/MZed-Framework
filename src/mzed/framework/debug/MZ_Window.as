package mzed.framework.debug {
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.text.TextField;
	import mzed.framework.*;
	
	/**
	 * ...
	 * @author Mozzo
	 * http://www.mozzo.host56.com
	 */
	 
	public class MZ_Window extends Sprite{
		
		private var _head:Bitmap;
		private var _container:Bitmap;
		private var _title:TextField;
		
		public function MZ_Window(title:String, width:Number, height:Number) {
			_head = new Bitmap(new BitmapData(width, 20, true, 0x7f000000));
			addChild(_head);
			_container = new Bitmap(new BitmapData(width, height, true, 0x7f7f7f7f));
			addChild(_container);
			
			_title = new TextField();
			_title.defaultTextFormat = MZ_Util.format(18, 0xFFFFFF, "left");
			_title.text = title;
			addChild(_title);
		}
		
		public function addText(text:TextField, y:Number = 0):void {
			text.y += _head.height + y;
			addChild(text);
		}
	}
}