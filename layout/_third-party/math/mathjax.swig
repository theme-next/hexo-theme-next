<script type="text/x-mathjax-config">
    MathJax.Hub.Config({
      tex2jax: {
        inlineMath: [ ['$','$'], ["\\(","\\)"] ],
        processEscapes: true,
        skipTags: ['script', 'noscript', 'style', 'textarea', 'pre', 'code']
      },
      TeX: { equationNumbers: { autoNumber: "AMS" } },
      "HTML-CSS": {
        linebreaks: {
          automatic: true,
          width: "90% container"
        },
        EqnChunk: (MathJax.Hub.Browser.isMobile ? 10 : 50)
      },
      SVG: {
        linebreaks: {
          automatic: true,
          width: "90% container"
        },
        EqnChunk: (MathJax.Hub.Browser.isMobile ? 10 : 50)
      },
      PreviewHTML: {
        linebreaks: {
          automatic: true,
          width: "90% container"
        }
      },
      CommonHTML: {
        linebreaks: {
          automatic: true,
          width: "90% container"
        }
      }
    });
</script>

<script type="text/x-mathjax-config">
    MathJax.Hub.Queue(function() {
      var all = MathJax.Hub.getAllJax(), i;
        for (i=0; i < all.length; i += 1) {
          all[i].SourceElement().parentNode.className += ' has-jax';
        }
    });
</script>
<script type="text/javascript" src="{{ theme.math.mathjax.cdn }}"></script>
