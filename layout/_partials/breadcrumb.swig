{% set paths = page.path.split('/') %}
{% set count = paths.length %}
{% if count > 2 %}
  {% set current = 0 %}
  {% set link = '' %}
  <ul class="breadcrumb">
    {% for path in paths %}
      {% set current += 1 %}
      {% if path != 'index.html' %}
        {% if current == count - 1 %}
          <li>{{ path | upper }}</li>
        {% else %}
          <li><a href="{{ link }}{{ url_for(path) }}/">{{ path | upper }}</a></li>
          {% if link == '' %}
            {% set link = '/' + path %}
          {% else %}
            {% set link += '/' + path %}
          {% endif %}
        {% endif %}
      {% endif %}
    {% endfor %}
  </ul>
{% endif %}
