(function() {
	if (!$(".reading-progress-bar").length) return; //no progress bar found
	var supportsPassive = false;
	try {
		var opts = Object.defineProperty({}, "passive", {
			get: function() {
				supportsPassive = true;
			}
		});
		window.addEventListener("test", $.noop, opts);
		window.removeEventListener("test", $.noop);
	} catch (e) {}

	$(document).ready(function() {
		var $bar = $(".reading-progress-bar");
		window.addEventListener(
			"scroll",
			function() {
				var $win = $(window);
				var $post = $(".post-block");
				var winmid = $win.scrollTop() + $win.height() / 2; //assume reader will focus on middle of screen(vertical)
				var h = winmid - $post.position().top;
				var percent = Math.round(h / $post.height() * 100);
				if (percent < 0) percent = 0;
				if (percent > 100) percent = 100;
				$bar.css("width", percent + "%");
			},
			supportsPassive ? { passive: true } : false
		);
	});
})();
