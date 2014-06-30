package mzed.framework.input {
	import flash.events.KeyboardEvent;
	
	/**
	 * ...
	 * @author Mozzo
	 * http://www.mozzo.host56.com
	 */
	 
	public class MZ_Keyboard extends MZ_Input {
		/**
			All keys A-Z
		**/
		public var A:Boolean;
		public var B:Boolean;
		public var C:Boolean;
		public var D:Boolean;
		public var E:Boolean;
		public var F:Boolean;
		public var G:Boolean;
		public var H:Boolean;
		public var I:Boolean;
		public var J:Boolean;
		public var K:Boolean;
		public var L:Boolean;
		public var M:Boolean;
		public var N:Boolean;
		public var O:Boolean;
		public var P:Boolean;
		public var Q:Boolean;
		public var R:Boolean;
		public var S:Boolean;
		public var T:Boolean;
		public var U:Boolean;
		public var V:Boolean;
		public var W:Boolean;
		public var X:Boolean;
		public var Y:Boolean;
		public var Z:Boolean;
		
		/**
			Special nordic keys
		**/
		public var Å:Boolean;
		public var Ä:Boolean;
		public var Ö:Boolean;
		
		/**
			All numbers
		**/
		public var ZERO:Boolean;
		public var ONE:Boolean;
		public var TWO:Boolean;
		public var THREE:Boolean;
		public var FOUR:Boolean;
		public var FIVE:Boolean;
		public var SIX:Boolean;
		public var SEVEN:Boolean;
		public var EIGHT:Boolean;
		public var NINE:Boolean;
		
		/**
			All numpad numbers
		**/
		public var NUMZERO:Boolean;
		public var NUMONE:Boolean;
		public var NUMTWO:Boolean;
		public var NUMTHREE:Boolean;
		public var NUMFOUR:Boolean;
		public var NUMFIVE:Boolean;
		public var NUMSIX:Boolean;
		public var NUMSEVEN:Boolean;
		public var NUMEIGHT:Boolean;
		public var NUMNINE:Boolean;
		
		/**
			All special numpad keys
		**/
		public var NUMMULTIPLY:Boolean;
		public var NUMPLUS:Boolean;
		public var NUMMINUS:Boolean;
		public var NUMENTER:Boolean;
		public var NUMDECIMAL:Boolean;
		public var NUMDIVIDE:Boolean;
		
		/**
			All function keys
		**/
		public var F1:Boolean;
		public var F2:Boolean;
		public var F3:Boolean;
		public var F4:Boolean;
		public var F5:Boolean;
		public var F6:Boolean;
		public var F7:Boolean;
		public var F8:Boolean;
		public var F9:Boolean;
		public var F10:Boolean;
		public var F11:Boolean;
		public var F12:Boolean;
		public var F13:Boolean;
		public var F14:Boolean;
		public var F15:Boolean;
		
		/**
			Other keys
		**/
		public var BACKSPACE:Boolean;
		public var TAB:Boolean;
		public var ENTER:Boolean;
		public var SHIFT:Boolean;
		public var CONTROL:Boolean;
		public var CAPSLOCK:Boolean;
		public var ESCAPE:Boolean;
		public var SPACEBAR:Boolean;
		public var PAGEUP:Boolean;
		public var PAGEDOWN:Boolean;
		public var END:Boolean;
		public var HOME:Boolean;
		public var LEFT:Boolean;
		public var UP:Boolean;
		public var RIGHT:Boolean;
		public var DOWN:Boolean;
		public var INSERT:Boolean;
		public var DELETE:Boolean;
		public var NUMLOCK:Boolean;
		public var SCROLLOCK:Boolean;
		public var PAUSEBREAK:Boolean;
		public var PERIOD:Boolean;
		public var COMMA:Boolean;
		public var MINUS:Boolean;
		public var PLUS:Boolean;
		public var RBRACKET:Boolean;
		public var LBRACKET:Boolean;
		public var SLASH:Boolean;
		public var ALT:Boolean;
		public var BACKSLASH:Boolean;
		public var TILDE:Boolean;
		
		public function MZ_Keyboard() {
			var i:uint;
			
			//Register all keys A-Z plus Å Ä Ö
			i = 65;
			while (i <= 90) {
				addKey(String.fromCharCode(i), i++);
			}

			addKey("Å", 197);
			addKey("Ä", 196);
			addKey("Ö", 214);
			
			//Register all number keys
			addKey("ZERO", 48);
			addKey("ONE", 49);
			addKey("TWO", 50);
			addKey("THREE", 51);
			addKey("FOUR", 52);
			addKey("FIVE", 53);
			addKey("SIX", 54);
			addKey("SEVEN", 55);
			addKey("EIGHT", 56);
			addKey("NINE", 57);
			
			//Register all numpad numbers and keys
			addKey("NUMZERO", 96);
			addKey("NUMONE", 97);
			addKey("NUMTWO", 98);
			addKey("NUMTHREE", 99);
			addKey("NUMFOUR", 100);
			addKey("NUMFIVE", 101);
			addKey("NUMSIX", 102);
			addKey("NUMSEVEN", 103);
			addKey("NUMEIGHT", 104);
			addKey("NUMNINE", 105);
			
			addKey("NUMMULTIPLY", 106);
			addKey("NUMPLUS", 107);
			addKey("NUMMINUS", 109);
			addKey("NUMENTER", 13);
			addKey("NUMDECIMAL", 110);
			addKey("NUMDIVIDE", 111);
			
			//Register all function keys F1-F15
			i = 1;
			while(i <= 15) {
				addKey("F"+i, 111+(i++));
			}
			
			//Register all other keys
			addKey("BACKSPACE", 8);
			addKey("TAB", 9);
			addKey("ENTER", 13);
			addKey("SHIFT", 16);
			addKey("CONTROL", 17);
			addKey("CAPSLOCK", 20);
			addKey("ESCAPE", 27);
			addKey("SPACEBAR", 32);
			addKey("PAGEUP", 33);
			addKey("PAGEDOWN", 34);
			addKey("END", 35);
			addKey("HOME", 36);
			addKey("LEFT", 37);
			addKey("UP", 38);
			addKey("RIGHT", 39);
			addKey("DOWN", 40);
			addKey("INSERT", 45);
			addKey("DELETE", 46);
			addKey("NUMLOCK", 144);
			addKey("SCROLLOCK", 145);
			addKey("PAUSEBREAK", 19);
			addKey("PERIOD", 190);
			addKey("COMMA", 188);
			addKey("MINUS", 189);
			addKey("PLUS", 187);
			addKey("RBRACKET", 221);
			addKey("LBRACKET", 219);
			addKey("SLASH", 191);
			addKey("ALT", 18);
			addKey("BACKSLASH", 220);
			addKey("TILDE", 192);
		}
		
		public function handleKeyDown(event:KeyboardEvent):void {
			var obj:Object = _keys[event.keyCode];
			if(obj == null)
				return;
			if(obj.current > 0)
				obj.current = 1;
			else
				obj.current = 2;
			this[obj.name] = true;
		}
		
		public function handleKeyUp(event:KeyboardEvent):void {
			var obj:Object = _keys[event.keyCode];
			if(obj == null)
				return;
			if(obj.current > 0)
				obj.current = -1;
			else
				obj.current = 0;
			this[obj.name] = false;
		}
	}
}