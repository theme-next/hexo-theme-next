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
          {% if link == '' %}
            {% set link = '/' + path %}
          {% else %}
            {% set link += '/' + path %}
          {% endif %}
          <li><a href="{{ url_for(link) }}/">{{ path | upper }}</a></li>
        {% endif %}
      {% endif %}
    {% endfor %}
  </ul>
{% endif %}
