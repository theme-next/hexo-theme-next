{% if page.comments %}
  {% if theme.injects.comment.length == 1 %}
    {% set inject_item = theme.injects.comment[0] %}
    {{ partial(inject_item.layout, inject_item.locals, inject_item.options) }}
  {% endif %}
{# {% for inject_item in theme.injects.comment %}
  {{ partial(inject_item.layout, inject_item.locals, inject_item.options) }}
{% endfor %} #}
{% endif %}
