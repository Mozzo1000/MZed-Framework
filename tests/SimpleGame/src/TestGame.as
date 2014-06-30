package {
	import mzed.framework.*;
	
	[SWF(width = "800", height = "600", backgroundColor = "#A1A1A1")]
	[Frame(factoryClass="Preloader")]
	
	public class TestGame extends MZ_Game {
		public function TestGame() {
			super(800, 600, State);
		}
	}
}