<div id="reward-container">
  <div>{{ theme.reward_settings.comment }}</div>
  <button id="reward-button" disable="enable" onclick="var qr = document.getElementById(&quot;qr&quot;); qr.style.display = (qr.style.display === 'none') ? 'block' : 'none';">
    {{ __('reward.donate') }}
  </button>
  <div id="qr" style="display: none;">

    {% for name, image in theme.reward %}
      {% set builtin = ['wechatpay', 'alipay', 'bitcoin'] %}
      {% if builtin.indexOf(name) !== -1 %}
        {% set translation = __('reward.' + name) %}
      {% else %}
        {% set translation = name %}
      {% endif %}
      <div style="display: inline-block">
        <picture>
          <source srcset="{{ url_for(image) }}?imageView2/format/webp" type="image/webp">
          <source srcset="{{ url_for(image) }}?imageView2/format/png" type="image/png">
          <img src="{{ url_for(image) }}" alt="{{ author.text }} {{ translation }}"/>
        </picture>
        <p>{{ translation }}</p>
      </div>
    {% endfor %}

  </div>
</div>
