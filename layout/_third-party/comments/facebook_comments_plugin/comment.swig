{% if theme.facebook_sdk.enable %}
  <div class="comments" id="comments">
    <div class="fb-comments"
         data-href="{{ page.permalink }}"
          data-numposts="{{ theme.facebook_comments_plugin.num_of_posts }}"
          data-width="{{ theme.facebook_comments_plugin.width }}"
         data-colorscheme="{{ theme.facebook_comments_plugin.scheme }}">
    </div>
  </div>
{% endif %}
