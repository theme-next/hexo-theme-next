{%- if page.comments %}
<link rel="stylesheet" href="{{ theme.disqusapi.api }}/dist/iDisqus.min.css">

<script>
NexT.utils.loadComments(document.querySelector('#disqusapi_thread'), () => {
  NexT.utils.getScript('{{ theme.disqusapi.api }}/dist/iDisqus.min.js', () => {
    window.dsqapi = new iDisqus('disqusapi_thread', {
      forum         : '{{ theme.disqusapi.forum }}',
      api           : '{{ theme.disqusapi.api }}/api/',
      mode          : {{ theme.disqusapi.mode}},
      timeout       : '{{ theme.disqusapi.timeout}}',  
      url           : {{ page.permalink | json }},
      identifier    : {{ page.path | json }},
      title         : {{ page.title | json }},
      init          : true,
      emojiPreview  : {{ theme.disqusapi.emojipreview}},
      relatedType   : '{{ theme.disqusapi.relatedtype}}'
    });
  }, window.DisqusAPI);
});
</script>
{%- endif %}
