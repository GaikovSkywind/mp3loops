package ;
import createjs.SoundOptions;
import createjs.AbstractSoundInstance;
import createjs.Sound;
class Main
{
	private var _instance:AbstractSoundInstance;

	//private var _track:AudioTrack = new AudioTrack("monkey-loop.mp3");

	public function new()
	{
		Sound.addFileloadEventListener(handleLoad);
		Sound.registerSound("monkey-loop2.mp3", "myID", 3);

/*
		_track.load(function():Void
		{
			_track.play(0.0048, true);
		});
*/
	}

	function handleLoad(event:SoundFileloadEvent)
	{
		trace("loaded");
		loopSoundTest();
	}

	private function loopSoundTest():Void
	{
		playSound("myID", loopSoundTest);
	}

	private function playSound(id:String, onCompleted:Void->Void):Void
	{
		var ops:SoundOptions = {};
		ops.interrupt = Sound.INTERRUPT_ANY;
		ops.startTime = 68;
		ops.duration = 4000;
		ops.loop = -1;

		_instance = Sound.play(id, ops);
	}


	public static function main():Void
	{
		trace("hello!");
		new Main();
	}
}
