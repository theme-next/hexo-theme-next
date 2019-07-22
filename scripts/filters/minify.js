/* global hexo */

'use strict';

hexo.extend.filter.register('after_generate', () => {
  const theme = hexo.theme.config;

  let scheme = theme.scheme;
  if (scheme === 'Muse' || scheme === 'Mist') {
    hexo.route.remove('js/affix.js');
    hexo.route.remove('js/schemes/pisces.js');
  } else if (scheme === 'Pisces' || scheme === 'Gemini') {
    hexo.route.remove('js/schemes/muse.js');
  }

  let exturl = [
    theme.exturl.toString(),
    'js/exturl.js'
  ];
  let motion = [
    theme.motion.enable.toString(),
    'js/motion.js',
    'lib/velocity/velocity.js',
    'lib/velocity/velocity.min.js',
    'lib/velocity/velocity.ui.js',
    'lib/velocity/velocity.ui.min.js'
  ];
  let algolia = [
    theme.algolia_search.enable.toString(),
    'js/algolia-search.js'
  ];
  let scroll = [
    theme.save_scroll.toString(),
    'js/js.cookie.js',
    'js/scroll-cookie.js'
  ];
  let jquery = [
    theme.vendors.jquery.toString(),
    'lib/jquery/index.js'
  ];
  let fontawesome = [
    theme.vendors.fontawesome.toString(),
    'lib/font-awesome/css/font-awesome.css',
    'lib/font-awesome/css/font-awesome.css.map',
    'lib/font-awesome/css/font-awesome.min.css',
    'lib/font-awesome/fonts/fontawesome-webfont.eot',
    'lib/font-awesome/fonts/fontawesome-webfont.woff',
    'lib/font-awesome/fonts/fontawesome-webfont.woff2',
    'lib/font-awesome/bower.json',
    'lib/font-awesome/HELP-US-OUT.txt'
  ];

  const filter = option => {
    if (option.includes('false') || option[0].includes('//')) {
      option.slice(1).forEach(path => {
        hexo.route.remove(path);
      });
    }
  };

  filter(exturl);
  filter(motion);
  filter(algolia);
  filter(scroll);
  filter(jquery);
  filter(fontawesome);
});
