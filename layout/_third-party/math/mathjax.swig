{%- set mhchem_uri = theme.vendors.mhchem | default('//cdn.jsdelivr.net/npm/mathjax-mhchem@3') %}
<script type="text/x-mathjax-config">
  {%- if theme.math.mathjax.mhchem %}
    MathJax.Ajax.config.path['mhchem'] = '{{ mhchem_uri }}';
  {%- endif %}

  MathJax.Hub.Config({
    tex2jax: {
      inlineMath: [ ['$', '$'], ['\\(', '\\)'] ],
      processEscapes: true,
      skipTags: ['script', 'noscript', 'style', 'textarea', 'pre', 'code']
    },
    TeX: {
      {%- if theme.math.mathjax.mhchem %}
        extensions: ['[mhchem]/mhchem.js'],
      {%- endif %}
      equationNumbers: {
        autoNumber: 'AMS'
      }
    }
  });

  MathJax.Hub.Register.StartupHook('TeX Jax Ready', function() {
    MathJax.InputJax.TeX.prefilterHooks.Add(function(data) {
      if (data.display) {
        var next = data.script.nextSibling;
        while (next && next.nodeName.toLowerCase() === '#text') {
          next = next.nextSibling;
        }
        if (next && next.nodeName.toLowerCase() === 'br') {
          next.parentNode.removeChild(next);
        }
      }
    });
  });

  MathJax.Hub.Queue(function() {
    var all = MathJax.Hub.getAllJax(), i;
    for (i = 0; i < all.length; i += 1) {
      element = document.getElementById(all[i].inputID + '-Frame').parentNode;
      if (element.nodeName.toLowerCase() == 'li') {
        element = element.parentNode;
      }
      element.classList.add('has-jax');
    }
  });
</script>
{%- set mathjax_uri = theme.vendors.mathjax | default('//cdn.jsdelivr.net/npm/mathjax@2/MathJax.js?config=TeX-AMS-MML_HTMLorMML') %}
<script>
  NexT.utils.getScript('{{ mathjax_uri }}', () => {
    MathJax.Hub.Typeset();
  }, window.MathJax);
</script>
