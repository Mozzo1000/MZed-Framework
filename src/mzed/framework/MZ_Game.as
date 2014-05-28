package mzed.framework {
	import mzed.framework.debug.*;
	import mzed.framework.render.MZ_Object;
	import flash.ui.Keyboard;
	import flash.events.*;
	import flash.display.*;

	/**
	 * MZ_Game should only be used once to initialize your game
	 * You shouldn't even bother that this class is here
	 * @author Mozzo
	 * http://www.mozzo.host56.com
	 */
	 
	public class MZ_Game extends Sprite {
		internal var _reqState:MZ_State;
		internal var _reqReset:Boolean;
		protected var _state:Class;
		
		public function MZ_Game(sizeX:uint, sizeY:uint, state:Class, zoom:Number=2) {
			MZ_Base.initGame(this, sizeX, sizeY);
			
			MZ_Base.camera = new MZ_Camera();
			MZ_Base.camera.zoom = zoom;
			addChild(MZ_Base.camera);
			
			MZ_Base.debug = new MZ_DebugView();
			addChild(MZ_Base.debug);
			
			_state = state;
			_reqState = null;
			_reqReset = true;
			MZ_Base.isReqState = _reqReset;
			
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			//stage.scaleMode = StageScaleMode.EXACT_FIT;
			
			//After all setup calls for Game
			create();
		}
		
		public function create():void {
			stage.addEventListener(Event.ENTER_FRAME, update);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
		}
		
		public function update(event:Event):void {
			if (_reqReset) {
				_reqReset = false;
				_reqState = new _state();
				MZ_Base.state = _reqState;
				_reqState.create();
			}
			
			MZ_Base.camera.update();
			_reqState.update();
			MZ_Base.debug.update();
			MZ_Base.keys.update();//DON'T ASK WHY I HAVE TO UPDATE THE KEYS TWICE!!! I DONT KNOW!!!!!! but It workds! :/
			MZ_Base.keys.update();
		}
		
		public function destroyGame(state:MZ_State):void {
			MZ_Base.removeAll();
			_reqState.destroy();
			_reqState = state;
			state.create();
		}
		
		protected function onKeyDown(event:KeyboardEvent):void {
			MZ_Base.keys.handleKeyDown(event);
		}
		
		protected function onKeyUp(event:KeyboardEvent):void {
			MZ_Base.keys.handleKeyUp(event);
		}
	}
}