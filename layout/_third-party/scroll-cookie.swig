{% if theme.save_scroll %}
  <script type="text/javascript" src="{{ url_for(theme.js) }}/src/js.cookie.js?v={{ version }}"></script>
  <script type="text/javascript" src="{{ url_for(theme.js) }}/src/scroll-cookie.js?v={{ version }}"></script>
{% endif %}
