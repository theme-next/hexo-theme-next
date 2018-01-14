{% if theme.katex.enable %}
  {% if not theme.katex.per_page or (page.total or page.mathjax) %}
    <link rel="stylesheet" href="{{ theme.katex.cdn }}" type="text/css">
  {% endif %}
{% endif %}

