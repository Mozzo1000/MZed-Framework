package mzed.framework {
	import mzed.framework.render.*;
	
	/**
	 * MZ_State is a usefull state class
	 * Although it doesn't contain much it works great :)
	 * @author Mozzo
	 * http://www.mozzo.host56.com
	 */
	 
	public class MZ_State extends MZ_Object {
		public function create():void {
			
		}
		/**
		 * Destroy event function
		 * Override to tap into it
		 */
		override public function destroy():void {
			super.destroy();
		}
	}
}