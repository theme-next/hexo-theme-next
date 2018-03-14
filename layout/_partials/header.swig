{% import '../_macro/menu/menu-item.swig' as menu_item %}
{% import '../_macro/menu/menu-badge-1.swig' as menu_badge_1 %}
{% import '../_macro/menu/menu-badge-2.swig' as menu_badge_2 %}

<div class="site-brand-wrapper">
  <div class="site-meta {% if theme.custom_logo.enabled %}custom-logo{% endif %}">
    {% if theme.custom_logo.image and theme.scheme === 'Muse' %}
      <div class="site-meta-headline">
        <a>
          <img class="custom-logo-image" src="{{ theme.custom_logo.image }}"
               alt="{{ config.title }}"/>
        </a>
      </div>
    {% endif %}

    <div class="custom-logo-site-title">
      <a href="{{ config.root }}" class="brand" rel="start">
        <span class="logo-line-before"><i></i></span>
        <span class="site-title">{{ config.title }}</span>
        <span class="logo-line-after"><i></i></span>
      </a>
    </div>
      {% if theme.seo %}
        <h1 class="site-subtitle" itemprop="description">{{ config.subtitle }}</h1>
      {% else %}
        <p class="site-subtitle">{{ config.subtitle }}</p>
      {% endif %}
  </div>

  <div class="site-nav-toggle">
    <button aria-label="{{ __('accessibility.nav_toggle') }}">
      <span class="btn-bar"></span>
      <span class="btn-bar"></span>
      <span class="btn-bar"></span>
    </button>
  </div>
</div>

<nav class="site-nav">
  {% set hasSearch = theme.swiftype_key || theme.algolia_search.enable || theme.tinysou_Key || theme.local_search.enable %}

  {% if theme.menu %}
    <ul id="menu" class="menu">
      {% for name, path in theme.menu %}
        {% set respath = path %}
        {% if path == '[object Object]' %}
          {% for subname, subpath in path %}
            {% set itemName = subname.toLowerCase() %}
            {% set respath = subpath %}
              {% if itemName == 'default' %}
                {% set itemName = name.toLowerCase() %}{#
              #}{{ menu_item.render(name, respath) }}{#
            #}{% endif %}
          {% endfor %}
        {% else %}
          {% set itemName = name.toLowerCase() %}{#
        #}{{ menu_badge_1.render(respath) }}{#
      #}{% endif %}{#
        #}{{ menu_badge_2.render(name, path) }}
      {% endfor %}

      {% if hasSearch %}
        <li class="menu-item menu-item-search">
          {% if theme.swiftype_key %}
            <a href="javascript:;" class="st-search-show-outputs">
          {% elseif theme.local_search.enable || theme.algolia_search.enable %}
            <a href="javascript:;" class="popup-trigger">
          {% endif %}
            {% if theme.menu_settings.icons %}
              <i class="menu-item-icon fa fa-search fa-fw"></i> <br />{#
          #}{% endif %}{#
          #}{{ __('menu.search') }}{#
        #}</a>
        </li>
      {% endif %}
    </ul>
  {% endif %}

  {% if theme.scheme === 'Muse' || theme.scheme === 'Mist' %}
    {% include 'sub-menu.swig' %}
  {% endif %}

  {% if hasSearch %}
    <div class="site-search">
      {% include 'search.swig' %}
    </div>
  {% endif %}
</nav>

{% if theme.custom_file_path.header %}
  {% set custom_header = '../../../../' + theme.custom_file_path.header %}
{% else %}
  {% set custom_header = '../_custom/header.swig' %}
{% endif %}
{% include custom_header %}
