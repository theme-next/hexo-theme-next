'use strict';

module.exports = hexo => {
  if (!hexo.locals.get) return;

  var data = hexo.locals.get('data');
  if (!data) return;

  const merge = require(hexo.base_dir + 'node_modules/lodash/merge');

  /**
   * Merge configs from _data/next.yml into hexo.theme.config.
   * If `override`, configs in next.yml will rewrite configs in hexo.theme.config.
   * If next.yml not exists, merge all `theme_config.*` into hexo.theme.config.
   */
  if (data.next) {
    if (data.next.override) {
      hexo.theme.config = data.next;
    } else {
      merge(hexo.config, data.next);
      merge(hexo.theme.config, data.next);
    }
  } else {
    merge(hexo.theme.config, hexo.config.theme_config);
  }

  if (hexo.theme.config.cache && hexo.theme.config.cache.enable) {
    if (hexo.config.relative_link) {
      hexo.log.warn('Since caching is turned on, the `relative_link` option in Hexo `_config.yml` is set to `false` to avoid potential hazards.');
      hexo.config.relative_link = false;
    }
  }

  // Custom languages support. Introduced in NexT v6.3.0.
  if (data.languages) {
    var lang = hexo.config.language;
    var i18n = hexo.theme.i18n;

    var mergeLang = lang => {
      i18n.set(lang, merge(i18n.get([lang]), data.languages[lang]));
    };

    if (Array.isArray(lang)) {
      for (var i = 0; i < lang.length; i++) {
        mergeLang(lang[i]);
      }
    } else {
      mergeLang(lang);
    }
  }
};
