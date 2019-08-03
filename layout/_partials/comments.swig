{%- if page.comments %}
  {%- if theme.injects.comment.length == 1 %}
    {%- set inject_item = theme.injects.comment[0] %}
    {{ partial(inject_item.layout, inject_item.locals, inject_item.options) }}
  {%- elif theme.injects.comment.length > 1 %}
    <div class='comment-button-group'>
      {%- for inject_item in theme.injects.comment %}
        <a class='btn comment-button {{inject_item.locals.class}}'>{{inject_item.locals.button}}</a>
      {%- endfor %}
    </div>
    {%- for inject_item in theme.injects.comment %}
      <div class='comment-position {{inject_item.locals.class}}'>
        {{ partial(inject_item.layout, inject_item.locals, inject_item.options) }}
      </div>
    {%- endfor %}
    <script>
      let commentButton = document.querySelectorAll('.comment-button');
      commentButton.forEach(item => {
        let commentClass = item.classList[2];
        item.addEventListener("click", () => {
          commentButton.forEach(rmActive => rmActive.classList.remove('active'));
          item.classList.add('active');
          document.querySelectorAll('.comment-position').forEach(rmActive => rmActive.classList.remove('active'));
          document.querySelector(`.comment-position.${commentClass}`).classList.add('active');
        })
      })
      {%- if theme.comments.active %}
        let activeButton = document.querySelector('.comment-button.{{theme.comments.active}}');
        if (activeButton) {
          activeButton.click();
        }
      {%- endif %}
    </script>
  {%- endif %}
{%- endif %}
