{% if theme.disqus.enable %}

  {% if theme.disqus.count  %}
    <script id="dsq-count-scr" src="https://{{theme.disqus.shortname}}.disqus.com/count.js" async></script>
  {% endif %}

  {% if page.comments %}
    <script type="text/javascript">
      var disqus_config = function () {
        this.page.url = '{{ page.permalink }}';
        this.page.identifier = '{{ page.path }}';
        this.page.title = '{{ page.title| addslashes }}';
      };
      function loadComments () {
        var d = document, s = d.createElement('script');
        s.src = 'https://{{theme.disqus.shortname}}.disqus.com/embed.js';
        s.setAttribute('data-timestamp', '' + +new Date());
        (d.head || d.body).appendChild(s);
      }
      {% if theme.disqus.lazyload %}
        $(function () {
          var offsetTop = $('#comments').offset().top - $(window).height();
          if (offsetTop <= 0) {
            // load directly when there's no a scrollbar
            loadComments();
          } else {
            $(window).on('scroll.disqus_scroll', function () {
              var scrollTop = document.documentElement.scrollTop;
              if (scrollTop >= offsetTop) {
                $(window).off('.disqus_scroll');
                loadComments();
              }
            });
          }
        });
      {% else %}
        loadComments();
      {% endif %}
    </script>
  {% endif %}

{% endif %}
