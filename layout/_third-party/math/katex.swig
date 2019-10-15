{%- set katex_uri = default(theme.vendors.katex, '//cdn.jsdelivr.net/npm/katex@0/dist/katex.min.css') %}
<link rel="stylesheet" href="{{ katex_uri }}">
{%- if theme.math.katex.copy_tex %}
  {%- set copy_tex_js_uri = default(theme.vendors.copy_tex_js, '//cdn.jsdelivr.net/npm/katex@0/dist/contrib/copy-tex.min.js') %}
  {%- set copy_tex_css_uri = default(theme.vendors.copy_tex_css, '//cdn.jsdelivr.net/npm/katex@0/dist/contrib/copy-tex.min.css') %}
  <script src="{{ copy_tex_js_uri }}"></script>
  <link rel="stylesheet" href="{{ copy_tex_css_uri }}">
{%- endif %}
