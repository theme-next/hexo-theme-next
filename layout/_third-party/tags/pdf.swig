{%- if theme.pdf.enable %}
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
  let fullURL = `/lib/pdf/web/viewer.html?file=${encodeURIComponent(url)}${pdfOpenFragment}`;

  if (NexT.utils.supportsPDFs()) {
    element.innerHTML = `<embed class="pdfobject" src="${url + pdfOpenFragment}" type="application/pdf" style="height: ${element.dataset.height};">`;
  } else {
    element.innerHTML = `<iframe src="${fullURL}" style="height: ${element.dataset.height};" frameborder="0"></iframe>`;
  }
});
</script>
{%- endif %}
