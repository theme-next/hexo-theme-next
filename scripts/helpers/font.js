/* global hexo */

'use strict';

hexo.extend.helper.register('next_font', () => {
  var fontConfig = hexo.theme.config.font;

  if (!fontConfig || !fontConfig.enable) {
    return '';
  }

  var fontDisplay = '&display=swap';
  var fontSubset = '&subset=latin,latin-ext';
  var fontStyles = ':300,300italic,400,400italic,700,700italic';
  var fontHost = fontConfig.host || '//fonts.googleapis.com';

  //Get a font list from fontConfig
  var fontFamilies = ['global', 'title', 'headings', 'posts', 'codes'].map(item => {
    if (fontConfig[item] && fontConfig[item].family && fontConfig[item].external) {
      return fontConfig[item].family + fontStyles;
    }
    return '';
  });

  fontFamilies = fontFamilies.filter(item => item !== '');
  fontFamilies = Array.from(new Set(fontFamilies));
  fontFamilies = fontFamilies.join('|');

  // Merge extra parameters to the final processed font string
  return fontFamilies ? `<link rel="stylesheet" href="${fontHost}/css?family=${fontFamilies.concat(fontDisplay, fontSubset)}">` : '';
});
