package mzed.framework.render {
	/**
	 * ...
	 * @author Mozzo
	 */
	public class MZ_Tilemap {
		
		public var mapWidth:Number;
		public var mapHeight:Number;
		public var tileSide:Number;
		public var totalTiles:Number;
		
		public function MZ_Tilemap(width:Number, height:Number, tileSize:Number) {
			mapWidth = width;
			mapHeight = height;
			tileSide = tileSize;
			totalTiles = mapWidth * mapHeight;
		}
		
		public function loadMap() {
			for (var i:int = 0; i < mapHeight; i++) {
				for (var u:int = 0; u < mapWidth; u++) {
					var spr1:MZ_Object = new MZ_Object(0, 0, coin);
					spr1.x = tileSide * u;
					spr1.y = tileSide * i;
					MZ_Base.add(spr1);
				}
			}
		}
	}
}