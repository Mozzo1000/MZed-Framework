package mzed.framework.core {
	
	public class MZ_AnimHandler {

		public var name:String;
		public var start:int;
		public var end:int;
		public var looped:Boolean;
		
		public function MZ_AnimHandler(name:String, start:int, end:int, looped:Boolean) { 
			this.name = name;
			this.start = start;
			this.end = end + 1;
			this.looped = looped;
		}
	}
}