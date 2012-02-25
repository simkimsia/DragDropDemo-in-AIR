package org.robotlegs.demos.draganddrop.controller.commands
{
	
	import flash.filesystem.File;
	
	import org.robotlegs.demos.draganddrop.model.events.FileDropEvent;
	import org.robotlegs.demos.draganddrop.service.FileCopyService;
	import org.robotlegs.mvcs.Command;
	import org.robotlegs.demos.draganddrop.model.vo.FileCollection;
	
	public class FilterUnwantedFilesCommand extends Command
	{
		
		[Inject]
		public var event:FileDropEvent;
		
		[Inject]
		public var fileCopyService:FileCopyService;
		
		[Inject]
		public var allowedFiles:FileCollection;
		
		private var allowedExtensions:Array = new Array('png', 'jpg', 'jpeg');
		
		override public function execute():void {
			
			// loop through passed files
			for each(var file:File in event.files.vector) {
				// check if passed files are legit
				if (allowedExtensions.indexOf(file.extension) != -1) {
					// if legit, put in allowedFiles Array
					allowedFiles.vector.push(file);
				}
			}
			
			// send to FileCopyService for processing
			fileCopyService.process(allowedFiles);
		}
	}
}