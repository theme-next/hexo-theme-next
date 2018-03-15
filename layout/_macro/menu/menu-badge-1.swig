  {% macro render(value) %}
  <li class="menu-item menu-item-{{ itemName | replace(' ', '-', 'g') }}">
    <a href="{{ url_for(value.split('||')[0]) | trim }}" rel="section">
      {% if theme.menu_settings.icons %}{#
      #}<i class="menu-item-icon fa fa-fw fa-{{ value.split('||')[1] | trim | default('question-circle') }}"></i> <br />{#
    #}{% endif %}{#
#}{% endmacro %}
