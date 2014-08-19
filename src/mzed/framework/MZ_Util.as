package mzed.framework {
	import flash.text.TextFormat;
	
	/**
	 * MZ_Util includes utilitie type functions both
	 * for pure Actionscript 3 and MZed functions.
	 * @author Mozzo
	 * http://www.mozzo.host56.com
	 */
	 
	public class MZ_Util {
		
		public function MZ_Util() { }
		
		/**
		 * Use this with TextField. replaces the use of
		 * making a new TextFormat instance every TextField
		 * @param	size	Size of the text
		 * @param	color	Color of the text
		 * @param	align	Alignment of the text
		 */
		public static function format(size:uint = 16, color:uint = 0xFFFFFF, align:String = "left", font:String = "default"):TextFormat {
			var format:TextFormat = new TextFormat();
			format.size = size;
			format.color = color;
			format.align = align;
			format.font = font;
			return format;
		}
	}
}