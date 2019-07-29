/* global hexo */

'use strict';

const priority = hexo.config.inject_priority || {};

// Add comment
hexo.extend.filter.register('theme_inject', function(injects) {
  let theme = hexo.theme.config;
  if (!theme.vkontakte_api.enable || !theme.vkontakte_api.comments) return;

  injects.comment.raw('vkontakte-comments', '<div class="comments" id="comments"><div id="vk_comments"></div></div>', {}, {cache: true});

}, priority.vkontakte_comments_plugin);
