'use strict';

/**
 * Usage:
 * {% folding [args], title %}
 * content
 * {% endfolding %}
 *
 * args:
 *   - color: blue, cyan, green, yellow, red
 *   - status: open # means open by default
 *
 * example:
 * {% folding cyan open, view the default folding box %}
 * This is a folding box that opens by default
 * {% endfolding %}
 */
function postFolding(args, content) {
  args = args.join(' ').split(',');
  let style = ''
  let title = ''
  if (args.length > 1) {
    style = args[0].trim()
    title = args[1].trim()
  } else if (args.length > 0) {
    title = args[0].trim()
  }
  if (style != undefined) {
    return `<details ${style}><summary> ${hexo.render.renderSync({text: title, engine: 'markdown'}).split('\n').join('')} </summary>
              <div class='content'>
              ${hexo.render.renderSync({text: content, engine: 'markdown'}).split('\n').join('')}
              </div>
            </details>`;
  } else {
    return `<details><summary> ${hexo.render.renderSync({text: title, engine: 'markdown'}).split('\n').join('')} </summary>
              <div class='content'>
              ${hexo.render.renderSync({text: content, engine: 'markdown'}).split('\n').join('')}
              </div>
            </details>`;
  }

}

hexo.extend.tag.register('folding', postFolding, {ends: true});
