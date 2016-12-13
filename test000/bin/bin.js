(function (console) { "use strict";
var Main = function() {
	createjs.Sound.addEventListener("fileload",$bind(this,this.handleLoad),null);
	createjs.Sound.registerSound("monkey-loop2.mp3","myID",3);
};
Main.main = function() {
	console.log("hello!");
	new Main();
};
Main.prototype = {
	handleLoad: function(event) {
		console.log("loaded");
		this.loopSoundTest();
	}
	,loopSoundTest: function() {
		this.playSound("myID",$bind(this,this.loopSoundTest));
	}
	,playSound: function(id,onCompleted) {
		var ops = { };
		ops.interrupt = createjs.Sound.INTERRUPT_ANY;
		ops.startTime = 68;
		ops.duration = 4000;
		ops.loop = -1;
		this._instance = createjs.Sound.play(id,ops);
	}
};
var $_, $fid = 0;
function $bind(o,m) { if( m == null ) return null; if( m.__id__ == null ) m.__id__ = $fid++; var f; if( o.hx__closures__ == null ) o.hx__closures__ = {}; else f = o.hx__closures__[m.__id__]; if( f == null ) { f = function(){ return f.method.apply(f.scope, arguments); }; f.scope = o; f.method = m; o.hx__closures__[m.__id__] = f; } return f; }
Main.main();
})(typeof console != "undefined" ? console : {log:function(){}});
