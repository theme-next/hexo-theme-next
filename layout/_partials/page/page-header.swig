<header class="post-header">

<h1 class="post-title" itemprop="name headline">
  {{- page.title }}
  {{- post_edit(page.source) }}
</h1>

<div class="post-meta">
  {%- set date_diff = date(page.date) != date(page.updated) %}
  {%- set time_diff = time(page.date) != time(page.updated) %}
  {%- set datetime_diff = date_diff or time_diff %}
  {%- if theme.page_meta.created_at %}
    <span class="post-meta-item">
      <span class="post-meta-item-icon">
        <i class="far fa-calendar"></i>
      </span>
      <span class="post-meta-item-text">{{ __('post.posted') }}</span>
      {%- if not date_diff and time_diff and theme.page_meta.updated_at.enable and theme.page_meta.updated_at.another_day %}
        {%- set create_title = __('post.created') + __('symbol.colon') + full_date(page.date) + ' / ' + __('post.modified') + __('symbol.colon') + time(page.updated) %}
      {% else %}
        {%- set create_title = __('post.created') + __('symbol.colon') + full_date(page.date) %}
      {%- endif %}
      <time title="{{ create_title }}" itemprop="dateCreated datePublished" datetime="{{ moment(page.date).format() }}">{{ date(page.date) }}</time>
    </span>
  {%- endif %}
  {%- if theme.page_meta.updated_at.enable and datetime_diff %}
    {%- set display_updated = not theme.page_meta.updated_at.another_day or theme.page_meta.updated_at.another_day and date_diff %}
    {%- if display_updated or not theme.page_meta.created_at %}
      <span class="post-meta-item">
        <span class="post-meta-item-icon">
          <i class="far fa-calendar-check"></i>
        </span>
        <span class="post-meta-item-text">{{ __('post.edited') }}</span>
        <time title="{{ __('post.modified') + __('symbol.colon') + full_date(page.updated) }}" itemprop="dateModified" datetime="{{ moment(page.updated).format() }}">{{ date(page.updated) }}</time>
      </span>
    {%- endif %}
  {%- endif %}
  {%- if page.description %}
    <div class="post-description">{{ page.description }}</div>
  {%- endif %}
  {% include '_partials/page/breadcrumb.swig' %}
</div>

</header>
