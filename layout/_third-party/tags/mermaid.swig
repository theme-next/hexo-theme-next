{%- if theme.mermaid.enable %}
{%- set mermaid_uri = theme.vendors.mermaid or '//cdn.jsdelivr.net/npm/mermaid@8/dist/mermaid.min.js' %}
<script{{ pjax }}>
if (document.querySelectorAll('pre.mermaid').length) {
  NexT.utils.getScript('{{ mermaid_uri }}', () => {
    mermaid.initialize({
      theme: '{{ theme.mermaid.theme }}',
      logLevel: 3,
      flowchart: { curve: 'linear' },
      gantt: { axisFormat: '%m/%d/%Y' },
      sequence: { actorMargin: 50 }
    });
  }, window.mermaid);
}
</script>
{%- endif %}
