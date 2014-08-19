package mzed.framework.debug {
	import flash.display.*;
	import flash.events.*;
	import flash.text.*;
	import mzed.framework.*;
	
	/**
	 * The base for in-application windows like the debug window
	 * @author Mozzo
	 * http://www.mozzo.host56.com
	 */
	 
	public class MZ_Window extends Sprite {
		
		private var _head:Bitmap;
		private var _container:Bitmap;
		private var _title:TextField;
		
		private var _text:TextField;
		private var _textY:Number;
		
		private var flag:Boolean;
		private var _moveable:Boolean;
		
		
		/**
		 * Initialize window
		 * @param	title		Title of the window
		 * @param	width		Width of the window
		 * @param	height		Height of the window
		 * @param	moveable	Set if the window could be moved with the mouse
		 */
		public function MZ_Window(title:String, width:Number, height:Number, moveable:Boolean = true) {
			_moveable = moveable;
			_head = new Bitmap(new BitmapData(width, 20, true, 0x9f000000));
			addChild(_head);
			_container = new Bitmap(new BitmapData(width, height, true, 0x9f000000));
			addChild(_container);
			
			_title = new TextField();
			_title.defaultTextFormat = MZ_Util.format(18, 0xFFFFFF, "left");
			_title.selectable = false;
			_title.text = title;
			addChild(_title);

			addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
			addEventListener(MouseEvent.MOUSE_UP, onMouseUp);
			MZ_Base.stage.addEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);
		}
		
		/**
		 * Add text to the window
		 * @param	text	Text to display on window
		 * @param	y	Y position
		 */
		public function addText(text:TextField, y:Number = 0):void {
			text.y += _head.height + y;
			_text = text;
			_textY = y;
			addChild(text);
		}
		
		/*
		 * |
		 * |
		 * V
		 * 	Private functions....
		 * 	Should probably open these up for devs who want to alter the behaviour of moving the windows
		 */
		private function onMouseDown(e:Event):void {
			flag = true;
		}
		
		private function onMouseUp(e:Event):void {
			flag = false;
		}
		
		private function onMouseMove(e:Event):void {
			if(flag && _moveable){
				this.x = stage.mouseX;
				this.y = stage.mouseY;
			}
		}
	}
}