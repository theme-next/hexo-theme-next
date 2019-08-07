{%- set likely_js_url = '//cdn.jsdelivr.net/npm/ilyabirman-likely@2/release/likely.js' %}
{%- if theme.vendors.likely_js %}
  {%- set likely_js_url = theme.vendors.likely_js %}
{%- endif %}
<script src="{{ likely_js_url }}"></script>
