{% if theme.math.enable %}
  {% if not theme.math.per_page or (page.total or page.mathjax) %}
    {% if theme.math.engine == 'mathjax' %}
      {% include 'mathjax.swig' %}
    {% elif theme.math.engine == 'katex' %}
      {% include 'katex.swig' %}
   {% endif %}
  {% endif %}
{% endif %}

