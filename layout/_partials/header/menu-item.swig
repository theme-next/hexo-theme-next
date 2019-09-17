{% macro render(name, value) %}

  {%- set itemURL = value.split('||')[0] | trim %}
  {%- if itemURL.indexOf('http') != 0 %}
    {%- set itemURL = itemURL | replace('//', '/', 'g') %}
  {%- endif %}
  <li class="menu-item menu-item-{{ itemName | replace(' ', '-', 'g') }}">

    {%- set menuText = __('menu.' + name) | replace('menu.', '') %}
    {%- if theme.menu_settings.icons %}
      {%- set menuIcon = '<i class="menu-item-icon fa fa-fw fa-' + value.split('||')[1] | trim | default('question-circle') + '"></i> <br>' %}
    {%- endif %}

    {%- set menuBadge = '' %}
    {%- if theme.menu_settings.badges %}
      {%- set badges = {
        archives: site.posts.length,
        categories: site.categories.length,
        tags: site.tags.length }
      %}
      {%- for menu, count in badges %}
        {%- if name == menu %}
          {%- set menuBadge = '<span class="badge">' + count + '</span>' %}
        {%- endif %}
      {%- endfor %}
    {%- endif %}

    {{ next_url(itemURL, menuIcon + menuText + menuBadge, {rel: 'section'}) }}

  </li>

{% endmacro %}
