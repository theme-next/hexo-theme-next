{{ open_graph() }}

{{ canonical() }}

{# Exports some front-matter variables to Front-End #}
<script id="page-configurations">
  // https://hexo.io/docs/variables.html
  CONFIG.page = {
    sidebar: {{ page.sidebar | json }},
    isHome : {{ is_home() }},
    isPost : {{ is_post() }},
    lang   : '{{ page.lang }}'
  };
</script>

{% if page.robots %}
  <meta name="robots" content="{{ page.robots }}">
{% elif page.noindex %}
  <meta name="robots" content="noindex">
{% endif %}
