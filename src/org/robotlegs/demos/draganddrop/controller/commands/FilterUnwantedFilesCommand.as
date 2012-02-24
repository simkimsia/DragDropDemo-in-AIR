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
		
		[Inject]
		public var fileCopyService:FileCopyService;
		
		private var allowedExtensions:Array = new Array('png', 'jpg', 'jpeg');
		
		override public function execute():void {
			// create empty Array to contain legit files
			var allowedFiles:Vector.<File> = new Vector.<File>();
			
			// loop through passed files
			for each(var file:File in event.files) {
				// check if passed files are legit
				if (allowedExtensions.indexOf(file.extension) != -1) {
					// if legit, put in allowedFiles Array
					allowedFiles.push(file);
				}
			}
			
			// send to FileCopyService for processing
			fileCopyService.process(allowedFiles);
		}
	}
}