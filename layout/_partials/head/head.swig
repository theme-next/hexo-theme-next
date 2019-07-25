<meta charset="UTF-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=2"/>
<meta name="theme-color" content="{{ theme.android_chrome_color }}"/>

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
  <link rel="manifest" href="{{ url_for(theme.favicon.android_manifest) }}">
{% endif %}
{% if theme.favicon.ms_browserconfig %}
  <meta name="msapplication-config" content="{{ url_for(theme.favicon.ms_browserconfig) }}"/>
{% endif %}

{% if theme.facebook_sdk.enable and theme.facebook_sdk.webmaster %}
  <meta property="fb:admins" content="{{ theme.facebook_sdk.fb_admin }}"/>
  <meta property="fb:app_id" content="{{ theme.facebook_sdk.app_id }}"/>
{% endif %}

<link rel="stylesheet" href="{{ url_for(theme.css) }}/main.css?v={{ version }}"/>

{% include "./external-fonts.swig" %}

{% set font_awesome_uri = url_for(theme.vendors._internal + '/font-awesome/css/font-awesome.min.css?v=4.7.0') %}
{% if theme.vendors.fontawesome %}
  {% set font_awesome_uri = theme.vendors.fontawesome %}
{% endif %}
<link rel="stylesheet" href="{{ font_awesome_uri }}"/>

{% if theme.needmoreshare2.enable %}
  {% set needmoreshare2_css = url_for(theme.vendors._internal + '/needsharebutton/needsharebutton.css') %}
  {% if theme.vendors.needmoreshare2_css %}
    {% set needmoreshare2_css = theme.vendors.needmoreshare2_css %}
  {% endif %}
  <link rel="stylesheet" href="{{ needmoreshare2_css }}"/>
{% endif %}

{% if theme.pace.enable %}
  {% set pace_css_uri = url_for(theme.vendors._internal + '/pace/pace-theme-'+ theme.pace.theme +'.min.css?v=1.0.2') %}
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

{% if theme.fancybox %}
  {% set fancybox_css_uri = url_for(theme.vendors._internal + '/fancybox/source/jquery.fancybox.css') %}
  {% if theme.vendors.fancybox_css %}
    {% set fancybox_css_uri = theme.vendors.fancybox_css %}
  {% endif %}
  <link rel="stylesheet" href="{{ fancybox_css_uri }}"/>
{% endif %}

{# Export some HEXO Configurations to Front-End #}
<script id="hexo.configurations">
  var NexT = window.NexT || {};
  var CONFIG = {
    root: '{{ theme.root }}',
    scheme: '{{ theme.scheme }}',
    version: '{{ version }}',
    sidebar: {{ theme.sidebar | json_encode }},
    back2top: {{ theme.back2top | json_encode }},
    copycode: {{ theme.codeblock.copy_button | json_encode }},
    fancybox: {{ theme.fancybox }},
    mediumzoom: {{ theme.mediumzoom }},
    lazyload: {{ theme.lazyload }},
    pangu: {{ theme.pangu }},
    algolia: {
      applicationID: '{{ config.algolia.applicationID }}',
      apiKey: '{{ config.algolia.apiKey }}',
      indexName: '{{ config.algolia.indexName }}',
      hits: {{ theme.algolia_search.hits | json_encode }},
      labels: {{ theme.algolia_search.labels | json_encode }}
    },
    localsearch: {{ theme.local_search | json_encode }},
    search: {
      root: '{{ config.root }}',
      path: '{{ config.search.path }}'
    },
    tabs: {{ theme.tabs.enable }},
    motion: {{ theme.motion | json_encode }},
    translation: {
      copy_button: '{{__("post.copy_button")}}',
      copy_success: '{{__("post.copy_success")}}',
      copy_failure: '{{__("post.copy_failure")}}'
    }
  };
</script>
