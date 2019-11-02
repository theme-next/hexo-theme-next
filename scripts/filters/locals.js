/* global hexo */

'use strict';

const path = require('path');

hexo.extend.filter.register('template_locals', locals => {
  const { env, config } = hexo;
  const { __, theme } = locals;
  // Hexo & NexT version
  locals.hexo_version = env.version;
  locals.next_version = require(path.normalize('../../package.json')).version;
  // Language & Config
  locals.title = __('title') !== 'title' ? __('title') : config.title;
  locals.subtitle = __('subtitle') !== 'subtitle' ? __('subtitle') : config.subtitle;
  locals.author = __('author') !== 'author' ? __('author') : config.author;
  locals.description = __('description') !== 'description' ? __('description') : config.description;
  // RSS
  locals.rss = (theme.rss !== false) && (theme.rss || (config.feed && config.feed.path) || 'atom.xml');
  // PJAX
  locals.pjax = theme.pjax ? ' pjax' : '';
});
