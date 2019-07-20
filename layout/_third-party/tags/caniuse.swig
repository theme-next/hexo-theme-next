<script>
// GET RESPONSIVE HEIGHT PASSED FROM IFRAME

window.addEventListener("message", function(e) {
  var data = e.data;
  if ((typeof data === 'string') && (data.indexOf('ciu_embed') > -1)) {
    var featureID = data.split(':')[1];
    var height = data.split(':')[2];
    $(`iframe[data-feature=${featureID}]`).height(parseInt(height) + 30);
  }
}, false);
</script>
