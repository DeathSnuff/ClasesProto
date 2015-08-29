package
{
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import starling.core.Starling;
	import starling.events.Event;
	import starling.display.Sprite;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import Utils.start.DStarling;
	
	/**
	 * ...
	 * @author Pupo
	 */
	public class Game extends Sprite
	{
		private var timer:Timer;
		public var numPupos:int
		
		public function Game()
		{
			addEventListener(Event.ADDED_TO_STAGE, onAdded);
		}
		
		private function onAdded(e:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAdded);
		}
		
		public function start():void
		{
			timer = new Timer(1000);
			timer.start();
			timer.addEventListener(TimerEvent.TIMER, ontimer);
			var scene:starling.display.MovieClip = new starling.display.MovieClip(DStarling.assetsManager.getTextures("scene1"));
			addChild(scene);
			stage.addEventListener(TouchEvent.TOUCH, onTouch);
		}
		
		private function ontimer(e:TimerEvent):void
		{
			var mc:starling.display.MovieClip = new starling.display.MovieClip(DStarling.assetsManager.getTextures("walk00"));
			addChild(mc);
			mc.x = Math.random() * stage.stageWidth;
			mc.y = Math.random() * stage.stageHeight;
			Starling.juggler.add(mc);
			mc.name = 'green';
			numPupos += 1;
			trace(numPupos);
			if (numPupos == 10)
			{
				var gameover:starling.display.MovieClip = new starling.display.MovieClip(DStarling.assetsManager.getTextures("gameover"));
				addChild(gameover);
				gameover.x = 100;
				gameover.y = 200;
				timer.removeEventListener(TimerEvent.TIMER, ontimer)
			}
			
			if (timer.currentCount % 3 == 0)
			{
				var moneda:starling.display.MovieClip = new starling.display.MovieClip(DStarling.assetsManager.getTextures("coin"));
				addChild(moneda);
				moneda.x = Math.random() * stage.stageWidth;
				moneda.y = Math.random() * stage.stageHeight;
				moneda.name = 'coin';
			}
		
		}
		
		private function onTouch(e:TouchEvent):void
		{
			var touch:Touch = e.getTouch(this);
			if (touch != null)
			{
				if (touch.phase == TouchPhase.BEGAN)
				{
					var content:DisplayObject = e.target as DisplayObject;
					if (content.name == 'coin' || content.name == 'green')
					removeChild(content);
				}
			}
		}
	
	}

}