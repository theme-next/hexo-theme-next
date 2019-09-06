/* global hexo */

'use strict';

// Add comment
hexo.extend.filter.register('theme_inject', injects => {
  let theme = hexo.theme.config;
  if (!theme.vkontakte_api.enable || !theme.vkontakte_api.comments) return;

  injects.comment.raw('vkontakte-comments', '<div class="comments" id="comments"><div id="vk_comments"></div></div>', {
    configKey: 'vkontakte',
    button   : '<i class="fa fa-vk" aria-hidden="true"></i> vkontakte'
  }, {cache: true});

});
