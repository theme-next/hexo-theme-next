/* global hexo */

'use strict';

const path = require('path');

hexo.extend.filter.register('template_locals', function(locals) {
  const { config } = this;
  // Hexo & NexT version
  locals.hexo_version = this.env.version;
  locals.next_version = require(path.normalize('../../package.json')).version;
  // Language & Config
  locals.title = locals.__('title') !== 'title' && locals.__('title') || config.title;
  locals.subtitle = locals.__('subtitle') !== 'subtitle' && locals.__('subtitle') || config.subtitle;
  locals.author = locals.__('author') !== 'author' && locals.__('author') || config.author;
  locals.description = locals.__('description') !== 'description' && locals.__('description') || config.description;
  // Current year
  locals.copyright_year = new Date().getFullYear();
  // PJAX
  locals.pjax = this.theme.config.pjax ? ' pjax' : '';
});
