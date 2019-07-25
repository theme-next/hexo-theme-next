{% if theme.font.enable %}

  {% set font_found = false %}
  {% set font_config = theme.font %}
  {% set font_display = '&display=swap' %}
  {% set font_subset = '&subset=latin,latin-ext' %}
  {% set font_styles = ':300,300italic,400,400italic,700,700italic' %}

  {% if font_config.global.family and font_config.global.external %}
    {% set font_global = font_config.global.family + font_styles %}
    {% set font_found = true %}
  {% endif %}

  {% if font_found and font_config.title.family and font_config.title.external %}
    {% set font_title = font_config.title.family + font_styles %}
  {% endif %}

  {% if font_found and font_config.headings.family and font_config.headings.external %}
    {% set font_headings = font_config.headings.family + font_styles %} 
  {% endif %}

  {% if font_found and font_config.posts.family and font_config.posts.external %}
    {% set font_posts = font_config.posts.family + font_styles %}
  {% endif %}

  {% if font_found and font_config.codes.family and font_config.codes.external %}
    {% set font_codes = font_config.codes.family + font_styles %}
  {% endif %}

  {% set font_families = [font_global, font_title, font_headings, font_posts, font_codes] %}

  {% if font_families !== '' %}
    {% set font_host = font_config.host | default('//fonts.googleapis.com') %}
    <link rel="stylesheet" href="{{ font_host }}/css?family={{ String(font_families | uniq | join('|')).slice(0, -1).concat(font_display, font_subset) }}"/>
  {% endif %}

{% endif %}
