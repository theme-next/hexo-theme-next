/* global hexo */

'use strict';

let cheerio;

hexo.extend.filter.register('after_post_render', data => {
  // Exit if `lazyload` option disable in NexT.
  if (!hexo.theme.config.lazyload) return;

  if (!cheerio) cheerio = require('cheerio');

  const $ = cheerio.load(data.content, {decodeEntities: false});
  const images = $('img');
  if (!images.length) return;

  images.each((i, o) => {
    let src = $(o).attr('src');
    $(o).attr('data-src', src).removeAttr('src');
  });

  data.content = $.html();
}, 0);
