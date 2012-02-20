package org.robotlegs.demos.draganddrop.model.events {
	
	import flash.events.Event;
	public class FileDrop extends Event {
		public static const FILE_DROP:String='org.robotlegs.demos.draganddrop.model.events.FileDrop.FILE_DROP';
		protected var _files:String;
		public function FileDrop(type:String, $files:String, bubbles:Boolean=false, cancelable:Boolean=false) {
			super(type, bubbles, cancelable);
			_files=$files;
		}
		public function get files():String {
			return _files;
		}
		override public function clone():Event {
			return new FileDrop(type, files, bubbles, cancelable);
		}
		override public function toString():String {
			return formatToString('FileDrop', 'type', 'bubbles', 'cancelable', 'files');
		}
	}
}