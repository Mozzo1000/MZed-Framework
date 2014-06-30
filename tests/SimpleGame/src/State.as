package {
	import mzed.framework.*;
	import mzed.framework.render.MZ_Object;
	/**
	 * ...
	 * @author Mozzo
	 */
	
	public class State extends MZ_State {
		[Embed(source = "../res/Spritesheet.png")] public static var fruit:Class;
		[Embed(source = "../res/Icon.png")] public static var icon:Class;
		public var spr1:MZ_Object;
		public var spr2:MZ_Object;
		
		public var speed:Number;
		
		override public function create():void {
			super.create();
			speed = 4;
			
			spr1 = new MZ_Object(0, 0);
			spr1.applyTexture(fruit, 16, 16);
			spr1.addAnimation("Sprite1", 0, 3, true);
			spr1.addAnimation("Run", 4, 10, true);
			spr1.x = 100;
			spr1.y = 100;
			MZ_Base.add(spr1); //FAKE PLAYER!
			spr2 = new MZ_Object(0, 0, icon);
			spr2.x = 500;
			spr2.y = 100;
			MZ_Base.add(spr2);
			
			var player:Player = new Player(50, 25);
			MZ_Base.add(player); //REAL PLAYER, INPUT DOESN'T WORK!
		}
		
		override public function destroy():void {
			super.destroy();
		}
		
		override public function update():void {
			super.update();
			spr1.collide(spr2);
			if(MZ_Base.keys.RIGHT) {
				//spr1.bit.x += speed;
				spr1.x = speed;
			}
			if (MZ_Base.keys.LEFT) {
				spr1.x = -speed;
			}
			if (MZ_Base.keys.UP) {
				spr1.y = -speed;
			}
			if (MZ_Base.keys.DOWN) {
				spr1.y = speed;
			}
			
			
			if (MZ_Base.keys.justPressed("N")) {
				spr1.play("Sprite1");
			}
			if(MZ_Base.keys.justPressed("Z")) {
				spr1.play("Run");
			}
			if (MZ_Base.keys.justPressed("X")) {
				MZ_Base.changeState(new NewState());
			}
		}
	}
}