package {
	import mzed.framework.render.MZ_Object;
	import mzed.framework.*;
	
	public class Player extends MZ_Object{
		[Embed(source="../res/Icon.png")] public static var coin:Class;
		private var speed:Number;
		
		public function Player(_x:Number, _y:Number) {
			super(_x, _y);
			applyTexture(coin, 16, 16);
			
			speed = 4;
		}
		
		override public function update():void {
			super.update();
			if(MZ_Base.keys.A){
				x = speed;
			}
			if(MZ_Base.keys.D){
				x = speed;
			}
			if(MZ_Base.keys.W){
				y = speed;
			}
			if(MZ_Base.keys.S){
				y = speed;
			}
		}
	}
}