package mzed.framework.core {
	import flash.display.*;
	import flash.events.*;
	import flash.text.*;
	import flash.utils.*;
	
	import mzed.framework.*;
	
	/**
	 * ...
	 * @author Mozzo
	 */
	public class MZ_Preloader extends Sprite {
		
		protected var _text:TextField;
		
		protected var displayTime:Number;
		
		private var tmp:Bitmap;
		
		protected var className:String;
		
		public function MZ_Preloader() {
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			displayTime = 2000;
			
			tmp = new Bitmap(new BitmapData(stage.stageWidth,stage.stageHeight,true,0xFF000000));
			addChild(tmp);
			
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		
		public function onEnterFrame(e:Event):void {
			var time:uint = getTimer();
			if (time > displayTime) {
				//Load main class
				var mainClass:Class = Class(getDefinitionByName(className));
	            if(mainClass) {
	                var app:Object = new mainClass();
	                addChild(app as DisplayObject);
	            }
				destroy();
			}else {
				_text = new TextField();
				_text.defaultTextFormat = new TextFormat("Arial", 28, 0xFFFFFF, true);
				_text.x = 40;
				_text.y = 40;
				_text.width = 1000;
				_text.text = "Powered By:";
				addChild(_text);
			}
		}
		
		public function destroy():void {
			tmp = null;
			_text = null;
		}
	}
}