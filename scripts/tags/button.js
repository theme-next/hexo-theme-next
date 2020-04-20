/**
 * button.js | https://theme-next.org/docs/tag-plugins/button
 */

/* global hexo */

'use strict';

function postButton(args) {
  args = args.join(' ').split(',');
  let url   = args[0];
  let text  = args[1] || '';
  let icon  = args[2] || '';
  let title = args[3] || '';

  if (!url) {
    hexo.log.warn('URL can NOT be empty.');
  }

  text = text.trim();
  icon = icon.trim();
  icon = icon.startsWith('fa') ? icon : 'fa fa-' + icon;
  title = title.trim();

  return `<a class="btn" href="${url}"${title.length > 0 ? ` title="${title}"` : ''}>
            ${icon.length > 0 ? `<i class="${icon}"></i>` : ''}${text}
          </a>`;
}

hexo.extend.tag.register('button', postButton, {ends: false});
hexo.extend.tag.register('btn', postButton, {ends: false});
