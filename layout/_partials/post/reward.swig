<div style="padding: 10px 0; margin: 20px auto; width: 90%; text-align: center;">
  <div>{{ theme.reward.comment }}</div>
  <button id="rewardButton" disable="enable" onclick="var qr = document.getElementById(&quot;QR&quot;); if (qr.style.display === 'none') {qr.style.display='block';} else {qr.style.display='none'}">
    <span>{{ __('reward.donate') }}</span>
  </button>
  <div id="QR" style="display: none;">

    {% if theme.reward.wechatpay %}
      <div id="wechat" style="display: inline-block">
        <img id="wechat_qr" src="{{ url_for(theme.reward.wechatpay) }}" alt="{{ author }} {{ __('reward.wechatpay') }}"/>
        <p>{{ __('reward.wechatpay') }}</p>
      </div>
    {% endif %}

    {% if theme.reward.alipay %}
      <div id="alipay" style="display: inline-block">
        <img id="alipay_qr" src="{{ url_for(theme.reward.alipay) }}" alt="{{ author }} {{ __('reward.alipay') }}"/>
        <p>{{ __('reward.alipay') }}</p>
      </div>
    {% endif %}

    {% if theme.reward.bitcoin %}
      <div id="bitcoin" style="display: inline-block">
        <img id="bitcoin_qr" src="{{ url_for(theme.reward.bitcoin) }}" alt="{{ author }} {{ __('reward.bitcoin') }}"/>
        <p>{{ __('reward.bitcoin') }}</p>
      </div>
    {% endif %}

  </div>
</div>
