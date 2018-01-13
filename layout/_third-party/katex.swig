{% if theme.katex.enable %}
  {% if not theme.katex.per_page or (page.total or page.mathjax) %}
    <link rel="stylesheet" href="{{ theme.katex.cdn.css }}" type="text/css">
    <script type="text/javascript" src="{{ theme.katex.cdn.js }}"></script>
  {% endif %}
{% endif %}

