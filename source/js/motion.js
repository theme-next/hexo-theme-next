/* global NexT, CONFIG */

NexT.motion = {};

NexT.motion.integrator = {
  queue : [],
  cursor: -1,
  init  : function() {
    this.queue = [];
    this.cursor = -1;
    return this;
  },
  add   : function(fn) {
    this.queue.push(fn);
    return this;
  },
  next: function() {
    this.cursor++;
    var fn = this.queue[this.cursor];
    $.isFunction(fn) && fn(NexT.motion.integrator);
  },
  bootstrap: function() {
    this.next();
  }
};

NexT.motion.middleWares = {
  logo: function(integrator) {
    var sequence = [];
    var $brand = $('.brand');
    var $image = $('.custom-logo-image');
    var $title = $('.site-title');
    var $subtitle = $('.site-subtitle');
    var $logoLineTop = $('.logo-line-before i');
    var $logoLineBottom = $('.logo-line-after i');

    $brand.length > 0 && sequence.push({
      e: $brand,
      p: {opacity: 1},
      o: {duration: 200}
    });

    /**
     * Check if $elements exist.
     * @param {jQuery|Array} $elements
     * @returns {boolean}
     */
    function hasElement($elements) {
      $elements = Array.isArray($elements) ? $elements : [$elements];
      return $elements.every(function($element) {
        return $element.length > 0;
      });
    }

    function getMistLineSettings(element, translateX) {
      return {
        e: $(element),
        p: {translateX: translateX},
        o: {
          duration     : 500,
          sequenceQueue: false
        }
      };
    }

    function pushImageToSequence() {
      sequence.push({
        e: $image,
        p: {opacity: 1, top: 0},
        o: {duration: 200}
      });
    }

    NexT.utils.isMist() && hasElement([$logoLineTop, $logoLineBottom])
    && sequence.push(
      getMistLineSettings($logoLineTop, '100%'),
      getMistLineSettings($logoLineBottom, '-100%')
    );

    NexT.utils.isMuse() && hasElement($image) && pushImageToSequence();

    hasElement($title) && sequence.push({
      e: $title,
      p: {opacity: 1, top: 0},
      o: {duration: 200}
    });

    hasElement($subtitle) && sequence.push({
      e: $subtitle,
      p: {opacity: 1, top: 0},
      o: {duration: 200}
    });

    (NexT.utils.isPisces() || NexT.utils.isGemini()) && hasElement($image) && pushImageToSequence();

    if (sequence.length > 0) {
      sequence[sequence.length - 1].o.complete = function() {
        integrator.next();
      };
      /* eslint-disable */
      $.Velocity.RunSequence(sequence);
      /* eslint-enable */
    } else {
      integrator.next();
    }

    if (CONFIG.motion.async) {
      integrator.next();
    }
  },

  menu: function(integrator) {

    $('.menu-item').velocity('transition.slideDownIn', {
      display : null,
      duration: 200,
      complete: function() {
        integrator.next();
      }
    });

    if (CONFIG.motion.async) {
      integrator.next();
    }
  },

  postList: function(integrator) {

    var $postBlock = $('.post-block, .pagination, .comments');
    var $postBlockTransition = CONFIG.motion.transition.post_block;
    var $postHeader = $('.post-header');
    var $postHeaderTransition = CONFIG.motion.transition.post_header;
    var $postBody = $('.post-body');
    var $postBodyTransition = CONFIG.motion.transition.post_body;
    var $collHeader = $('.collection-title, .archive-year');
    var $collHeaderTransition = CONFIG.motion.transition.coll_header;
    var hasPost = $postBlock.length > 0;

    if (hasPost) {
      var postMotionOptions = window.postMotionOptions || {
        stagger : 100,
        drag    : true,
        complete: function() {
          integrator.next();
        }
      };

      if (CONFIG.motion.transition.post_block) {
        $postBlock.velocity('transition.' + $postBlockTransition, postMotionOptions);
      }
      if (CONFIG.motion.transition.post_header) {
        $postHeader.velocity('transition.' + $postHeaderTransition, postMotionOptions);
      }
      if (CONFIG.motion.transition.post_body) {
        $postBody.velocity('transition.' + $postBodyTransition, postMotionOptions);
      }
      if (CONFIG.motion.transition.coll_header) {
        $collHeader.velocity('transition.' + $collHeaderTransition, postMotionOptions);
      }
    }
    if (NexT.utils.isPisces() || NexT.utils.isGemini()) {
      integrator.next();
    }
  },

  sidebar: function(integrator) {
    NexT.utils.updateSidebarPosition();
    var $sidebarAffix = $('.sidebar-inner');
    var $sidebarAffixTransition = CONFIG.motion.transition.sidebar;
    // Only for Pisces | Gemini.
    if (CONFIG.motion.transition.sidebar && (NexT.utils.isPisces() || NexT.utils.isGemini())) {
      $sidebarAffix.velocity('transition.' + $sidebarAffixTransition, {
        display : null,
        duration: 200,
        complete: function() {
          // After motion complete need to remove transform from sidebar to let affix work on Pisces | Gemini.
          $sidebarAffix.css({ 'transform': 'initial' });
        }
      });
    }
    integrator.next();
  }
};
