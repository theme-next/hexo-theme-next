{% macro render(name, itemName, value) %}

  {%- set itemURL = value.split('||')[0] | trim %}
  {%- if not itemURL.startsWith('http') %}
    {%- set itemURL = itemURL | replace('//', '/') %}
    {%- set RPStr = itemURL | replace('/', '') %}
    {%- set i18nType = theme.i18n.type %}
    {%- set i18nMode = theme.i18n.mode %}

    {%- if i18nType and i18nType.length > 1 %}
      {%- if i18nType[0].length < 1 %}
        {%- set i18nType = [i18nType] %}
      {%- endif %}
    {%- endif %}
    {%- if languages and languages.length > 1 %}
      {%- if languages[0].length < 1 %}
        {%- set languages = [languages] %}
      {%- endif %}
      {%- set languageStr = '/' + languages[0] %}
    {% else %}
      {%- set languageStr = '' %}
    {%- endif %}

    {%- if i18nType and i18nType.length > 1 %}
      {%- for i in i18nType %}
        {%- if RPStr | lower == i | lower %}
          {%- if i18nMode == 1 %}
            {%- set itemURL = languageStr + itemURL  %}
          {%- endif %}
        {%- endif %}
      {%- endfor %}
    {%- endif %}
  {%- endif %}
  <li class="menu-item menu-item-{{ itemName | replace(' ', '-') }}">

    {%- set menuIcon = '' %}
    {%- if theme.menu_settings.icons %}
      {%- set menuIcon = '<i class="fa fa-fw fa-' + value.split('||')[1] | trim + '"></i>' %}
    {%- endif %}
    {%- set menuText = __('menu.' + name) | replace('menu.', '') %}

    {%- set menuBadge = '' %}
    {%- if theme.menu_settings.badges %}
      {%- set badges = {
        archives  : site.posts.length,
        categories: site.categories.length,
        tags      : site.tags.length
        }
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
