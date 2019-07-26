{% if theme.font.enable %}

  {% set font_found = false %}
  {% set font_config = theme.font %}
  {% set font_display = '&display=swap' %}
  {% set font_subset = '&subset=latin,latin-ext' %}
  {% set font_styles = ':300,300italic,400,400italic,700,700italic' %}
  {% set font_host = font_config.host | default('//fonts.googleapis.com') %}

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

  {# Get a font list from font_config #}
  {% set font_families = [font_global, font_title, font_headings, font_posts, font_codes] %}

  {# Original font list is not empty #}
  {% if font_families !== '' %}
    {# Original font list includes empty value - Some font is not setted. #}
    {% if font_families.includes('') %}
      {# Unique filter original font list and join `/`, then convert it to font string #}
      {% set font_families = String(font_families | uniq | join('|')) %}
      {# Font string ends with `|` - The last font is not setted #}
      {% if font_families.endsWith('|') %}
        {# Remove the unneeded last `|` from font string #}
        {% set font_families = font_families.slice(0, -1) %}
      {# Font string contains `||` - The font in middle part is not fully setted. #}
      {% else %}
        {# Replace the unneeded `||` in font string with `|` #}
        {% set font_families = font_families.replace('||', '|') %}
      {% endif %}
    {# Original font list doesn't include empty value - Every font is setted. #}
    {% else %}
      {# Unique filter original font list and join `/`, then convert it to font string #}
      {% set font_families = String(font_families | uniq | join('|')) %}
    {% endif %}
    {# Merge extra parameters to the final processed font string #}
{##}<link rel="stylesheet" href="{{ font_host }}/css?family={{ font_families.concat(font_display, font_subset) }}"/>
  {% endif %}

{% endif %}
