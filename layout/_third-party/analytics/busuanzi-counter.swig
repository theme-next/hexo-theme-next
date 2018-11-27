{% if theme.busuanzi_count.enable %}
<div class="busuanzi-count">
  <script async src="https://busuanzi.ibruce.info/busuanzi/2.3/busuanzi.pure.mini.js"></script>

  {% if theme.busuanzi_count.total_visitors %}
    <span class="site-uv" title="{{ __('footer.total_visitors') }}">
      {% if theme.busuanzi_count.header %}
        {{theme.busuanzi_count.header.total_visitors_header}}
      {% endif %}
      <i class="fa fa-{{ theme.busuanzi_count.total_visitors_icon }}"></i>
      <span class="busuanzi-value" id="busuanzi_value_site_uv"></span>
      {% if theme.busuanzi_count.footer %}
        {{theme.busuanzi_count.footer.total_visitors_footer}}
      {% endif %}
    </span>
  {% endif %}

  {% if theme.busuanzi_count.total_views %}
    <span class="site-pv" title="{{ __('footer.total_views') }}">
      {% if theme.busuanzi_count.header %}
          {{theme.busuanzi_count.header.total_views_header}}
      {% endif %}
      <i class="fa fa-{{ theme.busuanzi_count.total_views_icon }}"></i>
      <span class="busuanzi-value" id="busuanzi_value_site_pv"></span>
        {% if theme.busuanzi_count.footer %}
          {{theme.busuanzi_count.footer.total_views_footer}}
        {% endif %}
    </span>
  {% endif %}
</div>
{% endif %}

