package org.robotlegs.demos.draganddrop.controller.commands
{
	
	import flash.filesystem.File;
	
	import org.robotlegs.demos.draganddrop.model.events.FileDropEvent;
	import org.robotlegs.demos.draganddrop.service.FileCopyService;
	import org.robotlegs.mvcs.Command;
	
	public class FilterUnwantedFilesCommand extends Command
	{
		
		[Inject]
		public var event:FileDropEvent;
		
		private var allowedExtensions = new Array('png', 'jpg', 'jpeg');
		
		override public function execute():void {
			// create empty Array to contain legit files
			var allowedFiles:Array = new Array();
			
			// loop through passed files
			for(var file:File in event.files) {
				// check if passed files are legit
				if (allowedExtensions.indexOf(file.extension) != -1) {
					// if legit, put in allowedFiles Array
					allowedFiles.push(file);
				}
			}
			
			// send to FileCopyService for processing
			var fileCopyService:FileCopyService = new FileCopyService();
			fileCopyService.process(allowedFiles);
		}
	}
}