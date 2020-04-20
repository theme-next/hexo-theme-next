{%- if theme.disqus.count %}
<script>
  function loadCount() {
    var d = document, s = d.createElement('script');
    s.src = 'https://{{ theme.disqus.shortname }}.disqus.com/count.js';
    s.id = 'dsq-count-scr';
    (d.head || d.body).appendChild(s);
  }
  // defer loading until the whole page loading is completed
  window.addEventListener('load', loadCount, false);
</script>
{%- endif %}
{%- if page.comments %}
<script>
  var disqus_config = function() {
    this.page.url = {{ page.permalink | json }};
    this.page.identifier = {{ page.path | json }};
    this.page.title = {{ page.title | json }};
    {% if __('disqus') !== 'disqus' -%}
      this.language = '{{ __('disqus') }}';
    {% endif -%}
  };
  NexT.utils.loadComments(document.querySelector('#disqus_thread'), () => {
    if (window.DISQUS) {
      DISQUS.reset({
        reload: true,
        config: disqus_config
      });
    } else {
      var d = document, s = d.createElement('script');
      s.src = 'https://{{ theme.disqus.shortname }}.disqus.com/embed.js';
      s.setAttribute('data-timestamp', '' + +new Date());
      (d.head || d.body).appendChild(s);
    }
  });
</script>
{%- endif %}
