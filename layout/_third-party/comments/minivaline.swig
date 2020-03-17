{%- set minivaline_uri = theme.vendors.minivaline or '//unpkg.com/minivaline/dist/MiniValine.min.js' %}

<script>
NexT.utils.loadComments(document.querySelector('#minivaline-comments'), () => {
  NexT.utils.getScript('{{ minivaline_uri }}', () => {
    new MiniValine({
      el: '#minivaline-comments',
      appId: '{{ theme.minivaline.appid }}',
      appKey: '{{ theme.minivaline.appkey }}',
      placeholder: '{{ theme.minivaline.placeholder }}',
      {%- if theme.minivaline.language == '' %}
        lang: window.navigator.language || window.navigator.userLanguage,
      {% else %}
        lang: '{{ theme.minivaline.language }}',
      {%- endif %}
      adminEmailMd5: '{{ theme.minivaline.adminEmailMd5 }}',
      math: {{ theme.minivaline.math }} || false,
      maxNest: {{ theme.minivaline.maxNest }} || 3,
      pageSize: {{ theme.minivaline.pageSize }} || 6，
	  pathname: '/{{ page.path }}'
    });
  }, window.MiniValine);
});
</script>
