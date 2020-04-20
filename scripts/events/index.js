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
  https.get('https://api.github.com/repos/theme-next/hexo-theme-next/releases/latest', {
    headers: {
      'User-Agent': 'Theme NexT Client'
    }
  }, res => {
    let result = '';
    res.on('data', data => {
      result += data;
    });
    res.on('end', () => {
      try {
        let latest = JSON.parse(result).tag_name.replace('v', '').split('.');
        let current = version.split('.');
        let isOutdated = false;
        for (let i = 0; i < Math.max(latest.length, current.length); i++) {
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
      } catch (err) {
        hexo.log.error('Failed to detect version info. Error message:');
        hexo.log.error(err);
      }
    });
  }).on('error', err => {
    hexo.log.error('Failed to detect version info. Error message:');
    hexo.log.error(err);
  });
});
