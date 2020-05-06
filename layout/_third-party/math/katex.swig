{%- set katex_css_uri = theme.vendors.katex_css or next_vendors('//cdn.jsdelivr.net/npm/katex@0.11.1/dist/katex.min.css') %}
{%- set katex_js_uri = theme.vendors.katex_js or next_vendors('//cdn.jsdelivr.net/npm/katex@0.11.1/dist/katex.min.js') %}
<link rel="stylesheet" href="{{ katex_css_uri }}">
<script src="{{ katex_js_uri }}"></script>
{%- if theme.math.katex.copy_tex %}
  {%- set copy_tex_js_uri = theme.vendors.copy_tex_js or '//cdn.jsdelivr.net/npm/katex@0/dist/contrib/copy-tex.min.js' %}
  {%- set copy_tex_css_uri = theme.vendors.copy_tex_css or '//cdn.jsdelivr.net/npm/katex@0/dist/contrib/copy-tex.min.css' %}
  <script src="{{ copy_tex_js_uri }}"></script>
  <link rel="stylesheet" href="{{ copy_tex_css_uri }}">
{%- endif %}
