{% macro render(name, value) %}
{% set itemURL = value.split('||')[0] | replace('//', '/', 'g') | trim %}
<li class="menu-item menu-item-{{ itemName | replace(' ', '-', 'g') }}{{ item_active(itemURL, 'menu-item-active') }}">
  <a href="{{ url_for(itemURL) | trim }}" rel="section">
    {% if theme.menu_settings.icons %}{#
    #}<i class="menu-item-icon fa fa-fw fa-{{ value.split('||')[1] | trim | default('question-circle') }}"></i> <br />{#
  #}{% endif %}{#
#}{{ __('menu.' + name ) | replace('menu.', '') }}{#
#}</a>
</li>
{% endmacro %}
