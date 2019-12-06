{%- if page.comments %}
  {%- if theme.injects.comment.length == 1 %}
    {%- set inject_item = theme.injects.comment[0] %}
    {{ partial(inject_item.layout, inject_item.locals, inject_item.options) }}
  {%- elif theme.injects.comment.length > 1 %}
    {%- if theme.comments.style == 'buttons' %}
      <div class="comment-button-group">
        {%- for inject_item in theme.injects.comment %}
          <a class="btn comment-button {{ inject_item.locals.class }}">{{ inject_item.locals.button }}</a>
        {%- endfor %}
      </div>
      {%- for inject_item in theme.injects.comment %}
        <div class="comment-position {{ inject_item.locals.class }}">
          {{ partial(inject_item.layout, inject_item.locals, inject_item.options) }}
        </div>
      {%- endfor %}
      <script{{ pjax }}>
        (function() {
          let commentButton = document.querySelectorAll('.comment-button');
            commentButton.forEach(element => {
            let commentClass = element.classList[2];
            element.addEventListener('click', () => {
              commentButton.forEach(rmActive => rmActive.classList.remove('active'));
              element.classList.add('active');
              document.querySelectorAll('.comment-position').forEach(rmActive => rmActive.classList.remove('active'));
              document.querySelector(`.comment-position.${commentClass}`).classList.add('active');
              if (CONFIG.comments.storage) {
                localStorage.setItem('comments_active', commentClass);
              }
            });
          });
          let activeClass = CONFIG.comments.activeClass;
          if (CONFIG.comments.storage) {
            activeClass = localStorage.getItem('comments_active') || activeClass;
          }
          if (activeClass) {
            let activeButton = document.querySelector(`.comment-button.${activeClass}`);
            if (activeButton) {
              activeButton.click();
            }
          }
        })();
      </script>
    {%- elif theme.comments.style == 'tabs' %}
      <div class="tabs tabs-comment">
        <ul class="nav-tabs">
          {%- for inject_item in theme.injects.comment %}
            <li class="tab"><a href="#comment-{{ inject_item.locals.class }}">{{ inject_item.locals.button }}</a></li>
          {%- endfor %}
        </ul>
        <div class="tab-content">
          {%- for inject_item in theme.injects.comment %}
            <div class="tab-pane {{ inject_item.locals.class }}" id="comment-{{ inject_item.locals.class }}">
              {{ partial(inject_item.layout, inject_item.locals, inject_item.options) }}
            </div>
          {%- endfor %}
        </div>
      </div>
    {%- endif %}
  {%- endif %}
{%- endif %}

<script>
  window.addEventListener('tabs:register', () => {
    let activeClass = CONFIG.comments.activeClass;
    if (CONFIG.comments.storage) {
      activeClass = localStorage.getItem('comments_active') || activeClass;
    }
    if (activeClass) {
      let activeTab = document.querySelector(`a[href="#comment-${activeClass}"]`);
      if (activeTab) {
        activeTab.click();
      }
    }
  });
  if (CONFIG.comments.storage) {
    window.addEventListener('tabs:click', event => {
      if (!event.target.matches('.tabs-comment .tab-content .tab-pane')) return;
      let commentClass = event.target.classList[1];
      localStorage.setItem('comments_active', commentClass);
    });
  }
</script>
