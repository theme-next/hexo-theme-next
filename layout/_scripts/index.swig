{% include 'vendors.swig' %}
{% include 'commons.swig' %}

{%- set scheme_script = 'schemes/' + theme.scheme | lower + '.swig' %}
{% include scheme_script %}

{% include 'next-boot.swig' %}
{% include 'three.swig' %}
