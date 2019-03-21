{% if page.comments %}

  {% if theme.valine.enable and theme.valine.appid and theme.valine.appkey %}
    <div class="comments" id="comments">
    </div>

  {% elif theme.gitment.enable %}
    <div class="comments" id="comments">
      {% if theme.gitment.lazy %}
        <div onclick="showGitment()" id="gitment-display-button">{{ __('gitmentbutton') }}</div>
        <div id="gitment-container" style="display: none"></div>
      {% else %}
        <div id="gitment-container"></div>
      {% endif %}
    </div>

  {% elif theme.gitalk.enable %}
    <div class="comments" id="gitalk-container">
    </div>

  {% endif %}

{% endif %}
