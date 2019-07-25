/* global hexo */

'use strict';

const merge = require('lodash/merge');

hexo.on('generateBefore', function() {
  if (hexo.locals.get) {
    var data = hexo.locals.get('data');

    /**
     * Merge configs from _data/next.yml into hexo.theme.config.
     * If `override`, configs in next.yml will rewrite configs in hexo.theme.config.
     * If next.yml not exists, merge all `theme_config.*` into hexo.theme.config.
     */
    if (data && data.next) {
      if (data.next.override) {
        hexo.theme.config = data.next;
      } else {
        merge(hexo.config, data.next);
        merge(hexo.theme.config, data.next);
      }
    } else {
      merge(hexo.theme.config, hexo.config.theme_config);
    }

    // Custom languages support. Introduced in NexT v6.3.0.
    if (data && data.languages) {
      var lang = this.config.language;
      var i18n = this.theme.i18n;

      var mergeLang = function(lang) {
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
  }

  // Add filter type `theme_inject`
  require('./injects')(hexo);

});

hexo.on('generateAfter', function() {
  if (!hexo.theme.config.reminder) return;
  const https = require('https');
  const path = require('path');
  const env = require(path.normalize('../package.json'));
  https.get({
    hostname: 'api.github.com',
    port: 443,
    path: '/repos/theme-next/hexo-theme-next/releases/latest',
    method: 'GET',
    headers: {
      'User-Agent': 'Theme NexT Client'
    }
  }, res => {
    var result = '';
    res.on('data', data => {
      result += data;
    });
    res.on('end', () => {
      try {
        var latest = JSON.parse(result).tag_name.replace('v', '').split('.');
        var current = env.version.split('.');
        var isOutdated = false;
        for (var i = 0; i < Math.max(latest.length, current.length); i++) {
          if (!current[i] || latest[i] > current[i]) {
            isOutdated = true;
            break;
          }
        }
        if (isOutdated) {
          hexo.log.warn(`Your theme NexT is outdated. Current version: v${current.join('.')}, latest version: v${latest.join('.')}`);
          hexo.log.warn('Visit https://github.com/theme-next/hexo-theme-next/releases for more information.');
        } else {
          hexo.log.info('Congratulations! Your are using the latest version of theme NexT.');
        }
      } catch (e) {
        hexo.log.error('Failed to detect version info. Error message:');
        hexo.log.error(e);
      }
    });
  });
});
