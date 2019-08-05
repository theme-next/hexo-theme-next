{%- if page.comments %}
{%- set gitalk_css_url = '//cdn.jsdelivr.net/npm/gitalk@1/dist/gitalk.min.css' %}
{%- if theme.vendors.gitalk_css %}
  {%- set gitalk_css_url = theme.vendors.gitalk_css %}
{%- endif %}
<link rel="stylesheet" href="{{ gitalk_css_url }}">

{%- set gitalk_js_url = '//cdn.jsdelivr.net/npm/gitalk@1/dist/gitalk.min.js' %}
{%- if theme.vendors.gitalk_js %}
  {%- set gitalk_js_url = theme.vendors.gitalk_js %}
{%- endif %}

<script>
  NexT.utils.getScript('{{ gitalk_js_url }}', function() {
    var gitalk = new Gitalk({
      clientID: '{{ theme.gitalk.client_id }}',
      clientSecret: '{{ theme.gitalk.client_secret }}',
      repo: '{{ theme.gitalk.repo }}',
      owner: '{{ theme.gitalk.github_id }}',
      admin: ['{{ theme.gitalk.admin_user }}'],
      id: '{{ gitalk_md5(page.path) }}',
      {%- if theme.gitalk.language == '' %}
        language: window.navigator.language || window.navigator.userLanguage,
      {% else %}
        language: '{{ theme.gitalk.language }}',
      {%- endif %}
      distractionFreeMode: '{{ theme.gitalk.distraction_free_mode }}'
    });
    gitalk.render('gitalk-container');
  }, window.Gitalk);
</script>
{%- endif %}
