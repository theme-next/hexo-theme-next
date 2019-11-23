/* global hexo */

'use strict';

hexo.extend.filter.register('after_post_render', data => {
  const { config } = hexo;
  const theme = hexo.theme.config;
  const filters = {
    exturl  : theme.exturl,
    lazyload: theme.lazyload
  };
  if (!filters.exturl && !filters.lazyload) return;
  const cheerio = require('cheerio');
  const $ = cheerio.load(data.content, {
    decodeEntities: false
  });
  if (filters.lazyload) {
    $('img').each((i, o) => {
      let src = $(o).attr('src');
      $(o).attr('data-src', src).removeAttr('src');
    });
  }
  if (filters.exturl) {
    const url = require('url');
    var siteHost = url.parse(config.url).hostname || config.url;

    $('a').each((i, o) => {
      var href = $(o).attr('href');
      // Exit if the href attribute doesn't exists.
      if (!href) return;

      var data = url.parse(href);

      // Exit if the url has same host with `config.url`, which means it's an internal link
      if (!data.protocol || data.hostname === siteHost) return;

      // If title atribute filled, set it as title; if not, set url as title.
      var title = $(o).attr('title') || href;

      var encoded = Buffer.from(href).toString('base64');

      $(o).replaceWith(() => {
        return $(`<span class="exturl" data-url="${encoded}" title="${title}">${$(o).html()}<i class="fa fa-external-link"></i></span>`);
      });
    });
  }
  data.content = $.html();

}, 20);
