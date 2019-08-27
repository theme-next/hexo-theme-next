{%- if theme.three.enable and theme.three.delay %}
  {%- set three_uri = theme.vendors.three | default(next_vendors('three/three.min.js')) %}

  {%- if theme.three.three_waves %}
    {%- set waves_uri = theme.vendors.three_waves | default(next_vendors('three/three-waves.min.js')) %}
  {%- endif %}

  {%- if theme.three.canvas_lines %}
    {%- set lines_uri = theme.vendors.canvas_lines | default(next_vendors('three/canvas_lines.min.js')) %}
  {%- endif %}

  {%- if theme.three.canvas_sphere %}
    {%- set sphere_uri = theme.vendors.canvas_sphere | default(next_vendors('three/canvas_sphere.min.js')) %}
  {%- endif %}

  <script>
  (function() {
    window.addEventListener('DOMContentLoaded', () => {
      let script = document.createElement('script');
      script.src = '{{ three_uri }}';
      document.body.appendChild(script);
    });
    let styles = ['{{ waves_uri }}', '{{ lines_uri }}', '{{ sphere_uri }}'];
    window.addEventListener('load', () => {
      styles.forEach(item => {
        if (item !== '') {
          let script = document.createElement('script');
          script.src = item;
          document.body.appendChild(script);
        }
      });
    });
  })();
  </script>
{%- endif %}
