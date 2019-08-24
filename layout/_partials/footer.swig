<div class="copyright">{#
#}{%- set current = date(Date.now(), "YYYY") %}{#
#}{%- if theme.footer.beian.enable %}{#
#}{{ next_url('http://www.beian.miit.gov.cn', theme.footer.beian.icp + ' ') }}
  {%- if theme.footer.beian.gongan_icon_url %}<span><img src="{{ theme.footer.beian.gongan_icon_url }}" style="display:inline-block;"/>
  {%- endif %}
  {{ next_url('http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=' + theme.footer.beian.gongan_id,
  theme.footer.beian.gongan_num + ' ') }}{#
#}{%- endif %}{#
#}&copy; {% if theme.footer.since and theme.footer.since != current %}{{ theme.footer.since }} – {% endif %}{#
#}<span itemprop="copyrightYear">{{ current }}</span>
  <span class="with-love" id="animate">
    <i class="fa fa-{{ theme.footer.icon.name }}"></i>
  </span>
  <span class="author" itemprop="copyrightHolder">{{ theme.footer.copyright || author }}</span>

  {%- if config.symbols_count_time.total_symbols %}
    <span class="post-meta-divider">|</span>
    <span class="post-meta-item-icon">
      <i class="fa fa-area-chart"></i>
    </span>
    {%- if theme.symbols_count_time.item_text_total %}
      <span class="post-meta-item-text">{{ __('symbols_count_time.count_total') + __('symbol.colon') }}</span>
    {%- endif %}
    <span title="{{ __('symbols_count_time.count_total') }}">{#
    #}{{ symbolsCountTotal(site) }}{#
  #}</span>
  {%- endif %}

  {%- if config.symbols_count_time.total_time %}
    <span class="post-meta-divider">|</span>
    <span class="post-meta-item-icon">
      <i class="fa fa-coffee"></i>
    </span>
    {%- if theme.symbols_count_time.item_text_total %}
      <span class="post-meta-item-text">{{ __('symbols_count_time.time_total') }} &asymp;</span>
    {%- endif %}
    <span title="{{ __('symbols_count_time.time_total') }}">{#
    #}{{ symbolsTimeTotal(site, theme.symbols_count_time.awl, theme.symbols_count_time.wpm, __('symbols_count_time.time_minutes')) }}{#
  #}</span>
  {%- endif %}
</div>

{%- if theme.footer.powered.enable %}
  <div class="powered-by">{#
  #}{{ __('footer.powered', next_url('https://hexo.io', 'Hexo', {class: 'theme-link'})) }}{#
  #}{%- if theme.footer.powered.version %} v{{ hexo_env('version') }}{%- endif %}{#
 #}</div>
{%- endif %}

{%- if theme.footer.powered.enable and theme.footer.theme.enable %}
  <span class="post-meta-divider">|</span>
{%- endif %}

{%- if theme.footer.theme.enable %}
  <div class="theme-info">{#
  #}{{ __('footer.theme') }} – {{ next_url('https://theme-next.org', 'NexT.' + theme.scheme, {class: 'theme-link'}) }}{#
  #}{%- if theme.footer.theme.version %} v{{ version }}{%- endif %}{#
#}</div>
{%- endif %}

{%- if theme.add_this_id %}
  <div class="addthis_inline_share_toolbox">
    <script src="//s7.addthis.com/js/300/addthis_widget.js#pubid={{ theme.add_this_id }}" async="async"></script>
  </div>
{%- endif %}

{{- next_inject('footer') }}
