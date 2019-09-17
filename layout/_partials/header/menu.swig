{% import 'menu-item.swig' as menu_item %}

{%- if theme.menu %}
  <ul id="menu" class="menu">
    {%- for name, path in theme.menu %}
      {%- set respath = path %}
      {%- if path == '[object Object]' %}
      {# Main Menu (default menu item for Submenu) #}
        {%- for subname, subpath in path %}
          {%- set itemName = subname.toLowerCase() %}
          {%- set respath = subpath %}
          {%- if itemName == 'default' %}
            {%- set itemName = name.toLowerCase() %}
            {{ menu_item.render(name, respath) }}
          {%- endif %}
        {%- endfor %}
      {% else %}
      {# Main Menu (standard menu items) #}
        {%- set itemName = name.toLowerCase() %}
        {{- menu_item.render(name, respath) | trim -}}
      {%- endif -%}
    {%- endfor %}

    {%- if hasSearch %}
      <li class="menu-item menu-item-search">
        <a href="javascript:;" class="popup-trigger">
        {%- if theme.menu_settings.icons %}
          <i class="menu-item-icon fa fa-search fa-fw"></i> <br>{#
        #}{%- endif %}{#
        #}{{ __('menu.search') }}{#
      #}</a>
      </li>
    {%- endif %}
  </ul>
{%- endif %}
