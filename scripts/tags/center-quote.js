/**
 * center-quote.js | https://theme-next.org/docs/tag-plugins/
 */

/* global hexo */

'use strict';

function centerQuote(args, content) {
  return `<blockquote class="blockquote-center">
            <i class="fa fa-quote-left"></i>
            ${hexo.render.renderSync({ text: content, engine: 'markdown' })}
            <i class="fa fa-quote-right"></i>
          </blockquote>`;
}

hexo.extend.tag.register('centerquote', centerQuote, {ends: true});
hexo.extend.tag.register('cq', centerQuote, {ends: true});
