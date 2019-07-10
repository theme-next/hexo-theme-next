/* global hexo */

'use strict';

hexo.extend.filter.register('after_post_render', function(data) {
  var theme = hexo.theme.config;
  // Exit if `lazyload` option disable in NexT.
  if (!theme.lazyload) return;

  var cheerio;

  if (!cheerio) cheerio = require('cheerio');

  var $ = cheerio.load(data.content, {decodeEntities: false});

  $('img').each(function() {
    var $image = $(this);
    $image.attr('data-src', $image.attr('src')).removeAttr('src');
  });

  data.content = $.html();
}, 0);
