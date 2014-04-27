package mzed.framework.render {
	import flash.display.Sprite;
	import flash.geom.Rectangle;
	import mzed.framework.*;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.geom.Point;
	import flash.geom.Matrix;
	import mzed.framework.core.MZ_AnimHandler;
	
	/**
	 * ...
	 * @author Mozzo
	 * http://www.mozzo.host56.com
	 */
	
	public class MZ_Object {
		public var _x:Number;
		public var _y:Number;
		public var bit:Bitmap;
		
		public var scaleX:Number;
		public var scaleY:Number;
		
		public var _width:Number;
		public var _height:Number;
		
		private var playing:Boolean;
		private var _buffer:BitmapData;
		private var _rect:Rectangle;
		private var _point:Point;
		private var _frame:int;
		private var _sprite:Class;
		private var _looped:Boolean;
		private var _animationName:String;
		private var _animations:Array;
		private var _curAnimation:MZ_AnimHandler;
		
		private var objClass:MZ_Object;
		
		public function MZ_Object(spriteX:Number = 0, spriteY:Number = 0, sprite:Class = null) {
			if (sprite == null) {
				bit  = new Bitmap();
			}else {
				bit = new sprite();
				_sprite = sprite;
			}
			_x = spriteX;
			_y = spriteY;
			bit.x = _x;
			bit.y = _y;
			bit.scaleX = bit.scaleY = MZ_Base.camera.zoom;
			objClass = this;
		}
		
		public function applyTexture(sprite:Class, width:Number, height:Number):void {
			bit = new sprite();
			_sprite = sprite;
			
			_width = width;
			_height = height;
			
			_buffer = bit.bitmapData.clone();
			
			_animations = new Array();
			_curAnimation = null;
			
			_rect = new Rectangle(width, 0, _buffer.width, height);
			_point = new Point(width, 0);
			playing = false;
			bit.bitmapData.copyPixels(_buffer, _rect, _point);
			bit.bitmapData.fillRect(_rect, 0);
			bit.scaleX = bit.scaleY = MZ_Base.camera.zoom;
			trace("WIDTH: " + width);
			trace("HEIGHT: " + height);
		}
		
		public function addAnimation(name:String, start:int, end:int, looped:Boolean):void {
			_animations.push(new MZ_AnimHandler(name, start, end, looped));
			_frame++;
		}
		
		public function play(name:String):void {
			var i:uint = 0;
			var l:uint = _animations.length;
			while(i < l) {
				if(_animations[i].name == name) {
					_curAnimation = _animations[i];
					if(_frame < _curAnimation.end) {
						trace("Frame: " + _frame);
						playing = true;
						_frame++;
						draw();
					}
					if(_frame >= _curAnimation.end && _curAnimation.looped) {
						_frame = _curAnimation.start;
					}
				}
				i++;
			}
		}
		
		public function gotoFrame(frame:int):void {
			_frame = (frame) + 1;
			draw();
		}
		
		public function draw():void {
			_rect = new Rectangle((_frame - 1) * _width, 0, _width, _height);
			_point = new Point(_width - _width, 0);
			bit.bitmapData.copyPixels(_buffer, _rect, _point);
		}
		
		public function set x(x:Number):void {
			bit.x += x;
		}
		public function set y(y:Number):void {
			bit.y = y;
		}
		
		public function collide(object:MZ_Object):void {
			var _rect1:Rectangle = bit.getBounds(bit);
			var _rect2:Rectangle = object.bit.getBounds(object.bit);
			var _offset1:Matrix = bit.transform.matrix;
			var _offset2:Matrix = object.bit.transform.matrix;
			
			var _bitData1:BitmapData = new BitmapData(_rect1.width, _rect1.height, true, 0);
			var _bitData2:BitmapData = new BitmapData(_rect2.width, _rect2.height, true, 0);
			
			var _point1:Point = new Point(_rect1.x, _rect1.y);
			var _point2:Point = new Point(_rect2.x, _rect2.y);
			
			_offset1.tx = bit.x - object.bit.x;
			_offset1.ty = bit.y - object.bit.y;
			_offset2.tx = object.bit.x - object.bit.x;
			_offset2.ty = object.bit.y - object.bit.y;
			
			_bitData1.draw(bit, _offset1);
			_bitData2.draw(object.bit, _offset2);
			
			if (_bitData2.hitTest(_point1, 255, _bitData1, _point2, 255)) {
				trace("Hit!");
			}
			
			_bitData1.dispose();
			_bitData2.dispose();
		}
		
		public function update():void {
			
		}
		
		public function destroy():void {
			trace("DESTROYED!");
			bit.bitmapData = null;
			bit = null;
			_buffer = null;
			_rect = null;
			_point = null;
			_sprite = null;
			objClass = null;
		}
	}
}