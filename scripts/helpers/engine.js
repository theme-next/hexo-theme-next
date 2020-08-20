/* global hexo */

'use strict';

const crypto = require('crypto');

hexo.extend.helper.register('next_inject', function(point) {
  return hexo.theme.config.injects[point]
    .map(item => this.partial(item.layout, item.locals, item.options))
    .join('');
});

hexo.extend.helper.register('next_js', function(...urls) {
  const { js } = hexo.theme.config;
  return urls.map(url => this.js(`${js}/${url}`)).join('');
});

hexo.extend.helper.register('next_vendors', function(url) {
  if (url.startsWith('//')) return url;
  const internal = hexo.theme.config.vendors._internal;
  return this.url_for(`${internal}/${url}`);
});

hexo.extend.helper.register('post_edit', function(src) {
  const theme = hexo.theme.config;
  if (!theme.post_edit.enable) return '';
  return this.next_url(theme.post_edit.url + src, '<i class="fa fa-pencil-alt"></i>', {
    class: 'post-edit-link',
    title: this.__('post.edit')
  });
});

hexo.extend.helper.register('post_nav', function(post) {
  const theme = hexo.theme.config;
  if (theme.post_navigation === false || (!post.prev && !post.next)) return '';
  const prev = theme.post_navigation === 'right' ? post.prev : post.next;
  const next = theme.post_navigation === 'right' ? post.next : post.prev;
  const left = prev ? `
    <a href="${this.url_for(prev.path)}" rel="prev" title="${prev.title}">
      <i class="fa fa-chevron-left"></i> ${prev.title}
    </a>` : '';
  const right = next ? `
    <a href="${this.url_for(next.path)}" rel="next" title="${next.title}">
      ${next.title} <i class="fa fa-chevron-right"></i>
    </a>` : '';
  return `
    <div class="post-nav">
      <div class="post-nav-item">${left}</div>
      <div class="post-nav-item">${right}</div>
    </div>`;
});

hexo.extend.helper.register('gitalk_md5', function(path) {
  let str = this.url_for(path);
  str.replace('index.html', '');
  return crypto.createHash('md5').update(str).digest('hex');
});

hexo.extend.helper.register('canonical', function() {
  // https://support.google.com/webmasters/answer/139066
  const { permalink } = hexo.config;
  let url = this.url.replace(/index\.html$/, '');
  if (!permalink.endsWith('.html')) {
    url = url.replace(/\.html$/, '');
  }
  return `<link rel="canonical" href="${url}">`;
});

/**
 * Get page path given a certain language tag
 */
hexo.extend.helper.register('i18n_path', function(language) {
  const { path, lang } = this.page;  
  let base = path.startsWith(lang) ? path.slice(lang.length + 1) : path;
  const trailing_index = hexo.config.pretty_urls.trailing_index;
  const trailing_html = hexo.config.pretty_urls.trailing_html;
  const theme = hexo.theme.config;
  let i18nType = theme.i18n.type;
  let i18nMode = theme.i18n.mode;

  // Debug
  // console.log('base: ' + base);

  // Init options
  if (i18nType && i18nType.length) {
    if (!Array.isArray(i18nType)) {
      i18nType = [i18nType];
    }
  }
  if (!i18nMode || i18nMode.length == 0) {
    i18nMode = 1;
  }

  // 404/aa/index.html =>  ["404","aa","index.html"]
  let RPStr = base.split("/")[0]; 

  if (trailing_index && trailing_index === false) {
    // 404/aa/index.html => 404/aa/
    base = base.replace(/index.html$/gi, '');
  }
  if (trailing_html && trailing_html === false) {
    // 404/aa/index.html => 404/aa/index
    base = base.replace(/html$/gi, '');
  }

  let i18nPath = this.url_for('/' + base);
  if (i18nType && i18nType.length) {
    for (const i of i18nType) {
      if (RPStr.toLowerCase() === i.toLowerCase()) {
        if (i18nMode == 1) {
          i18nPath = this.url_for('/' + language + '/' + base);
        }
        if (i18nMode == 2) {
          // this.languages.indexOf(language) === 0
          //   The indexOf() method can return the location where the specified string value first appears in the string.
          //   languages: ["en","zh-CN"]  language: en => 0
          i18nPath = this.url_for(`${this.languages.indexOf(language) === 0 ? '' : '/' + language}/${base}`);
        }
      }
    }
  }

  // Debug
  // console.log('base2: ' + base);
  // console.log('RPStr: ' + RPStr);
  // console.log('language: ' + language);
  // console.log('i18nMode: ' + i18nMode);
  // console.log('i18nPath: ' + i18nPath);
  // console.log('languages: ' + JSON.stringify(this.languages));
  // console.log('   ');

  return i18nPath;
});

/**
 * Get the language name
 */
hexo.extend.helper.register('language_name', function(language) {
  const name = hexo.theme.i18n.__(language)('name');
  return name === 'name' ? language : name;
});
