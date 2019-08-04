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
  if (PDFObject) {
    embedPDF();
  } else {
    $.ajax({
      type: 'GET',
      url: '{{ theme.pdf.pdfobject.cdn }}',
      dataType: 'script',
      cache: true,
      success: embedPDF
    });
  }
}
</script>
{%- endif %}
