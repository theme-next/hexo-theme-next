/* global hexo */

'use strict';

hexo.extend.helper.register('next_font', () => {
  var config = hexo.theme.config.font;

  if (!config || !config.enable) return '';

  var fontDisplay = '&display=swap';
  var fontSubset = '&subset=latin,latin-ext';
  var fontStyles = ':300,300italic,400,400italic,700,700italic';
  var fontHost = config.host || '//fonts.googleapis.com';

  //Get a font list from config
  var fontFamilies = ['global', 'title', 'headings', 'posts', 'codes'].map(item => {
    if (config[item] && config[item].family && config[item].external) {
      return config[item].family + fontStyles;
    }
    return '';
  });

  fontFamilies = fontFamilies.filter(item => item !== '');
  fontFamilies = [...new Set(fontFamilies)];
  fontFamilies = fontFamilies.join('|');

  // Merge extra parameters to the final processed font string
  return fontFamilies ? `<link rel="stylesheet" href="${fontHost}/css?family=${fontFamilies.concat(fontDisplay, fontSubset)}">` : '';
});
