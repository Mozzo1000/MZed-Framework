package mzed.framework.input {
	/**
	 * ...
	 * @author Mozzo
	 * http://www.mozzo.host56.com
	 */
	public class MZ_Input {
		
		internal var _allKeys:Object;
		internal var _keys:Array;
		internal const _totalKeys:uint = 256;
		
		public function MZ_Input() {
			_allKeys = new Object();
			_keys = new Array(_totalKeys);
		}
		
		public function update():void {
			var i:uint = 0;
			while(i < _totalKeys) {
				var obj:Object = _keys[i++];
				if(obj == null)
					continue;
				if((obj.last == -1) && (obj.current == -1))
					obj.current = 0;
				else if((obj.last == 2) && (obj.current == 2))
					obj.current = 1;
				obj.last = obj.current;
			}
		}
		
		public function pressed(key:String):Boolean {
			return this[key];
		}
		
		public function justPressed(key:String):Boolean {
			return _keys[_allKeys[key]].current == 2;
		}
		
		public function justReleased(key:String):Boolean {
			return _keys[_allKeys[key]].current == -1; 
		}
		
		public function any():Boolean {
			var i:uint = 0;
			while(i < _totalKeys) {
				var obj:Object = _keys[i++];
				if((obj != null) && (obj.current > 0))
					return true;
			}
			return false;
		}
		
		public function addKey(keyName:String, code:uint):void {
			_allKeys[keyName] = code;
			_keys[code] = {
				name: keyName,
				current: 0,
				last: 0
			};
		}
	}
}