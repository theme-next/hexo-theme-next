{%- if theme.rating.enable or (theme.vkontakte_api.enable and theme.vkontakte_api.like) or (theme.facebook_sdk.enable and theme.facebook_sdk.like_button) %}
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
  </div>
{%- endif %}
