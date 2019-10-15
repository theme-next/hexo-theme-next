

{%- if theme.canvas_nest.enable %}
  {%- if theme.canvas_nest.onmobile %}
    {%- set canvas_nest_uri = default(theme.vendors.canvas_nest, next_vendors('canvas-nest/canvas-nest.min.js')) %}
  {% else %}
    {%- set canvas_nest_uri = default(theme.vendors.canvas_nest_nomobile, next_vendors('canvas-nest/canvas-nest-nomobile.min.js')) %}
  {%- endif %}
  <script color='{{ theme.canvas_nest.color }}' opacity='{{ theme.canvas_nest.opacity }}' zIndex='{{ theme.canvas_nest.zIndex }}' count='{{ theme.canvas_nest.count }}' src="{{ canvas_nest_uri }}"></script>
{%- endif %}

{%- if theme.canvas_ribbon.enable %}
  {%- set canvas_ribbon_uri = default(theme.vendors.canvas_ribbon, next_vendors('canvas-ribbon/canvas-ribbon.js')) %}
  <script size="{{ theme.canvas_ribbon.size }}" alpha="{{ theme.canvas_ribbon.alpha }}" zIndex="{{ theme.canvas_ribbon.zIndex }}" src="{{ canvas_ribbon_uri }}"></script>
{%- endif %}
