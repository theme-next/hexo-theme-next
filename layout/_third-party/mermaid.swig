<script>
  if ($('body').find('pre.mermaid').length) {
    $.getScript('{{ theme.mermaid.cdn }}', function() {
      mermaid.initialize({
        theme: '{{ theme.mermaid.theme }}',
        logLevel: 3,
        flowchart: { curve: 'linear' },
        gantt: { axisFormat: '%m/%d/%Y' },
        sequence: { actorMargin: 50 }
      });
    });
  }
</script>
