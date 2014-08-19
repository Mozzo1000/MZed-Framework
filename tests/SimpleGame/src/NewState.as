package {
	import mzed.framework.*;
	import mzed.framework.render.*;
	
	/**
	 * ...
	 * @author Mozzo
	 */
	public class NewState extends MZ_State {
		
		[Embed(source = "../res/Icon.png")] public static var coin:Class;
		[Embed(source = "../res/Spritesheet.png")] public static var sheet:Class;
		
		public var map:Array = [
			[0,0,0,0,0,0,0,0,0,0],
			[0,0,0,0,0,0,0,0,0,0],
			[0,0,0,0,0,0,0,0,0,0],
			[0,0,0,0,0,0,0,0,0,0],
			[0,0,0,0,0,0,0,0,0,0],
			[0,0,0,0,0,0,0,0,0,0],
			[0,0,0,0,0,0,0,0,0,0],
			[0,0,0,0,0,0,0,0,0,0],
			[0,0,0,0,0,0,0,0,0,0],
			[0,0,0,0,0,0,0,0,0,0]
	   ];
		
		override public function create():void {
			super.create();
			
			var tilemap:MZ_Tilemap = new MZ_Tilemap(10, 10, 16);
			tilemap.loadMap(map, sheet);
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