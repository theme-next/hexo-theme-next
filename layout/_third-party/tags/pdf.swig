{%- if theme.pdf.enable %}
<script{{ pjax }}>
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
</script>
{%- endif %}
