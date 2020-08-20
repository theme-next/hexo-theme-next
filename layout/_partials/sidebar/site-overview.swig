<div class="site-author motion-element" itemprop="author" itemscope itemtype="http://schema.org/Person">
  {%- if theme.avatar.url %}
    <img class="site-author-image" itemprop="image" alt="{{ author }}"
      src="{{ url_for(theme.avatar.url) }}">
  {%- endif %}
  <p class="site-author-name" itemprop="name">{{ author }}</p>
  <div class="site-description" itemprop="description">{{ description }}</div>
</div>

{%- if theme.site_state %}
  {%- if theme.menu.archives %}    
	{%- set archivesURL = theme.menu.archives.split('||')[0] | trim %}
  {% else %}
	{%- set archivesURL = config.archive_dir %}
  {%- endif %}
  {%- if theme.menu.categories %}    
	{%- set categoriesURL = theme.menu.categories.split('||')[0] | trim %}
  {% else %}
	{%- set categoriesURL = config.category_dir %}
  {%- endif %}
  {%- if theme.menu.tags %}    
	{%- set tagsURL = theme.menu.tags.split('||')[0] | trim %}
  {% else %}
	{%- set tagsURL = config.tag_dir %}
  {%- endif %}
  
  {%- set i18nType = theme.i18n.type %}
  {%- set i18nMode = theme.i18n.mode %}
  {%- if i18nType and i18nType.length > 1 %}
    {%- if i18nType[0].length < 1 %}
      {%- set i18nType = [i18nType] %}
    {%- endif %}
  {%- endif %}
  {%- if languages and languages.length > 1 %}
    {%- if languages[0].length < 1 %}
      {%- set languages = [languages] %}
    {%- endif %}
    {%- set languageStr = '/' + languages[0] + '/' %}
  {% else %}
    {%- set languageStr = '' %}
  {%- endif %}

  {%- if i18nType and i18nType.length > 1 %}
    {%- for i in i18nType %}
	  {%- if i18nMode == 1 %}
        {%- if archivesURL | lower == i | lower %}
		  {%- set archivesURL = languageStr + archivesURL + '/'  %}
	    {%- endif %}
		{%- if categoriesURL | lower == i | lower %}
		  {%- set categoriesURL = languageStr + categoriesURL + '/'  %}
	    {%- endif %}
		{%- if tagsURL | lower == i | lower %}
		  {%- set tagsURL = languageStr + tagsURL + '/'  %}
	    {%- endif %}
	  {%- endif %}
    {%- endfor %}
  {%- endif %}

<div class="site-state-wrap motion-element">
  <nav class="site-state">
    {%- if config.archive_dir != '/' and site.posts.length > 0 %}
      <div class="site-state-item site-state-posts">
          <a href="{{ url_for(archivesURL) }}">
          <span class="site-state-item-count">{{ site.posts.length }}</span>
          <span class="site-state-item-name">{{ __('state.posts') }}</span>
        </a>
      </div>
    {%- endif %}

    {%- if site.categories.length > 0 %}
      {%- set categoriesPageQuery = site.pages.find({type: 'categories'}, {lean: true}) %}
      {%- set hasCategoriesPage = categoriesPageQuery.length > 0 %}
      <div class="site-state-item site-state-categories">
        {%- if hasCategoriesPage %}
          <a href="{{ url_for(categoriesURL) }}">
        {%- endif %}
        <span class="site-state-item-count">{{ site.categories.length }}</span>
        <span class="site-state-item-name">{{ __('state.categories') }}</span>
        {%- if hasCategoriesPage %}</a>{%- endif %}
      </div>
    {%- endif %}

    {%- if site.tags.length > 0 %}
      {%- set tagsPageQuery = site.pages.find({type: 'tags'}, {lean: true}) %}
      {%- set hasTagsPage = tagsPageQuery.length > 0 %}
      <div class="site-state-item site-state-tags">
        {%- if hasTagsPage %}
          <a href="{{ url_for(tagsURL) }}">
        {%- endif %}
        <span class="site-state-item-count">{{ site.tags.length }}</span>
        <span class="site-state-item-name">{{ __('state.tags') }}</span>
        {%- if hasTagsPage %}</a>{%- endif %}
      </div>
    {%- endif %}
  </nav>
</div>
{%- endif %}

{%- if theme.chat.enable and theme.chat.service !== '' %}
  <div class="sidebar-button motion-element">
  {%- if theme.chat.service == 'chatra' and theme.chatra.enable %}
    <a onclick="Chatra('openChat', true);">
  {%- endif %}
  {%- if theme.chat.service == 'tidio' and theme.tidio.enable %}
    <a onclick="tidioChatApi.open();">
  {%- endif %}
  {%- if theme.chat.icon %}<i class="{{ theme.chat.icon }}"></i>{%- endif %}
    {{ theme.chat.text }}
  </a>
  </div>
{%- endif %}

{%- if theme.social %}
  <div class="links-of-author motion-element">
    {%- for name, link in theme.social %}
      <span class="links-of-author-item">
      {%- set sidebarURL = link.split('||')[0] | trim %}
      {%- if theme.social_icons.enable %}
        {%- set sidebarIcon = '<i class="' + link.split('||')[1] | trim + ' fa-fw"></i>' %}
      {%- else %}
        {%- set sidebarIcon = '' %}
      {%- endif %}
      {%- if theme.social_icons.enable and theme.social_icons.icons_only %}
        {%- set sidebarText = '' %}
      {%- else %}
        {%- set sidebarText = name %}
      {%- endif %}
        {{ next_url(sidebarURL, sidebarIcon + sidebarText, {title: name + ' → ' + sidebarURL}) }}
      </span>
    {%- endfor %}
  </div>
{%- endif %}

{%- if theme.creative_commons.license and theme.creative_commons.sidebar %}
  <div class="cc-license motion-element" itemprop="license">
  {%- set ccImage = '<img src="' + url_for(theme.images + '/cc-' + theme.creative_commons.license + '.svg') + '" alt="Creative Commons">' %}
    {{ next_url(ccURL, ccImage, {class: 'cc-opacity'}) }}
  </div>
{%- endif %}

{# Blogroll #}
{%- if theme.links %}
  <div class="links-of-blogroll motion-element">
    <div class="links-of-blogroll-title">
      {%- if theme.links_settings.icon %}<i class="{{ theme.links_settings.icon }} fa-fw"></i>{%- endif %}
      {{ theme.links_settings.title }}
    </div>
    <ul class="links-of-blogroll-list">
      {%- for blogrollText, blogrollURL in theme.links %}
        <li class="links-of-blogroll-item">
          {{ next_url(blogrollURL, blogrollText, {title: blogrollURL}) }}
        </li>
      {%- endfor %}
    </ul>
  </div>
{%- endif %}
