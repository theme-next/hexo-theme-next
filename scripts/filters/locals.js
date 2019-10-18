/* global hexo */

'use strict';

const path = require('path');

hexo.extend.filter.register('template_locals', function(locals) {
  const { config } = this;
  const { __ } = locals;
  // Hexo & NexT version
  locals.hexo_version = this.env.version;
  locals.next_version = require(path.normalize('../../package.json')).version;
  // Language & Config
  locals.title = __('title') !== 'title' && __('title') || config.title;
  locals.subtitle = __('subtitle') !== 'subtitle' && __('subtitle') || config.subtitle;
  locals.author = __('author') !== 'author' && __('author') || config.author;
  locals.description = __('description') !== 'description' && __('description') || config.description;
  // Current year
  locals.copyright_year = new Date().getFullYear();
  // PJAX
  locals.pjax = this.theme.config.pjax ? ' pjax' : '';
});
