{%- if page.comments %}
{%- set gitalk_css_uri = theme.vendors.gitalk_css or '//cdn.jsdelivr.net/npm/gitalk@1/dist/gitalk.min.css' %}
<link rel="stylesheet" href="{{ gitalk_css_uri }}">

{%- set gitalk_js_uri = theme.vendors.gitalk_js or '//cdn.jsdelivr.net/npm/gitalk@1/dist/gitalk.min.js' %}

<script>
  NexT.utils.getScript('{{ gitalk_js_uri }}', () => {
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
