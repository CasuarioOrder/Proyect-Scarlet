package
{
	import flash.display.Sprite;
	import flash.events.Event;
	

	
	import starling.core.Starling;
	
	/**
	 * SWF meta data defined for iPad 1 & 2 in landscape mode. 
	 */	
	
	[SWF(frameRate="60", width="800", height="600", backgroundColor="0x000000")]
	
	
	public class ScarletWitch extends Sprite
	{
		/** Starling object. */
		private var myStarling:Starling;
		
		public function ScarletWitch()
		{
			super();
			
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		
		
		protected function onAddedToStage(event:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			
			// Init Starling..
			myStarling = new Starling(Game, stage);
			
			// Definir anti aliasing.
			myStarling.antiAliasing = 1;
			
			
			// Start Starling Framework.
			myStarling.start();
		}
	}
}