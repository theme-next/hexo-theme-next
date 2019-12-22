{%- set ccIcon = '<i class="fa fa-fw fa-creative-commons"></i>' %}
{%- set ccText = theme.creative_commons.license | upper %}

<div>
<ul class="post-copyright">
  <li class="post-copyright-author">
    <strong>{{ __('post.copyright.author') + __('symbol.colon') }} </strong>
    {{- page.author or author }}
  </li>
  <li class="post-copyright-link">
    <strong>{{ __('post.copyright.link') + __('symbol.colon') }}</strong>
    {{ next_url(page.permalink, page.permalink, {title: page.title}) }}
  </li>
  <li class="post-copyright-license">
    <strong>{{ __('post.copyright.license_title') + __('symbol.colon') }} </strong>
    {{- __('post.copyright.license_content', next_url(ccURL, ccIcon + ccText)) }}
  </li>
</ul>
</div>
<script>
    document.body.oncopy = event => {
        event.preventDefault(); // 取消默认的复制事件 
        let textFont = copyFont = window.getSelection(0).toString();
        if (copyFont.length > 10) {
            textFont = copyFont + '\n\n' +
                "--------------------\n" +
                "{{ __('post.copyright.author') + __('symbol.colon') }}{{- page.author or author }}\n" +
                "{{ __('post.copyright.link') + __('symbol.colon') }}{{ page.permalink }}\n" +
                "{{ __('post.copyright.license_title') + __('symbol.colon') }}{{ ccText }}";
        }
        if (event.clipboardData) {
            return event.clipboardData.setData('text', textFont);
        }
        return window.clipboardData.setData("text", textFont);
    }
</script>        
