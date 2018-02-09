{% if theme.busuanzi_count.enable %}
<div class="busuanzi-count">
  <script async src="https://dn-lbstatics.qbox.me/busuanzi/2.3/busuanzi.pure.mini.js"></script>

  {% if theme.busuanzi_count.site_uv %}
    <span class="site-uv" title="{{ __('footer.site_uv') }}">
      <i class="fa fa-user"></i>
      <span class="busuanzi-value" id="busuanzi_value_site_uv"></span>
    </span>
  {% endif %}

  {% if theme.busuanzi_count.site_pv %}
    <span class="site-pv" title="{{ __('footer.site_pv') }}">
      <i class="fa fa-eye"></i>
      <span class="busuanzi-value" id="busuanzi_value_site_pv"></span>
    </span>
  {% endif %}
</div>
{% endif %}

