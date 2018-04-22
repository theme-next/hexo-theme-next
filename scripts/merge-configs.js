/* global hexo */

'use strict';

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
    /**
     * Custom languages support. Introduced in NexT v6.3.0.
     */
    if (data && data.languages) {
      var lang = this.config.language;
      var i18n = this.theme.i18n;

      function mergeLang(lang) {
        i18n.set(lang, merge(i18n.get([lang]), data.languages[lang]));
      }

      if(Array.isArray(lang)){
        for (var i = 0; i < lang.length; i++) {
          mergeLang(lang[i]);
        }
      } else {
        mergeLang(lang);
      }
    }
  }
});
