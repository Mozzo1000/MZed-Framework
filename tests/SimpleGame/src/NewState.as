package {
	import mzed.framework.*;
	import mzed.framework.render.*;
	
	/**
	 * ...
	 * @author Mozzo
	 */
	public class NewState extends MZ_State {
		
		[Embed(source = "../res/Icon.png")] public static var coin:Class;
		public var spr1:MZ_Object;
		public var mapWidth:Number = 10;
		public var mapHeight:Number = 10;
		public var tileSide:Number = 32;
		public var totalTiles:Number = mapWidth * mapHeight;
		
		public var map:Array = [
			1,1,1,1,1,1,1,1,1,1,
			1,0,0,0,0,0,0,0,0,1,
			1,0,0,0,0,0,0,0,0,1,
			1,0,0,0,0,0,0,0,0,1,
			1,0,0,0,0,0,1,1,0,1,
			1,0,0,0,0,0,1,0,0,1,
			1,0,0,1,0,0,1,0,0,1,
			1,0,0,1,1,1,1,0,0,1,
			1,0,0,0,0,0,0,0,0,1,
			1,1,1,1,1,1,1,1,1,1
		];
		
		override public function create():void {
			super.create();
			for (var i:int = 0; i < mapHeight; i++) {
				for (var u:int = 0; u < mapWidth; u++) {
					spr1 = new MZ_Object(0, 0, coin);
					spr1.x = tileSide * u;
					spr1.y = tileSide * i;
					MZ_Base.add(spr1);
				}
			}
		}
		
		override public function destroy():void {
			super.destroy();
		}
		
		override public function update():void {
			if (MZ_Base.keys.justPressed("K")) {
				MZ_Base.changeState(new State());
			}
		}
	}
}