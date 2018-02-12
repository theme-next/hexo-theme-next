/* global hexo */

var merge = require('./merge');

/**
 * Merge configs from _data/next.yml into hexo.theme.config.
 * Note: configs in _data/next.yml will rewrite or override configs in hexo.theme.config.
 */
hexo.on('generateBefore', function () {
  if (hexo.locals.get) {
    var data = hexo.locals.get('data');
    if (data && data.next) {
      if (data.next.override) {
        hexo.theme.config = data.next;
      } else {
        merge(hexo.config, data.next);
        merge(hexo.theme.config, data.next);
      }
    /**
     * If next.yml not exists, then merge all `theme_config.*`
     * options from main Hexo config into hexo.theme.config.
     */
    } else {
      merge(hexo.theme.config, hexo.config.theme_config);
    }
  }
});
