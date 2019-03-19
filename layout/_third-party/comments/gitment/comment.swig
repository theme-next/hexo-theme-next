<div class="comments" id="comments">
  {% if theme.gitment.lazy %}
     <div onclick="showGitment()" id="gitment-display-button">{{ __('gitmentbutton') }}</div>
     <div id="gitment-container" style="display: none"></div>
  {% else %}
     <div id="gitment-container"></div>
   {% endif %}
</div>
