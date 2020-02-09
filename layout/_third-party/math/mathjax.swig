{%- set mathjax_uri = theme.vendors.mathjax or '//cdn.jsdelivr.net/npm/mathjax@3/es5/tex-mml-chtml.js' %}

<script>
  if (typeof MathJax === 'undefined') {
    window.MathJax = {
      {%- if theme.math.mathjax.mhchem %}
        loader: {
          load: ['[tex]/mhchem']
        },
      {%- endif %}
      tex: {
        inlineMath: {'[+]': [['$', '$']]},
        {%- if theme.math.mathjax.mhchem %}
          packages: {'[+]': ['mhchem']},
        {%- endif %}
        tags: 'ams'
      },
      options: {
        renderActions: {
          findScript: [10, function (doc) {
            for (const node of document.querySelectorAll('script[type^="math/tex"]')) {
              const display = !!node.type.match(/; *mode=display/);
              const math = new doc.options.MathItem(node.textContent, doc.inputJax[0], display);
              const text = document.createTextNode('');
              node.parentNode.replaceChild(text, node);
              math.start = {node: text, delim: '', n: 0};
              math.end = {node: text, delim: '', n: 0};
              doc.math.push(math);
            }
          }, '']
        }
      }
    };
    (function () {
      var script = document.createElement('script');
      script.src = '{{ mathjax_uri }}';
      script.defer = true;
      document.head.appendChild(script);
    })();
  } else {
    MathJax.startup.document.state(0);
    MathJax.texReset();
    MathJax.typeset();
  }
</script>
