package org.robotlegs.demos.draganddrop.model.vo
{
	import flash.filesystem.File;
	
	public class FileCollection 
	{
		
		public var vector:Vector.<File> = new Vector.<File>;
		
		public function FileCollection(source:Vector.<File>=null)
		{
			this.vector = source;
			
		}
		
	}
}