{%- if theme.rating.enable or (theme.vkontakte_api.enable and theme.vkontakte_api.like) or (theme.facebook_sdk.enable and theme.facebook_sdk.like_button) or theme.likely.enable or (theme.needmoreshare2.enable and theme.needmoreshare2.postbottom.enable) %}
  <div class="post-widgets">
  {%- if theme.rating.enable %}
    <div class="wp_rating">
      <div id="wpac-rating"></div>
    </div>
  {%- endif %}

  {%- if (theme.vkontakte_api.enable and theme.vkontakte_api.like) or (theme.facebook_sdk.enable and theme.facebook_sdk.like_button) %}
    <div class="social-like">
      {%- if theme.vkontakte_api.enable and theme.vkontakte_api.like %}
        <div class="vk_like">
          <span id="vk_like"></span>
        </div>
      {%- endif %}

      {%- if theme.facebook_sdk.enable and theme.facebook_sdk.like_button %}
        <div class="fb_like">
          <div class="fb-like" data-layout="button_count" data-share="true"></div>
        </div>
      {%- endif %}
    </div>
  {%- endif %}

  {%- if theme.likely.enable or (theme.needmoreshare2.enable and theme.needmoreshare2.postbottom.enable) %}
    <div class="social-share">
      {%- if theme.likely.enable %}
        {%- if theme.likely.look == 'normal' %}
          {%- set likely_look = 'likely' %}
        {% else %}
          {%- set likely_look = 'likely likely-' + theme.likely.look %}
        {%- endif %}

        <div class="{{ likely_look }}">
          {%- for x in theme.likely.networks %}
            <div class="{{ loop.key }}">{{ x }}</div>
          {%- endfor %}
        </div>
      {%- endif %}
      {%- if theme.needmoreshare2.enable and theme.needmoreshare2.postbottom.enable %}
        <div id="needsharebutton-postbottom">
          <span class="btn">
            <i class="fa fa-share-alt" aria-hidden="true"></i>
          </span>
        </div>
      {%- endif %}
    </div>
  {%- endif %}
  </div>
{%- endif %}
