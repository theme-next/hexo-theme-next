{%- if theme.math.enable %}
  {%- set is_index_has_math = false %}

  {# At home, check if there has `mathjax: true` post #}
  {%- if is_home() and theme.math.per_page %}
    {%- for post in page.posts.toArray() %}
      {%- if post.mathjax and not is_index_has_math %}
        {%- set is_index_has_math = true %}
      {%- endif %}
    {%- endfor %}
  {%- endif %}

  {%- if not theme.math.per_page or is_index_has_math or page.mathjax %}
    {%- if theme.math.mathjax.enable %}
      {% include '_third-party/math/mathjax.swig' %}
    {% elif theme.math.katex.enable %}
      {% include '_third-party/math/katex.swig' %}
    {%- endif %}
  {%- endif %}
{%- endif %}
