  {##################}
  {### POST BLOCK ###}
  {##################}
  <article itemscope itemtype="http://schema.org/Article" class="post-block {% if is_index %}home{% endif %}" lang="{{ post.lang or post.language or config.language }}">
    <link itemprop="mainEntityOfPage" href="{{ config.url }}{{ url_for(post.path) }}">

    <span hidden itemprop="author" itemscope itemtype="http://schema.org/Person">
      <meta itemprop="image" content="{{ url_for(theme.avatar.url or theme.images + '/avatar.gif') }}">
      <meta itemprop="name" content="{{ author }}">
      <meta itemprop="description" content="{{ description }}">
    </span>

    <span hidden itemprop="publisher" itemscope itemtype="http://schema.org/Organization">
      <meta itemprop="name" content="{{ title }}">
    </span>

    {%- if post.header !== false %}
      <header class="post-header">
        <{%- if theme.seo %}h2{% else %}h1{%- endif %} class="post-title{%- if post.direction and post.direction.toLowerCase() === 'rtl' %} rtl{%- endif %}" itemprop="name headline">
          {# Link posts #}
          {%- if post.link %}
            {%- if post.sticky > 0 %}
              <span class="post-sticky-flag" title="{{ __('post.sticky') }}">
                <i class="fa fa-thumb-tack"></i>
              </span>
            {%- endif %}
            {%- set postTitleIcon = '<i class="fa fa-external-link"></i>' %}
            {%- set postText = post.title or post.link %}
            {{ next_url(post.link, postText + postTitleIcon, {class: 'post-title-link post-title-link-external', itemprop: 'url'}) }}
          {% elif is_index %}
            {%- if post.sticky > 0 %}
              <span class="post-sticky-flag" title="{{ __('post.sticky') }}">
                <i class="fa fa-thumb-tack"></i>
              </span>
            {%- endif %}
            {{ next_url(post.path, post.title or __('post.untitled'), {class: 'post-title-link', itemprop: 'url'}) }}
          {%- else %}
            {{- post.title }}
            {{- post_edit(page.source) }}
          {%- endif %}
        </{%- if theme.seo %}h2{% else %}h1{%- endif %}>

        <div class="post-meta">

          {%- set date_diff = date(post.date) != date(post.updated) %}
          {%- set time_diff = time(post.date) != time(post.updated) %}
          {%- set datetime_diff = date_diff or time_diff %}

          {%- if theme.post_meta.created_at %}
            <span class="post-meta-item">
              <span class="post-meta-item-icon">
                <i class="fa fa-calendar-o"></i>
              </span>
              <span class="post-meta-item-text">{{ __('post.posted') }}</span>

              {%- if not date_diff and time_diff and theme.post_meta.updated_at.enable and theme.post_meta.updated_at.another_day %}
                {%- set create_title = __('post.created') + __('symbol.colon') + full_date(post.date) + ' / ' + __('post.modified') + __('symbol.colon') + time(post.updated) %}
              {% else %}
                {%- set create_title = __('post.created') + __('symbol.colon') + full_date(post.date) %}
              {%- endif %}

              <time title="{{ create_title }}" itemprop="dateCreated datePublished" datetime="{{ moment(post.date).format() }}">{{ date(post.date) }}</time>
            </span>
          {%- endif %}

          {%- if theme.post_meta.updated_at.enable and datetime_diff %}
            {%- set display_updated = not theme.post_meta.updated_at.another_day or theme.post_meta.updated_at.another_day and date_diff %}

            {%- if display_updated or not theme.post_meta.created_at %}
              <span class="post-meta-item">
                <span class="post-meta-item-icon">
                  <i class="fa fa-calendar-check-o"></i>
                </span>
                <span class="post-meta-item-text">{{ __('post.edited') }}</span>
                <time title="{{ __('post.modified') + __('symbol.colon') + full_date(post.updated) }}" itemprop="dateModified" datetime="{{ moment(post.updated).format() }}">{{ date(post.updated) }}</time>
              </span>
            {%- endif %}
          {%- endif %}

          {%- if post.categories and post.categories.length and theme.post_meta.categories %}
            <span class="post-meta-item">
              <span class="post-meta-item-icon">
                <i class="fa fa-folder-o"></i>
              </span>
              <span class="post-meta-item-text">{{ __('post.in') }}</span>
              {%- for cat in post.categories.toArray() %}
                <span itemprop="about" itemscope itemtype="http://schema.org/Thing">
                  <a href="{{ url_for(cat.path) }}" itemprop="url" rel="index">
                    <span itemprop="name">{{ cat.name }}</span>
                  </a>
                </span>

                {%- set cat_length = post.categories.length %}
                {%- if cat_length > 1 and loop.index !== cat_length %}
                  {{ __('symbol.comma') }}
                {%- endif %}
              {%- endfor %}
            </span>
          {%- endif %}

          {# LeanCloud PageView #}
          {%- if theme.leancloud_visitors.enable or (theme.valine.enable and theme.valine.appid and theme.valine.appkey and theme.valine.visitor) %}
            <span id="{{ url_for(post.path) }}" class="post-meta-item leancloud_visitors" data-flag-title="{{ post.title }}" title="{{ __('post.views') }}">
              <span class="post-meta-item-icon">
                <i class="fa fa-eye"></i>
              </span>
              <span class="post-meta-item-text">{{ __('post.views') + __('symbol.colon') }}</span>
              <span class="leancloud-visitors-count"></span>
            </span>
          {%- endif %}

          {%- if theme.firestore.enable %}
            <span class="post-meta-item" title="{{ __('post.views') }}">
              <span class="post-meta-item-icon">
                <i class="fa fa-users"></i>
              </span>
              <span class="post-meta-item-text">{{ __('post.views') + __('symbol.colon') }}</span>
              <span class="firestore-visitors-count"></span>
            </span>
          {%- endif %}

          {%- if not is_index and theme.busuanzi_count.enable and theme.busuanzi_count.post_views %}
            <span class="post-meta-item" title="{{ __('post.views') }}" id="busuanzi_container_page_pv" style="display: none;">
              <span class="post-meta-item-icon">
                <i class="fa fa-{{ theme.busuanzi_count.post_views_icon }}"></i>
              </span>
              <span class="post-meta-item-text">{{ __('post.views') + __('symbol.colon') }}</span>
              <span id="busuanzi_value_page_pv"></span>
            </span>
          {%- endif %}

          {{- next_inject('postMeta') }}

          {%- if config.symbols_count_time.symbols %}
          {%- if theme.symbols_count_time.separated_meta %}<br>{%- endif %}
            <span class="post-meta-item" title="{{ __('symbols_count_time.count') }}">
              <span class="post-meta-item-icon">
                <i class="fa fa-file-word-o"></i>
              </span>
              {%- if theme.symbols_count_time.item_text_post %}
                <span class="post-meta-item-text">{{ __('symbols_count_time.count') + __('symbol.colon') }}</span>
              {%- endif %}
              <span>{{ symbolsCount(post) }}</span>
            </span>
          {%- endif %}

          {%- if config.symbols_count_time.time %}
            <span class="post-meta-item" title="{{ __('symbols_count_time.time') }}">
              <span class="post-meta-item-icon">
                <i class="fa fa-clock-o"></i>
              </span>
              {%- if theme.symbols_count_time.item_text_post %}
                <span class="post-meta-item-text">{{ __('symbols_count_time.time') }} &asymp;</span>
              {%- endif %}
              <span>{{ symbolsTime(post, theme.symbols_count_time.awl, theme.symbols_count_time.wpm, __('symbols_count_time.time_minutes')) }}</span>
            </span>
          {%- endif %}

          {%- if post.description and (not theme.excerpt_description or not is_index) %}
            <div class="post-description">{{ post.description }}</div>
          {%- endif %}

        </div>
      </header>
    {%- endif %}

    {#################}
    {### POST BODY ###}
    {#################}
    <div class="post-body{%- if post.direction and post.direction.toLowerCase() === 'rtl' %} rtl{%- endif %}" itemprop="articleBody">

      {# Gallery support #}
      {%- if post.photos and post.photos.length %}
        <div class="post-gallery" itemscope itemtype="http://schema.org/ImageGallery">
          {%- set COLUMN_NUMBER = 3 %}
          {%- for photo in post.photos.toArray() %}
            {%- if loop.index0 % COLUMN_NUMBER === 0 %}<div class="post-gallery-row">{%- endif %}
              <img src="{{ url_for(photo) }}" itemprop="contentUrl">
            {%- if loop.index0 % COLUMN_NUMBER === 2 %}</div>{%- endif %}
          {%- endfor %}

          {# Append end tag for `post-gallery-row` when (photos size mod COLUMN_NUMBER) is less than COLUMN_NUMBER #}
          {%- if post.photos.length % COLUMN_NUMBER > 0 %}</div>{%- endif %}
        </div>
      {%- endif %}

      {%- if is_index %}
        {%- if post.description and theme.excerpt_description %}
          {{ post.description }}
          <!--noindex-->
          {%- if theme.read_more_btn %}
            <div class="post-button">
              <a class="btn" href="{{ url_for(post.path) }}">
                {{ __('post.read_more') }} &raquo;
              </a>
            </div>
          {%- endif %}
          <!--/noindex-->
        {% elif post.excerpt %}
          {{ post.excerpt }}
          <!--noindex-->
          {%- if theme.read_more_btn %}
            <div class="post-button">
              <a class="btn" href="{{ url_for(post.path) }}{%- if theme.scroll_to_more %}#more{%- endif %}" rel="contents">
                {{ __('post.read_more') }} &raquo;
              </a>
            </div>
          {%- endif %}
          <!--/noindex-->
        {% else %}
          {{ post.content }}
        {%- endif %}
      {% else %}
        {{ post.content }}
      {%- endif %}
    </div>

    {#####################}
    {### END POST BODY ###}
    {#####################}

    {%- if theme.related_posts.enable and (theme.related_posts.display_in_home or not is_index) %}
      {{ partial('_partials/post/post-related.swig') }}
    {%- endif %}

    {%- if not is_index %}
      {{- next_inject('postBodyEnd') }}

      {%- if theme.wechat_subscriber.enable %}
        {{ partial('_partials/post/wechat-subscriber.swig', {}, {cache: theme.cache.enable}) }}
      {%- endif %}

      {%- if post.reward === undefined and theme.reward_settings.enable %}
        {%- set reward_able = true %}
      {% else %}
        {%- set reward_able = post.reward %}
      {%- endif %}
      {%- if reward_able %}
        {{ partial('_partials/post/post-reward.swig', {}, {cache: theme.cache.enable}) }}
      {%- endif %}

      {%- if theme.creative_commons.license and theme.creative_commons.post %}
        {{ partial('_partials/post/post-copyright.swig') }}
      {%- endif %}

      <footer class="post-footer">
        {%- if post.tags and post.tags.length %}
          {%- if theme.tag_icon %}
            {%- set tag_indicate = '<i class="fa fa-tag"></i>' %}
          {% else %}
            {%- set tag_indicate = '#' %}
          {%- endif %}
          <div class="post-tags">
            {%- for tag in post.tags.toArray() %}
              <a href="{{ url_for(tag.path) }}" rel="tag">{{ tag_indicate }} {{ tag.name }}</a>
            {%- endfor %}
          </div>
        {%- endif %}

        {{ partial('_partials/post/post-footer.swig', {}, {cache: theme.cache.enable}) }}

        {%- if post.prev or post.next %}
          <div class="post-nav">
            <div class="post-nav-next post-nav-item">
              {%- if post.next %}
                <a href="{{ url_for(post.next.path) }}" rel="next" title="{{ post.next.title }}">
                  <i class="fa fa-chevron-left"></i> {{ post.next.title }}
                </a>
              {%- endif %}
            </div>

            <span class="post-nav-divider"></span>

            <div class="post-nav-prev post-nav-item">
              {%- if post.prev %}
                <a href="{{ url_for(post.prev.path) }}" rel="prev" title="{{ post.prev.title }}">
                  {{ post.prev.title }} <i class="fa fa-chevron-right"></i>
                </a>
              {%- endif %}
            </div>
          </div>
        {%- endif %}
      </footer>
    {% else %}
      <footer class="post-footer">
        <div class="post-eof"></div>
      </footer>
    {%- endif %}
  </article>
  {######################}
  {### END POST BLOCK ###}
  {######################}
