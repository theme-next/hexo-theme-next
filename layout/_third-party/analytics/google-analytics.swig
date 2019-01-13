{% if theme.google_analytics %}
  <script async src="//www.googletagmanager.com/gtag/js?id={{ theme.google_analytics }}"></script>
  <script>
    window.dataLayer = window.dataLayer || [];
    function gtag(){dataLayer.push(arguments);}
    gtag('js', new Date());
    gtag('config', '{{ theme.google_analytics }}');
  </script>
{% endif %}
