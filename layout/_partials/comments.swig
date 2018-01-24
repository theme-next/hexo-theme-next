{% if page.comments %}

  
    {% if theme.gitalk.enable %}
        {% if theme.gitalk.click_show %}
            <div onclick="showGitalk();" id="gitalk_title" class="gitalk_title">显示 Gitalk 评论</div>
        {% endif %}
    {% endif %}
    {% if theme.disqus.enable %}
        {% if theme.disqus.click_show %}
        <div onclick="showDisqus();" id="disqus_title" class="disqus_title">显示 Disqus 评论</div>
        {% endif %}
    {% endif %}


    {% if theme.gitalk.enable %}
        <div id="gitalk_container" style="display:none;"></div>
    {% endif %}

    {% if theme.disqus.enable %}
        <div id="disqus_thread">
        <div id="dqs_loading"><div id="dqs_loading_inner"></div></div>
        <noscript>
            Please enable JavaScript to view the
            <a href="https://disqus.com/?ref_noscript">comments powered by Disqus.</a>
        </noscript>
        </div>
    {% endif %}

    {#
    {% if theme.disqus.enable %}
        <div id="disqus_thread">
        <noscript>
            Please enable JavaScript to view the
            <a href="https://disqus.com/?ref_noscript">comments powered by Disqus.</a>
        </noscript>
        </div>
    {% endif %}
    #}

  {% if theme.facebook_sdk.enable and theme.facebook_comments_plugin.enable %}
    <div class="comments" id="comments">
      <div class="fb-comments"
           data-href="{{ page.permalink }}"
           data-numposts="{{ theme.facebook_comments_plugin.num_of_posts }}"
           data-width="{{ theme.facebook_comments_plugin.width }}"
           data-colorscheme="{{ theme.facebook_comments_plugin.scheme }}">
      </div>
    </div>

  {% elseif theme.vkontakte_api.enable and theme.vkontakte_api.comments %}
    <div class="comments" id="comments">
      <div id="vk_comments"></div>
    </div>

  {% elseif theme.hypercomments_id %}
    <div class="comments" id="comments">
      <div id="hypercomments_widget"></div>
    </div>

  {% elseif theme.youyan_uid %}
    <div class="comments" id="comments">
      <div id="uyan_frame"></div>
    </div>

  {% elseif theme.livere_uid %}
    <div class="comments" id="comments">
      <div id="lv-container" data-id="city" data-uid="{{ theme.livere_uid }}"></div>
    </div>

  {% elseif theme.changyan.enable and theme.changyan.appid and theme.changyan.appkey %}
    <div class="comments" id="comments">
      <div id="SOHUCS"></div>
    </div>

  {% elseif theme.gitment.enable %}
    <div class="comments" id="comments">
      {% if theme.gitment.lazy %}
        <div onclick="showGitment()" id="gitment-display-button">{{ __('gitmentbutton') }}</div>
        <div id="gitment-container" style="display:none"></div>
      {% else %}
        <div id="gitment-container"></div>
      {% endif %}
    </div>

  {% elseif theme.valine.enable and theme.valine.appid and theme.valine.appkey %}
    <div class="comments" id="comments">
    </div>
  {% endif %}

{% endif %}
