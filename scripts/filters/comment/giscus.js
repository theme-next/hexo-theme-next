/* global hexo */

'use strict';

const path = require('path');

// Add comment
hexo.extend.filter.register('theme_inject', injects => {
  let theme = hexo.theme.config;
  if (!theme.giscus.enable) return;

  injects.comment.raw('giscus', `
  {% if page.comments %}
  <div class="comments">
    <script src="{{theme.giscus.cdn}}"
            data-repo="{{theme.giscus.repo}}"
            data-repo-id="{{theme.giscus.repo-id}}"
            data-category="{{theme.giscus.category}}"
            data-category-id="{{theme.giscus.category_id}}"
            data-mapping="{{theme.giscus.pathname}}"
            data-reactions-enabled="{{theme.giscus.reactions_enabled}}"
            data-emit-metadata="{{theme.giscus.emit_metadata}}"
            data-theme="{{theme.giscus.theme}}"
            crossorigin="anonymous"
            async>
    </script>
  </div>
  {% endif %}
  `);

});