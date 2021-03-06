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
		
		public function MZ_Preloader(path:String) {
			className = path;
			trace("Preloader loaded!");
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			displayTime = 2000;
			
			tmp = new Bitmap(new BitmapData(stage.stageWidth,stage.stageHeight,true,0xFF000000));
			addChild(tmp);
			
			addEventListener(ProgressEvent.PROGRESS, onProgress);
		}
		
		public function onProgress(e:ProgressEvent):void {
			_text = new TextField();
			_text.defaultTextFormat = new TextFormat("Arial", 28, 0xFFFFFF, true);
			_text.x = 40;
			_text.y = 40;
			_text.width = 1000;
			_text.text = "Powered By:";
			addChild(_text);
			
			var percent:Number = Math.round(e.bytesLoaded / e.bytesTotal * 100);
			if(percent >= 100){
				removeEventListener(ProgressEvent.PROGRESS, onProgress);
				onLoaded();
			}
		}
		
		public function onLoaded():void {
			//Load main class
			var mainClass:Class = Class(getDefinitionByName(className));
	        if(mainClass) {
	        	var app:Object = new mainClass();
				addChild(app as DisplayObject);
			}
			destroy();
		}
		
		public function destroy():void {
			tmp = null;
			_text = null;
		}
	}
}