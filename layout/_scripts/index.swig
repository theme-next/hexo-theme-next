{% include 'vendors.swig' %}

{{- next_js('utils.js') }}
{%- if theme.motion.enable %}
  {{- next_js('motion.js') }}
{%- endif %}
{%- if theme.bookmark.enable %}
  {{- next_js('bookmark.js') }}
{%- endif %}

{%- set scheme_script = 'schemes/' + theme.scheme | lower + '.swig' %}
{% include scheme_script %}

{{- next_js('next-boot.js') }}
{%- if theme.pjax %}
  {{- next_js('next-pjax.js') }}
{%- endif %}
{% include 'three.swig' %}
