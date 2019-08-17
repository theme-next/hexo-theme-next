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
    ;((d, w) => {
      loadThree = () => {
        let s = d.createElement('script');
        s.src = '{{ three_uri }}';
        d.body.appendChild(s);
      }
      let styles = ['{{ waves_uri }}', '{{ lines_uri }}', '{{ sphere_uri }}'];
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
{%- endif %}
