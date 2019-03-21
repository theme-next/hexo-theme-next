
{% if theme.valine.enable and theme.valine.appid and theme.valine.appkey %}
  {% include 'valine.swig' %}
{% elif page.comments %}
  {% if theme.gitment.enable and theme.gitment.client_id %}
    {% include 'gitment.swig' %}
  {% elif theme.gitalk.enable %}
    {% include 'gitalk.swig' %}
  {% endif %}
{% endif %}
