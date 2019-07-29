/* global hexo */

'use strict';

hexo.extend.helper.register('next_font', function(type) {
  var font_config = hexo.theme.config.font;

  if (!font_config || !font_config.enable) {
    return '';
  }

  var font_display = '&display=swap';
  var font_subset = '&subset=latin,latin-ext';
  var font_styles = ':300,300italic,400,400italic,700,700italic';
  var font_host = font_config.host || '//fonts.googleapis.com';

  //Get a font list from font_config
  var font_families = ['global', 'title', 'headings', 'posts', 'codes'].map(function(item) {
    if (font_config[item].family && font_config[item].external) {
      return font_config[item].family + font_styles;
    }
    return '';
  });

  font_families = font_families.filter(function(item) {
    return item !== '';
  })

  font_families = Array.from(new Set(font_families));
  font_families = font_families.join('|');

  // Merge extra parameters to the final processed font string
  return font_families ? `<link rel="stylesheet" href="${font_host}/css?family=${font_families.concat(font_display, font_subset)}"/>` : ''; 
});
