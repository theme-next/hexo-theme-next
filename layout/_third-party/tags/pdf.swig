{%- if theme.pdf.enable %}
<script{{ pjax }}>
function embedPDF() {
  $('body').find('div.pdf').each(function(i, o) {
    PDFObject.embed($(o).attr('target'), $(o), {
      pdfOpenParams: {
        navpanes: 0,
        toolbar: 0,
        statusbar: 0,
        pagemode: 'thumbs',
        view: 'FitH'
      },
      PDFJS_URL: '/lib/pdf/web/viewer.html',
      height: $(o).attr('height') || '{{ theme.pdf.height }}'
    });
  });
}
if ($('body').find('div.pdf').length) {
  NexT.utils.getScript('{{ theme.pdf.pdfobject.cdn }}', embedPDF, window.PDFObject);
}
</script>
{%- endif %}
