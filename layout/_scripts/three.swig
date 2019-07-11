{% if theme.three.enable and theme.three.delay %}
  {% set three_url = url_for(theme.vendors._internal + '/three/three.min.js') %}
  {% if theme.vendors.three %}
    {% set three_url = theme.vendors.three %}
  {% endif %}

  {% if theme.three.three_waves %}
    {% set waves = theme.vendors.three_waves | default(url_for(theme.vendors._internal + '/three/three-waves.min.js')) %}
  {% endif %}

  {% if theme.three.canvas_lines %}
    {% set lines = theme.vendors.canvas_lines | default(url_for(theme.vendors._internal + '/three/canvas_lines.min.js')) %}
  {% endif %}

  {% if theme.three.canvas_sphere %}
    {% set sphere = theme.vendors.canvas_sphere | default(url_for(theme.vendors._internal + '/three/canvas_sphere.min.js')) %}
  {% endif %}

  <script>
    ;((d, w) => {
      loadThree = () => {
        let s = d.createElement('script');
        s.src = '{{ three_url }}';
        d.body.appendChild(s);
      }
      let styles = ['{{ waves }}', '{{ lines }}', '{{ sphere }}'];
      loadStyle = () => {
        styles.forEach(x => {
          if (x !== '') {
            let s = d.createElement('script');
            s.src = x;
            d.body.appendChild(s);
          }
        })
      }
      w.addEventListener('DOMContentLoaded', loadThree);
      w.addEventListener('load', loadStyle);
    })(document, window);
  </script>
{% endif %}
