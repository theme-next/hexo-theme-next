{%- if theme.google_analytics.tracking_id %}
  {%- if not theme.google_analytics.only_pageview %}
    <script async src="https://www.googletagmanager.com/gtag/js?id={{ theme.google_analytics.tracking_id }}"></script>
    <script{{ pjax }}>
      if (CONFIG.hostname === location.hostname) {
        window.dataLayer = window.dataLayer || [];
        function gtag(){dataLayer.push(arguments);}
        gtag('js', new Date());
        gtag('config', '{{ theme.google_analytics.tracking_id }}');
      }
    </script>
  {%- endif %}
  {%- if theme.google_analytics.only_pageview %}
    <script>
      function sendPageView() {
        if (CONFIG.hostname !== location.hostname) return;
        var uid = localStorage.getItem('uid') || (Math.random() + '.' + Math.random());
        localStorage.setItem('uid', uid);
        navigator.sendBeacon('https://www.google-analytics.com/collect', new URLSearchParams({
          v  : 1,
          tid: '{{ theme.google_analytics.tracking_id }}',
          cid: uid,
          t  : 'pageview',
          dp : encodeURIComponent(location.pathname)
        }));
      }
      document.addEventListener('pjax:complete', sendPageView);
      sendPageView();
    </script>
  {%- endif %}
{%- endif %}
