<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=2">
<meta name="theme-color" content="{{ theme.android_chrome_color }}">
<meta name="generator" content="Hexo {{ hexo_env('version') }}">

{%- if theme.favicon.apple_touch_icon %}
  <link rel="apple-touch-icon" sizes="180x180" href="{{ url_for(theme.favicon.apple_touch_icon) }}?v={{ version }}">
{%- endif %}
{%- if theme.favicon.medium %}
  <link rel="icon" type="image/png" sizes="32x32" href="{{ url_for(theme.favicon.medium) }}?v={{ version }}">
{%- endif %}
{%- if theme.favicon.small %}
  <link rel="icon" type="image/png" sizes="16x16" href="{{ url_for(theme.favicon.small) }}?v={{ version }}">
{%- endif %}
{%- if theme.favicon.safari_pinned_tab %}
  <link rel="mask-icon" href="{{ url_for(theme.favicon.safari_pinned_tab) }}?v={{ version }}" color="{{ theme.android_chrome_color }}">
{%- endif %}
{%- if theme.favicon.android_manifest %}
  <link rel="manifest" href="{{ url_for(theme.favicon.android_manifest) }}">
{%- endif %}
{%- if theme.favicon.ms_browserconfig %}
  <meta name="msapplication-config" content="{{ url_for(theme.favicon.ms_browserconfig) }}">
{%- endif %}

{%- if theme.rss === '' and config.feed.path %}
  {%- set theme.rss = config.feed.path %}
{%- endif %}
{%- if theme.rss %}
  <link rel="alternate" href="{{ url_for(theme.rss) }}" title="{{ title }}" type="application/atom+xml">
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

{%- if theme.facebook_sdk.enable and theme.facebook_sdk.webmaster %}
  <meta property="fb:admins" content="{{ theme.facebook_sdk.fb_admin }}">
  <meta property="fb:app_id" content="{{ theme.facebook_sdk.app_id }}">
{%- endif %}

<link rel="stylesheet" href="{{ url_for(theme.css) }}/main.css?v={{ version }}">

{{ next_font() }}

{%- set font_awesome_uri = theme.vendors.fontawesome | default(next_vendors('font-awesome/css/font-awesome.min.css?v=4.7.0')) %}
<link rel="stylesheet" href="{{ font_awesome_uri }}">

{%- if theme.fancybox %}
  {%- set fancybox_css_uri = theme.vendors.fancybox_css | default(next_vendors('//cdn.jsdelivr.net/gh/fancyapps/fancybox@3/dist/jquery.fancybox.min.css')) %}
  <link rel="stylesheet" href="{{ fancybox_css_uri }}">
{%- endif %}

{%- if theme.pace.enable %}
  {%- set pace_css_uri = theme.vendors.pace_css | default(next_vendors('pace/pace-theme-' + theme.pace.theme + '.min.css?v=1.0.2')) %}
  {%- set pace_js_uri = theme.vendors.pace | default(next_vendors('pace/pace.min.js?v=1.0.2')) %}
  <link rel="stylesheet" href="{{ pace_css_uri }}">
  <script src="{{ pace_js_uri }}"></script>
{%- endif %}

{# Export some HEXO Configurations to Front-End #}
<script id="hexo-configurations">
  var NexT = window.NexT || {};
  var CONFIG = {
    root: '{{ config.root }}',
    scheme: '{{ theme.scheme }}',
    version: '{{ version }}',
    exturl: {{ theme.exturl }},
    sidebar: {{ theme.sidebar | json_encode }},
    copycode: {{ theme.codeblock.copy_button | json_encode }},
    back2top: {{ theme.back2top | json_encode }},
    bookmark: {{ theme.bookmark | json_encode }},
    fancybox: {{ theme.fancybox }},
    mediumzoom: {{ theme.mediumzoom }},
    lazyload: {{ theme.lazyload }},
    pangu: {{ theme.pangu }},
    algolia: {
      appID: '{{ config.algolia.applicationID }}',
      apiKey: '{{ config.algolia.apiKey }}',
      indexName: '{{ config.algolia.indexName }}',
      hits: {{ theme.algolia_search.hits | json_encode }},
      labels: {{ theme.algolia_search.labels | json_encode }}
    },
    localsearch: {{ theme.local_search | json_encode }},
    path: '{{ config.search.path }}',
    motion: {{ theme.motion | json_encode }},
    translation: {
      copy_button: '{{ __("post.copy_button") }}',
      copy_success: '{{ __("post.copy_success") }}',
      copy_failure: '{{ __("post.copy_failure") }}'
    },
    sidebarPadding: 40
  };
</script>
