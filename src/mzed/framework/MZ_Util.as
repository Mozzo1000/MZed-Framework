package mzed.framework {
	import flash.text.TextFormat;
	
	/**
	 * ...
	 * @author Mozzo
	 * http://www.mozzo.host56.com
	 */
	 
	public class MZ_Util {
		
		public function MZ_Util() {
			
		}
		
		public static function format(size:uint = 16, color:uint = 0xFFFFFF, align:String = "left"):TextFormat {
			var format:TextFormat = new TextFormat("default");
			format.size = size;
			format.color = color;
			format.align = align;
			return format;
		}
	}
}