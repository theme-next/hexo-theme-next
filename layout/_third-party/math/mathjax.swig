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
      }
    };
    (function () {
      var script = document.createElement('script');
      script.src = '{{ mathjax_uri }}';
      script.defer = true;
      document.head.appendChild(script);
    })();
  } else {
    MathJax.typeset();
  }
</script>
