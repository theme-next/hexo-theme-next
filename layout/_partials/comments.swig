{% if page.comments %}
  {% if theme.comments.type %}
    {% set comments_comment_path = '../_third-party/comments/' + theme.comments.type|lower + '/comment.swig' %}
    {% include comments_comment_path ignore missing %}
  {% endif %}
{% endif %}
