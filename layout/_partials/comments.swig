{% if page.comments %}
  {% if theme.comments_service %}
    {% set comments_service_comment_path = theme.comments_service + '/comment.swig' %}
    {% include comments_service_comment_path %}
  {% endif %}
{% endif %}
