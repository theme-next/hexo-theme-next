<script type="text/x-mathjax-config">
  {% if theme.math.mathjax.mhchem %}
    MathJax.Ajax.config.path['mhchem'] = '{{ theme.math.mathjax.mhchem }}';
  {% endif %}

  MathJax.Hub.Config({
    tex2jax: {
      inlineMath: [ ['$','$'], ["\\(","\\)"] ],
      processEscapes: true,
      skipTags: ['script', 'noscript', 'style', 'textarea', 'pre', 'code']
    },
    TeX: {
      {% if theme.math.mathjax.mhchem %}
        extensions: ['[mhchem]/mhchem.js'],
      {% endif %}
      equationNumbers: {
        autoNumber: "AMS"
      }
    }
  });
</script>

<script type="text/x-mathjax-config">
  MathJax.Hub.Queue(function() {
    var all = MathJax.Hub.getAllJax(), i;
      for (i = 0; i < all.length; i += 1) {
        all[i].SourceElement().parentNode.className += ' has-jax';
      }
  });
</script>
<script src="{{ theme.math.mathjax.cdn }}"></script>

<style>
.MathJax_Display {
  overflow: auto hidden;
}
</style>
