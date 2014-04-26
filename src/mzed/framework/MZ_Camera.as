package mzed.framework {
	import flash.display.Sprite;
	import mzed.framework.render.MZ_Object;
	import flash.display.Bitmap;
	import flash.geom.Point;
	import flash.geom.*;
	
	/**
	 * ...
	 * @author Mozzo
	 * http://www.mozzo.host56.com
	 */
	
	public class MZ_Camera extends Sprite {
		
		public var viewWidth:Number;
		public var viewHeight:Number;

		public var viewX:Number;
		public var viewY:Number;
		
		public var zoom:Number;

		public function MZ_Camera() {
			viewWidth = MZ_Base.width;
			viewHeight = MZ_Base.height;			
			viewX = 0;
			viewY = 0;
		}
		
		public function update():void {
			//trace("X: " + x + " Y: " + y);
			if(MZ_Base.debug.visible) {
				if(MZ_Base.keys.A) {
					viewX -= 10;
				}
				if(MZ_Base.keys.D) {
					viewX += 10;
				}
				if(MZ_Base.keys.W) {
					viewY -= 10;
				}
				if(MZ_Base.keys.S) {
					viewY += 10;
				}
			}
			
			x = -viewX;
			y = -viewY;
		}
	}
}