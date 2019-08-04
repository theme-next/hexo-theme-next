{%- if theme.mermaid.enable %}
<script{{ pjax }}>
function embedMermaid() {
  mermaid.initialize({
    theme: '{{ theme.mermaid.theme }}',
    logLevel: 3,
    flowchart: { curve: 'linear' },
    gantt: { axisFormat: '%m/%d/%Y' },
    sequence: { actorMargin: 50 }
  });
}
if ($('body').find('pre.mermaid').length) {
  NexT.utils.getScript('{{ theme.mermaid.cdn }}', embedMermaid, window.mermaid);
}
</script>
{%- endif %}
