package ;

import js.html.Audio;

class AudioTrack
{
	private var _audio:Audio;
	private var _src:String;

	public function new(src:String)
	{
		_src = src;
	}

	public function load(onLoaded:Void->Void):Void
	{
		_audio = new Audio(_src);
		_audio.addEventListener("loadeddata", function():Void
		{
			trace("onloaded");
			onLoaded();
		});
		_audio.load();
	}

	public function play(startTime:Float, loop:Bool):Void
	{
		_audio.fastSeek(startTime);
		_audio.play();
		_audio.addEventListener("ended", function():Void
		{
			if (loop)
			{
				_audio.fastSeek(startTime);
				_audio.play();
			}
			trace("ended");
		});
	}
}
