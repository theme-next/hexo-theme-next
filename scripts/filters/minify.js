/* global hexo */

'use strict';

hexo.extend.filter.register('after_generate', () => {
  const theme = hexo.theme.config;
  const lists = hexo.route.list();

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
  ];
  motion = motion.concat(lists.filter(list => list.includes('lib/velocity')));
  let algolia = [
    theme.algolia_search.enable.toString(),
    'js/algolia-search.js'
  ];
  let scroll = [
    theme.save_scroll.toString(),
    'js/js.cookie.js',
    'js/scroll-cookie.js'
  ];
  let jquery;
  if (theme.vendors.jquery) {
    jquery = [theme.vendors.jquery.toString()].concat('lib/jquery/index.js')
  } else {
    jquery = 'true'
  }
  let fontawesome;
  if (theme.vendors.fontawesome) {
    fontawesome = [theme.vendors.fontawesome.toString()].concat(lists.filter(e => e.includes("lib/font-awesome")))
  } else {
    fontawesome = 'true'
  }

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
