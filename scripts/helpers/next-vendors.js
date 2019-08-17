/* global hexo */

'use strict';

hexo.extend.helper.register('next_vendors', function(url) {
    let internal = hexo.theme.config._internal;
    return this.url_for(`${internal}/${url}`);
});
