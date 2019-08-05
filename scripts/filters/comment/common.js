'use strict';

function capitalize(input) {
  return input.toString().charAt(0).toUpperCase() + input.toString().substr(1);
}

module.exports = {
  iconText(icon, key, defaultValue) {
    if (!defaultValue) {
      defaultValue = capitalize(key);
    }
    return `
      <span class="post-meta-item-icon">
        <i class="fa fa-${icon}"></i>
      </span>
      {%- set post_meta_comment = __('post.comments.${key}') %}
      {%- if post_meta_comment == 'post.comments.${key}' %}
        {%- set post_meta_comment = '${defaultValue}' %}
      {%- endif %}
      <span class="post-meta-item-text">{{ post_meta_comment + __('symbol.colon') }}</span>
    `;
  }
};
