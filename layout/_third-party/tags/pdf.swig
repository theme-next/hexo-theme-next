{%- if theme.pdf.enable %}
{%- set pdfobject_uri = theme.vendors.pdfobject or '//cdn.jsdelivr.net/npm/pdfobject@2/pdfobject.min.js' %}
<script{{ pjax }}>
if (document.querySelectorAll('div.pdf').length) {
  NexT.utils.getScript('{{ pdfobject_uri }}', () => {
    document.querySelectorAll('div.pdf').forEach(element => {
      PDFObject.embed(element.getAttribute('target'), element, {
        pdfOpenParams: {
          navpanes : 0,
          toolbar  : 0,
          statusbar: 0,
          pagemode : 'thumbs',
          view     : 'FitH'
        },
        PDFJS_URL: '/lib/pdf/web/viewer.html',
        height   : element.getAttribute('height') || '{{ theme.pdf.height }}'
      });
    });
  }, window.PDFObject);
}
</script>
{%- endif %}
