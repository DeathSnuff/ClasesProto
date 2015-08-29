package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import starling.utils.AssetManager;
	import Utils.start.DStarling;
	
	/**
	 * ...
	 * @author Pupo
	 */
	[SWF(frameRate = 60, height = 600, width = 480)]
	public class Main extends Sprite
	{
		public function Main()
		{
			if (stage)
				init();
			else
				addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			var assets:Vector.<String> = new Vector.<String>();
			assets.push("assets/scene1.png");
			assets.push("assets/walker.png");
			assets.push("assets/gameover.png");
			assets.push("assets/coin.png");
			assets.push("assets/walker.xml");
			DStarling.init(Game, stage, assets, startGame);
		}
		
		private function startGame():void
		{
		
		}
	
	}

}