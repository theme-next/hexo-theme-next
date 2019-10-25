/* global hexo */

'use strict';

hexo.on('generateBefore', () => {
  // Merge config.
  require('./lib/config')(hexo);
  // Add filter type `theme_inject`
  require('./lib/injects')(hexo);
});

hexo.on('generateAfter', () => {
  if (!hexo.theme.config.reminder) return;
  const https = require('https');
  const path = require('path');
  const { version } = require(path.normalize('../../package.json'));
  https.get({
    hostname: 'api.github.com',
    port    : 443,
    path    : '/repos/theme-next/hexo-theme-next/releases/latest',
    method  : 'GET',
    headers : {
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
        var current = version.split('.');
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
