{% if page.comments %}
  {% if theme.comments_service %}
    {% set comments_service_comment_path = '../_third-party/comments/' + theme.comments_service|lower + '/comment.swig' %}
    {% include comments_service_comment_path ignore missing %}
  {% endif %}

  {% if theme.vkontakte_api.enable and theme.vkontakte_api.comments %}
    <div class="comments" id="comments">
      <div id="vk_comments"></div>
    </div>
  {% endif %}

{% endif %}
