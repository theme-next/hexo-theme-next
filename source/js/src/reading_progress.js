(function () {
  var supportsPassive = false
  try {
    var opts = Object.defineProperty({}, 'passive', {
      get: function () {
        supportsPassive = true
      }
    })
    window.addEventListener("test", null, opts)
  } catch (e) { }

  $(document).ready(function () {
    window.addEventListener('scroll', function () {
      $('.reading-progress-bar').css('width', ($(this).scrollTop() / ($('.post-block').height() - $(this).height()) * 100) + '%')
    }, supportsPassive ? { passive: true } : false)
  })
})()
