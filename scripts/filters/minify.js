/* global hexo */

'use strict';

hexo.extend.filter.register('after_generate', () => {
  const theme = hexo.theme.config;
  let scheme = theme.scheme;
  let exturl = [theme.exturl.toString(), 'js/exturl.js'];
  let motion = [theme.motion.enable.toString(), 'js/motion.js'];
  let algolia = [theme.algolia_search.enable.toString(), 'js/algolia-search.js'];
  let scroll = [theme.save_scroll.toString(), 'js/js.cookie.js', 'js/scroll-cookie.js'];

  const filter = option => {
    if (option.includes('false')) {
      option.slice(1).forEach(path => {
        hexo.route.remove(path);
      });
    }
  };

  filter(exturl);
  filter(motion);
  filter(algolia);
  filter(scroll);

  if (scheme === 'Muse' || scheme === 'Mist') {
    hexo.route.remove('js/affix.js');
    hexo.route.remove('js/schemes/pisces.js');
  } else if (scheme === 'Pisces' || scheme === 'Gemini') {
    hexo.route.remove('js/schemes/muse.js');
  }
});
