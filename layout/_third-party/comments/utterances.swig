{%- if page.comments %}
    {% set repo = theme.utterances.repo %}
    {% set pathname = theme.utterances.pathname %}
    {% set utheme = theme.utterances.theme %}
    {% set cdn = theme.utterances.cdn %}

    <div class="comments">
    <script src="{{cdn}}"
        repo="{{repo}}"
        issue-term="{{pathname}}"
        theme="{{utheme}}"
        crossorigin="anonymous"
        async>
    </script>
    </div>
{%- endif %}