/* global hexo */

'use strict';

let cheerio;

hexo.extend.filter.register('after_post_render', data => {
  var theme = hexo.theme.config;
  // Exit if `lazyload` option disable in NexT.
  if (!theme.lazyload) return;

  if (!cheerio) cheerio = require('cheerio');

  const $ = cheerio.load(data.content, {decodeEntities: false});

  $('img').each(() => {
    var $image = $(this);
    $image.attr('data-src', $image.attr('src')).removeAttr('src');
  });

  data.content = $.html();
}, 0);
