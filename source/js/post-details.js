(function() {

  const navItems = document.querySelectorAll('.post-toc li');
  const sections = [...navItems].map(element => {
    var link = element.querySelector('a.nav-link');
    // TOC item animation navigate.
    link.addEventListener('click', event => {
      event.preventDefault();
      var target = document.getElementById(event.currentTarget.getAttribute('href').replace('#', ''));
      var offset = $(target).offset().top;

      $(document.documentElement).stop().animate({
        scrollTop: offset + 10
      }, 500);
    });
    return document.getElementById(link.getAttribute('href').replace('#', ''));
  });

  var $tocElement = $('.post-toc');
  function activateNavByIndex(target) {
    if (target.classList.contains('active-current')) return;

    document.querySelectorAll('.post-toc .active').forEach(element => {
      element.classList.remove('active', 'active-current');
    });
    target.classList.add('active', 'active-current');
    $(target).parents('li').addClass('active');

    // Scrolling to center active TOC element if TOC content is taller then viewport.
    $tocElement.scrollTop($(target).offset().top - $tocElement.offset().top + $tocElement.scrollTop() - ($tocElement.height() / 2));
  }

  const intersectionObserver = new IntersectionObserver(entries => {
    var index = sections.indexOf(entries[0].target);
    activateNavByIndex(navItems[index]);
  }, {
    rootMargin: '0px 0px -100%'
  });

  for (let i = 0; i < sections.length; i++) {
    intersectionObserver.observe(sections[i]);
  }
})();
