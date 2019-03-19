{% if page.comments %}
  {% if theme.comments_service %}
    {% set comments_service_comment_path = '../_third-party/comments/' + theme.comments_service|lower + '/comment.swig' %}
    {% include comments_service_comment_path %}
  {% endif %}
{% endif %}
