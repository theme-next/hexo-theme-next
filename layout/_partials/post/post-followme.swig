{%- if theme.follow_me.enable %}
  {%- set builtin = ['twitter', 'weibo', 'telegram', 'wechat'] %}

  <div class="followme flex-column align-center">
    <p>欢迎关注我的其它发布渠道</p>

    <div class="flex align-center social-list">

        {%- for name, link in theme.follow_me.channels %}
          {%- if builtin.includes(name) %}
            {%- set icon_url = __('/images/follow-me/' + name + '.svg') %}
            <div class="social-item">
              <a target="_blank" class="social-link" href="{{ link.split('||')[0] }}">
                <img class="social-image" src="{{ url_for(icon_url) }}" alt="">
                <span>{{ link.split('||')[1] }}</span>
              </a>
            </div>
          {%- endif %}
        {%- endfor %}

    </div>
  </div>
{%- endif %}
