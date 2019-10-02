{%- if theme.google_analytics_pageview.tracking_id %}
  <script{{ pjax }}>
    window.addEventListener('load', function() {
			var uid = localStorage.getItem('uid') || (Math.random() + '.' + Math.random())
			localStorage.setItem('uid', uid)
			navigator.sendBeacon('https://www.google-analytics.com/collect', new URLSearchParams({
				v: 1,
				tid: '{{ theme.google_analytics_pageview.tracking_id }}',
				cid: uid,
				t: 'pageview',
				dp: encodeURIComponent(location.pathname)
			}).toString())
		})
  </script>
{%- endif %}
