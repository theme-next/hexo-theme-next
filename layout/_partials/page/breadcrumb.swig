{%- set paths = page.path.split('/') %}
{%- set count = paths.length %}
{%- if count > 2 %}
  {%- set current = 0 %}
  {%- set link = '' %}
  <ul class="breadcrumb">
    {%- for path in paths %}
      {%- set current = current + 1 %}
      {%- if path != 'index.html' %}
        {%- if current == count - 1 and paths[count - 1] == 'index.html' %}
          <li>{{ path | upper }}</li>
        {% else %}
          {%- if link == '' %}
            {%- set link = '/' + path %}
          {% else %}
            {%- set link = link + '/' + path %}
          {%- endif %}
          {%- if path.includes('.html') %}
            <li>{{ path | replace('.html', '') | upper }}</li>
          {% else %}
            <li><a href="{{ url_for(link) }}/">{{ path | upper }}</a></li>
          {%- endif %}
        {%- endif %}
      {%- endif %}
    {%- endfor %}
  </ul>
{%- endif %}
