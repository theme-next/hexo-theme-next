{% macro render(display_toc) %}
  <div class="sidebar-toggle">
    <div class="sidebar-toggle-line-wrap">
      <span class="sidebar-toggle-line sidebar-toggle-line-first"></span>
      <span class="sidebar-toggle-line sidebar-toggle-line-middle"></span>
      <span class="sidebar-toggle-line sidebar-toggle-line-last"></span>
    </div>
  </div>

  <aside id="sidebar" class="sidebar">
    <div class="sidebar-inner">

      {%- set display_toc = theme.toc.enable and display_toc %}
      {%- if display_toc %}
        {%- set next_toc_number = page.toc_number | default(theme.toc.number) %}
        {%- set next_toc_max_depth = page.toc_max_depth | default(theme.toc.max_depth) | default(6) %}
        {%- set toc = toc(page.content, { "class": "nav", list_number: next_toc_number, max_depth: next_toc_max_depth }) %}
        {%- set display_toc = toc.length > 1 and display_toc %}
      {%- endif %}

      <ul class="sidebar-nav motion-element">
        <li class="sidebar-nav-toc" data-target="post-toc-wrap">
          {{ __('sidebar.toc') }}
        </li>
        <li class="sidebar-nav-overview" data-target="site-overview-wrap">
          {{ __('sidebar.overview') }}
        </li>
      </ul>

      <!--noindex-->
      <div class="post-toc-wrap sidebar-panel">
        {%- if display_toc %}
          <div class="post-toc">
            <div class="post-toc-content">{{ toc }}</div>
          </div>
        {%- endif %}
      </div>
      <!--/noindex-->

      <div class="site-overview-wrap sidebar-panel">
        <div class="site-overview">
          {{ partial('_partials/sidebar/site-overview.swig', {}, {cache: theme.cache.enable}) }}

          {{- next_inject('sidebar') }}
        </div>
      </div>

      {%- if theme.back2top.enable and theme.back2top.sidebar %}
        <div class="back-to-top motion-element">
          <i class="fa fa-arrow-up"></i>
          <span>0%</span>
        </div>
      {%- endif %}

    </div>
  </aside>
  <div id="sidebar-dimmer"></div>
{% endmacro %}
