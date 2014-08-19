package mzed.framework.render {
	import mzed.framework.*;
	/**
	 * CSV tilemap parser that displays and handles
	 * loading/adding of the tilemap and other
	 * event handling scenarios.
	 * @author Mozzo
	 * http://www.mozzo.host56.com
	 */
	public class MZ_Tilemap {
		
		public var mapWidth:Number;
		public var mapHeight:Number;
		public var tileSize:Number;
		public var totalTiles:Number;
		
		/**
		 * Initialize the tilemap
		 * @param	width		Width of the tilemap
		 * @param	width		Height of the tilemap
		 * @param	tileSize	Sprite size, has to be same size for x and y... for now
		 */
		public function MZ_Tilemap(width:Number, height:Number, tileSize:Number) {
			mapWidth = width;
			mapHeight = height;
			this.tileSize = tileSize * MZ_Base.camera.zoom;
			totalTiles = mapWidth * mapHeight;
		}
		
		/**
		 * Loads and adds the map to the state
		 * @param	map			CSV format in array
		 * @param	spritesheet	Spritesheet for the map
		 */
		public function loadMap(map:Array, spritesheet:Class):void {
			for (var i:int = 0; i < mapHeight; i++) {
				for (var u:int = 0; u < mapWidth; u++) {
					var spr1:MZ_Object = new MZ_Object(0, 0);
					spr1.applyTexture(spritesheet, tileSize - 16, tileSize);
					spr1.gotoFrame(map[i][u]);
					spr1.x = tileSize * u;
					spr1.y = tileSize * i;
					MZ_Base.add(spr1);
				}
			}
		}
	}
}