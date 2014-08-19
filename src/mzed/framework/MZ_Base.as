package mzed.framework {
	import flash.display.Stage;
	import mzed.framework.debug.*;
	import mzed.framework.render.*;
	import mzed.framework.input.*;
	
	/**
	 * MZ_Base is used to access almost anything
	 * the framework can do
	 * @author Mozzo
	 * http://www.mozzo.host56.com
	 */
	
	public class MZ_Base {

		internal static var _game:MZ_Game;
		public static var width:uint;
		public static var height:uint;
		public static var keys:MZ_Keyboard;
		public static var state:MZ_State;
		public static var camera:MZ_Camera;
		public static var debug:MZ_DebugView;
		public static var object:MZ_Object;
		public static var isReqState:Boolean;
		
		public function MZ_Base() {
			
		}
		
		internal static function initGame(game:MZ_Game, sizeWidth:uint, sizeHeight:uint):void {
			MZ_Base._game = game;
			MZ_Base.width = sizeWidth;
			MZ_Base.height = sizeHeight;
			
			MZ_Base.keys = new MZ_Keyboard();
		}
		
		public static function get stage():Stage {
			if(_game.root != null)
				return _game.stage;
			return null;
		}
		
		public static function changeState(_state:MZ_State):void {
			_game.destroyGame(_state);
		}
		
		public static function add(object:MZ_Object):void {
			MZ_Base.object = object;
			camera.addChild(object.bit);
		}
		
		public static function remove(object:MZ_Object):void {
			camera.removeChild(object.bit);
		}
		
		public static function removeAll():void {
			//IT'S SOOO BEAUTIFUL!!!!
			while(camera.numChildren > 0) {
				camera.removeChildAt(0);
			}
		}
	}
}