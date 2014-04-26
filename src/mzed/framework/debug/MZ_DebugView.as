package mzed.framework.debug {
	import flash.display.*;
	import mzed.framework.*;
	import flash.events.Event;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.utils.getTimer;
	import flash.system.System;
	
	/**
	 * ...
	 * @author Mozzo
	 * http://www.mozzo.host56.com
	 */
	 
	public class MZ_DebugView extends Sprite {		
		private var perf:MZ_Window;
		private var fpsText:TextField;
		private var fpsFrames:Number;
		private var fpsTime:Number;
		
		private var memoryText:TextField;
		private var objectText:TextField;
		
		public function MZ_DebugView() {
			init();
		}
		
		public function init():void {
			visible = false;
			fpsFrames = 0;
			fpsTime = getTimer();
			
			perf = new MZ_Window("Statistics", 100, 120);
			perf.x = MZ_Base.width - perf.width;
			addChild(perf);
			
			fpsText = new TextField();
			fpsText.defaultTextFormat = MZ_Util.format();
			fpsText.text = "FPS: ";
			perf.addText(fpsText);
			
			memoryText = new TextField();
			memoryText.defaultTextFormat = MZ_Util.format();
			memoryText.text = "MEM: ";
			perf.addText(memoryText, 20);
			
			objectText = new TextField();
			objectText.defaultTextFormat = MZ_Util.format();
			objectText.text = "OBJ: ";
			perf.addText(objectText, 40);
		}
		
		public function update():void {
			if (MZ_Base.keys.justPressed("J")) {
				this.visible = !this.visible;
			}
			updateStats();
		}
		
		private function updateStats():void {
			var currentTime:Number = (getTimer() - fpsTime) / 1000;
            fpsFrames++;
			
            if (currentTime > 0.5) {
				fpsText.text = "FPS: " + (Math.floor((fpsFrames / currentTime) * 10) / 10);
				memoryText.text = "MEM: " + Number((System.totalMemory * 0.000000954).toFixed(2)) + "MB";
				objectText.text = "OBJ: " + MZ_Base.camera.numChildren;
				
                fpsTime = getTimer();
                fpsFrames = 0;
            }
		}
	}
}