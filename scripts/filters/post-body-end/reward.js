/* global hexo */

'use strict';

const priority = hexo.config.inject_priority_reward || 120;

hexo.extend.filter.register('theme_inject', function(injects) {
  injects.postBodyEnd.raw('reward', `
    {% if page.reward === undefined and theme.reward_settings.enable %}
      {% set reward_able = true %}
    {% else %}
      {% set reward_able = page.reward %}
    {% endif %}
    {% if reward_able %}
      <div>
        {{ partial('_partials/post/reward.swig', {}, {cache: true}) }}
      </div>
    {% endif %}
  `);
}, priority);
