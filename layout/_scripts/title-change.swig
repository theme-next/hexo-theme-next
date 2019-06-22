{% if theme.title_change.enable %}
  <script>
    ;(d => {
      'use strict';
      {% if not theme.title_change.onmobile %}
        if (NexT.utils.hasMobileUA()) return;
      {% endif %}
      let time, hidden, visible, title = d.title;
      let favicon = d.querySelector('link[rel="icon"]');
      {% if theme.title_change.random %}
        hidden = {{ theme.title_change.hidden.title | json_encode }};
        visible = {{ theme.title_change.visible.title | json_encode }};
      {% else %}
        hidden = "{{ theme.title_change.hidden.title }}";
        visible = "{{ theme.title_change.visible.title }}";
      {% endif %}
      let random = t => t[Math.floor(Math.random() * t.length)];
      const change = () => {
        if (d.hidden) {
          favicon.setAttribute('href', "{{ theme.title_change.hidden.favicon }}");
          {% if theme.title_change.random %}
            d.title = random(hidden);
          {% else %}
            d.title = hidden;
          {% endif %}
          clearTimeout(time);
        } else {
          favicon.setAttribute('href', "{{ theme.title_change.visible.favicon }}");
          {% if theme.title_change.random %}
            d.title = random(visible);
          {% else %}
            d.title = visible;
          {% endif %}
          time = setTimeout(() => {
            d.title = title;
          }, {{ theme.title_change.timeout }});
        }
      }
      d.addEventListener('visibilitychange', change, false);
    })(document);
  </script>
{{ endif }}
