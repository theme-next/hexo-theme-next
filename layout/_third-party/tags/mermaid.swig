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
  if (mermaid) {
    embedMermaid();
  } else {
    $.ajax({
      type: 'GET',
      url: '{{ theme.mermaid.cdn }}',
      dataType: 'script',
      cache: true,
      success: embedMermaid
    });
  }
}
</script>
{%- endif %}
