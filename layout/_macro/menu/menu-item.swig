{% macro render(name, value) %}
{% import 'menu-badge.swig' as menu_badge %}

  {%- set itemURL = value.split('||')[0] | trim %}
  {%- if itemURL.indexOf('http') != 0 %}
    {%- set itemURL = itemURL | replace('//', '/', 'g') %}
  {%- endif %}
  <li class="menu-item menu-item-{{ itemName | replace(' ', '-', 'g') }}">

    {%- set menuText = __('menu.' + name) | replace('menu.', '') %}
    {%- if theme.menu_settings.icons %}
      {%- set menuIcon = '<i class="menu-item-icon fa fa-fw fa-' + value.split('||')[1] | trim | default('question-circle') + '"></i> <br>' %}
    {%- endif %}

    {%- if theme.menu_settings.badges %}
      {%- set menuBadge = menu_badge.render(name) | trim %}
    {%- endif %}

    {{ next_url(itemURL, menuIcon + menuText + menuBadge, {rel: 'section'}) }}

  </li>

{% endmacro %}
