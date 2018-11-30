<script type="text/x-mathjax-config">
    MathJax.Hub.Config({
      tex2jax: {
        inlineMath: [ ['$','$'], ["\\(","\\)"]  ],
        processEscapes: true,
        skipTags: ['script', 'noscript', 'style', 'textarea', 'pre', 'code']
      },
      TeX: {equationNumbers: { autoNumber: "AMS" }}
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

<style>
.MathJax_Display {
    overflow: auto hidden;
}
</style>
