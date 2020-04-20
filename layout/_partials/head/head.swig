<<<<<<< HEAD
<meta charset="UTF-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=2"/>
<meta name="theme-color" content="{{ theme.android_chrome_color }}"/>

{% if theme.needmoreshare2.enable %}
  {% set needmoreshare2_css = url_for(theme.vendors._internal + '/needsharebutton/needsharebutton.css') %}
  {% if theme.vendors.needmoreshare2_css %}
    {% set needmoreshare2_css = theme.vendors.needmoreshare2_css %}
  {% endif %}
  <link rel="stylesheet" href="{{ needmoreshare2_css }}"/>
{% endif %}

{% if theme.pace %}
  {% set pace_css_uri = url_for(theme.vendors._internal + '/pace/'+ theme.pace_theme +'.min.css?v=1.0.2') %}
  {% set pace_js_uri = url_for(theme.vendors._internal + '/pace/pace.min.js?v=1.0.2') %}
    {% if theme.vendors.pace %}
      {% set pace_js_uri = theme.vendors.pace %}
    {% endif %}
    {% if theme.vendors.pace_css %}
      {% set pace_css_uri = theme.vendors.pace_css %}
    {% endif %}
  <script src="{{ pace_js_uri }}"></script>
  <link rel="stylesheet" href="{{ pace_css_uri }}"/>
{% endif %}

{% if theme.disable_baidu_transformation %}
  <meta http-equiv="Cache-Control" content="no-transform"/>
  <meta http-equiv="Cache-Control" content="no-siteapp"/>
{% endif %}

{% if theme.google_site_verification %}
  <meta name="google-site-verification" content="{{ theme.google_site_verification }}"/>
{% endif %}

{% if theme.bing_site_verification %}
  <meta name="msvalidate.01" content="{{ theme.bing_site_verification }}"/>
{% endif %}

{% if theme.yandex_site_verification %}
  <meta name="yandex-verification" content="{{ theme.yandex_site_verification }}"/>
{% endif %}

{% if theme.baidu_site_verification %}
  <meta name="baidu-site-verification" content="{{ theme.baidu_site_verification }}"/>
{% endif %}

{% if theme.fancybox %}
  {% set fancybox_css_uri = url_for(theme.vendors._internal + '/fancybox/source/jquery.fancybox.css') %}
  {% if theme.vendors.fancybox_css %}
    {% set fancybox_css_uri = theme.vendors.fancybox_css %}
  {% endif %}
  <link rel="stylesheet" href="{{ fancybox_css_uri }}"/>
{% endif %}

{% include "./external-fonts.swig" %}

{% set font_awesome_uri = url_for(theme.vendors._internal + '/font-awesome/css/font-awesome.min.css?v=4.7.0') %}
{% if theme.vendors.fontawesome %}
  {% set font_awesome_uri = theme.vendors.fontawesome %}
{% endif %}
<link rel="stylesheet" href="{{ font_awesome_uri }}"/>

<link rel="stylesheet" href="{{ url_for(theme.css) }}/main.css?v={{ version }}"/>

{% if theme.live2d.enable %}
  <link rel="stylesheet" href="{{ url_for(theme.vendors._internal + '/live2d/assets/waifu.css') }}"/>
{% endif %}

{% if theme.favicon.apple_touch_icon %}
  <link rel="apple-touch-icon" sizes="180x180" href="{{ url_for(theme.favicon.apple_touch_icon) }}?v={{ version }}">
{% endif %}
{% if theme.favicon.medium %}
  <link rel="icon" type="image/png" sizes="32x32" href="{{ url_for(theme.favicon.medium) }}?v={{ version }}">
{% endif %}
{% if theme.favicon.small %}
  <link rel="icon" type="image/png" sizes="16x16" href="{{ url_for(theme.favicon.small) }}?v={{ version }}">
{% endif %}
{% if theme.favicon.safari_pinned_tab %}
  <link rel="mask-icon" href="{{ url_for(theme.favicon.safari_pinned_tab) }}?v={{ version }}" color="{{ theme.android_chrome_color }}">
{% endif %}
{% if theme.favicon.android_manifest %}
=======
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=2">
<meta name="theme-color" content="{{ theme.android_chrome_color }}">
<meta name="generator" content="Hexo {{ hexo_version }}">

{%- if theme.favicon.apple_touch_icon %}
  <link rel="apple-touch-icon" sizes="180x180" href="{{ url_for(theme.favicon.apple_touch_icon) }}">
{%- endif %}
{%- if theme.favicon.medium %}
  <link rel="icon" type="image/png" sizes="32x32" href="{{ url_for(theme.favicon.medium) }}">
{%- endif %}
{%- if theme.favicon.small %}
  <link rel="icon" type="image/png" sizes="16x16" href="{{ url_for(theme.favicon.small) }}">
{%- endif %}
{%- if theme.favicon.safari_pinned_tab %}
  <link rel="mask-icon" href="{{ url_for(theme.favicon.safari_pinned_tab) }}" color="{{ theme.android_chrome_color }}">
{%- endif %}
{%- if theme.favicon.android_manifest %}
>>>>>>> ca19a9d82dba6521ee7b9cb2befda51c6a1bd063
  <link rel="manifest" href="{{ url_for(theme.favicon.android_manifest) }}">
{%- endif %}
{%- if theme.favicon.ms_browserconfig %}
  <meta name="msapplication-config" content="{{ url_for(theme.favicon.ms_browserconfig) }}">
{%- endif %}

{%- if theme.disable_baidu_transformation %}
  <meta http-equiv="Cache-Control" content="no-transform">
  <meta http-equiv="Cache-Control" content="no-siteapp">
{%- endif %}
{%- if theme.google_site_verification %}
  <meta name="google-site-verification" content="{{ theme.google_site_verification }}">
{%- endif %}
{%- if theme.bing_site_verification %}
  <meta name="msvalidate.01" content="{{ theme.bing_site_verification }}">
{%- endif %}
{%- if theme.yandex_site_verification %}
  <meta name="yandex-verification" content="{{ theme.yandex_site_verification }}">
{%- endif %}
{%- if theme.baidu_site_verification %}
  <meta name="baidu-site-verification" content="{{ theme.baidu_site_verification }}">
{%- endif %}

<link rel="stylesheet" href="{{ url_for(theme.css) }}/main.css">

{{ next_font() }}

{%- set font_awesome_uri = theme.vendors.fontawesome or next_vendors('font-awesome/css/all.min.css') %}
<link rel="stylesheet" href="{{ font_awesome_uri }}">

{%- if theme.fancybox %}
  {%- set fancybox_css_uri = theme.vendors.fancybox_css or next_vendors('//cdn.jsdelivr.net/gh/fancyapps/fancybox@3/dist/jquery.fancybox.min.css') %}
  <link rel="stylesheet" href="{{ fancybox_css_uri }}">
{%- endif %}

{%- if theme.pace.enable %}
  {%- set pace_css_uri = theme.vendors.pace_css or next_vendors('pace/pace-theme-' + theme.pace.theme + '.min.css') %}
  {%- set pace_js_uri = theme.vendors.pace or next_vendors('pace/pace.min.js') %}
  <link rel="stylesheet" href="{{ pace_css_uri }}">
  <script src="{{ pace_js_uri }}"></script>
{%- endif %}

{{ next_config() }}
