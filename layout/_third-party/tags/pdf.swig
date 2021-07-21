{%- if theme.pdf.enable %}
{%- set pdf_uri = next_vendors('pdf/web/viewer.html') %}
<script{{ pjax }}>
document.querySelectorAll('.pdfobject-container').forEach(element => {
  let url = element.dataset.target;
  let pdfOpenParams = {
    navpanes : 0,
    toolbar  : 0,
    statusbar: 0,
    pagemode : 'thumbs',
    view     : 'FitH'
  };
  let pdfOpenFragment = '#' + Object.entries(pdfOpenParams).map(([key, value]) => `${key}=${encodeURIComponent(value)}`).join('&');
  let fullURL = `{{ pdf_uri }}?file=${encodeURIComponent(url)}${pdfOpenFragment}`;

  if (NexT.utils.supportsPDFs()) {
    element.innerHTML = `<embed class="pdfobject" src="${url + pdfOpenFragment}" type="application/pdf" style="height: ${element.dataset.height};">`;
  } else {
    element.innerHTML = `<iframe src="${fullURL}" style="height: ${element.dataset.height};" frameborder="0"></iframe>`;
  }
});
</script>
{%- endif %}
