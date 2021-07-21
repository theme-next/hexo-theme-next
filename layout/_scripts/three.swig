{%- if theme.three.enable %}
  {%- set three_uri = theme.vendors.three or next_vendors('three/three.min.js') %}
  <script defer src="{{ three_uri }}"></script>
  {%- if theme.three.three_waves %}
    {%- set waves_uri = theme.vendors.three_waves or next_vendors('three/three-waves.min.js') %}
    <script defer src="{{ waves_uri }}"></script>
  {%- endif %}
  {%- if theme.three.canvas_lines %}
    {%- set lines_uri = theme.vendors.canvas_lines or next_vendors('three/canvas_lines.min.js') %}
    <script defer src="{{ lines_uri }}"></script>
  {%- endif %}
  {%- if theme.three.canvas_sphere %}
    {%- set sphere_uri = theme.vendors.canvas_sphere or next_vendors('three/canvas_sphere.min.js') %}
    <script defer src="{{ sphere_uri }}"></script>
  {%- endif %}
{%- endif %}
