/* global hexo */

'use strict';

hexo.extend.filter.register('after_generate', () => {
  const theme = hexo.theme.config;
  if (!theme.minify) return;

  const lists = hexo.route.list();
  const velocity = lists.filter(list => list.includes('lib/velocity'));
  const fontawesome = lists.filter(list => list.includes('lib/font-awesome'));

  if (!theme.motion.enable) {
    hexo.route.remove('js/motion.js');
    velocity.forEach(path => {
      hexo.route.remove(path);
    });
  }

  if (theme.motion.enable && theme.vendors.velocity && theme.vendors.velocity_ui) {
    velocity.forEach(path => {
      hexo.route.remove(path);
    });
  }

  if (theme.vendors.fontawesome) {
    fontawesome.forEach(path => {
      hexo.route.remove(path);
    });
  }

  if (!theme.exturl) {
    hexo.route.remove('js/exturl.js');
  }

  if (!theme.save_scroll) {
    hexo.route.remove('js/js.cookie.js');
    hexo.route.remove('js/scroll-cookie.js');
  }

  if (theme.vendors.jquery) {
    hexo.route.remove('lib/jquery/index.js');
  }

  if (!theme.algolia_search.enable) {
    hexo.route.remove('js/algolia-search.js');
  }

  if (!theme.local_search.enable) {
    hexo.route.remove('js/local-search.js');
  }

  if (theme.scheme === 'Muse' || theme.scheme === 'Mist') {
    hexo.route.remove('js/affix.js');
    hexo.route.remove('js/schemes/pisces.js');
  } else if (theme.scheme === 'Pisces' || theme.scheme === 'Gemini') {
    hexo.route.remove('js/schemes/muse.js');
  }
});
