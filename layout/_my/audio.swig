{% if theme.audio.enable %}
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1" />
	<title></title>
	<link rel="stylesheet" href="/static/css/player.css">
</head>

<div id="QPlayer">
	<div id="pContent">
		<div id="player">
			<span class="cover"></span>
			<div class="ctrl">
				<div class="musicTag marquee">
					<strong>Title</strong>
					 <span> - </span>
					<span class="artist">Artist</span>
				</div>
				<div class="progress">
					<div class="timer left">0:00</div>
					<div class="contr">
						<div class="rewind icon"></div>
						<div class="playback icon"></div>
						<div class="fastforward icon"></div>
					</div>
					<div class="right">
						<div class="liebiao icon"></div>
					</div>
				</div>
			</div>
		</div>
		<div class="ssBtn">
				<div class="adf"></div>
		</div>
	</div>
	<ol id="playlist"></ol>
</div>
<script src="//cdn.bootcss.com/jQuery.Marquee/1.3.94/jquery.marquee.min.js"></script>
<script>
  var playlist = [];
  {% for src in theme.audio.sources %}
  playlist.push({title:'{{src.title}}',artist:'{{src.artist}}',mp3:'{{ src.mp3 }}',cover:'{{src.cover}}'})
  {% endfor %}
  var isRotate = true;
  var autoplay = false;
</script>
<script src="/static/js/player.js"></script>
<script>
  function bgChange(){
	var lis= $('.lib');
	for(var i=0; i<lis.length; i+=2)
	lis[i].style.background = 'rgba(246, 246, 246, 0.5)';
  }
  window.onload = bgChange;
</script>
{% endif %}