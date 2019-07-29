/* global hexo */

'use strict';

hexo.extend.helper.register('next_font', function(type) {
  var fontConfig = hexo.theme.config.font;

  if (!fontConfig || !fontConfig.enable) {
    return '';
  }

  var fontDisplay = '&display=swap';
  var fontSubset = '&subset=latin,latin-ext';
  var fontStyles = ':300,300italic,400,400italic,700,700italic';
  var fontHost = fontConfig.host || '//fonts.googleapis.com';

  //Get a font list from fontConfig
  var font_families = ['global', 'title', 'headings', 'posts', 'codes'].map(function(item) {
    if (fontConfig[item].family && fontConfig[item].external) {
      return fontConfig[item].family + fontStyles;
    }
    return '';
  });

  font_families = font_families.filter(function(item) {
    return item !== '';
  });

  font_families = Array.from(new Set(font_families));
  font_families = font_families.join('|');

  // Merge extra parameters to the final processed font string
  return font_families ? `<link rel="stylesheet" href="${fontHost}/css?family=${font_families.concat(fontDisplay, fontSubset)}"/>` : '';
});
