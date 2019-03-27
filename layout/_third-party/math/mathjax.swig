<script type="text/x-mathjax-config">
  {% if theme.math.mathjax.mhchem %}
    MathJax.Ajax.config.path['mhchem'] = '{{ theme.math.mathjax.mhchem }}';
  {% endif %}

  MathJax.Hub.Config({
    tex2jax: {
      inlineMath: [ ['$', '$'], ['\\(', '\\)'] ],
      processEscapes: true,
      skipTags: ['script', 'noscript', 'style', 'textarea', 'pre', 'code']
    },
    TeX: {
      {% if theme.math.mathjax.mhchem %}
        extensions: ['[mhchem]/mhchem.js'],
      {% endif %}
      equationNumbers: {
        autoNumber: 'AMS'
      }
    }
  });
  MathJax.Hub.Register.StartupHook('TeX Jax Ready', function() {
    MathJax.InputJax.TeX.prefilterHooks.Add(function(data) {
      if (data.display) {
        var next = data.script.nextSibling;
        while (next && next.nodeName.toLowerCase() === '#text') { next = next.nextSibling }
        if (next && next.nodeName.toLowerCase() === 'br') { next.parentNode.removeChild(next) }
      }
    });
  });
</script>

<script type="text/x-mathjax-config">
  MathJax.Hub.Queue(function() {
    var all = MathJax.Hub.getAllJax(), i;
    for (i = 0; i < all.length; i += 1) {
      parent = document.getElementById(all[i].inputID + '-Frame').parentNode;
      parent.classList.add('has-jax');
      if (parent.tagName.toLowerCase() === 'li') {
        parent.parentNode.classList.add('has-jax-list');
      }
    }
  });
</script>
<script src="{{ theme.math.mathjax.cdn }}"></script>
