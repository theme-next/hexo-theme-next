/* global NexT, CONFIG, Velocity */

if (window.$ && window.$.Velocity) window.Velocity = window.$.Velocity;

NexT.motion = {};

NexT.motion.integrator = {
  queue : [],
  cursor: -1,
  init  : function() {
    this.queue = [];
    this.cursor = -1;
    return this;
  },
  add: function(fn) {
    this.queue.push(fn);
    return this;
  },
  next: function() {
    this.cursor++;
    var fn = this.queue[this.cursor];
    typeof fn === 'function' && fn(NexT.motion.integrator);
  },
  bootstrap: function() {
    this.next();
  }
};

NexT.motion.middleWares = {
  logo: function(integrator) {
    var sequence = [];
    var brand = document.querySelector('.brand');
    var image = document.querySelector('.custom-logo-image');
    var title = document.querySelector('.site-title');
    var subtitle = document.querySelector('.site-subtitle');
    var logoLineTop = document.querySelector('.logo-line-before i');
    var logoLineBottom = document.querySelector('.logo-line-after i');

    brand && sequence.push({
      e: brand,
      p: {opacity: 1},
      o: {duration: 200}
    });

    function getMistLineSettings(element, translateX) {
      return {
        e: element,
        p: {translateX: translateX},
        o: {
          duration     : 500,
          sequenceQueue: false
        }
      };
    }

    function pushImageToSequence() {
      sequence.push({
        e: image,
        p: {opacity: 1, top: 0},
        o: {duration: 200}
      });
    }

    NexT.utils.isMist() && logoLineTop && logoLineBottom
    && sequence.push(
      getMistLineSettings(logoLineTop, '100%'),
      getMistLineSettings(logoLineBottom, '-100%')
    );

    NexT.utils.isMuse() && image && pushImageToSequence();

    title && sequence.push({
      e: title,
      p: {opacity: 1, top: 0},
      o: {duration: 200}
    });

    subtitle && sequence.push({
      e: subtitle,
      p: {opacity: 1, top: 0},
      o: {duration: 200}
    });

    (NexT.utils.isPisces() || NexT.utils.isGemini()) && image && pushImageToSequence();

    if (sequence.length > 0) {
      sequence[sequence.length - 1].o.complete = function() {
        integrator.next();
      };
      Velocity.RunSequence(sequence);
    } else {
      integrator.next();
    }

    if (CONFIG.motion.async) {
      integrator.next();
    }
  },

  menu: function(integrator) {

    Velocity(document.querySelectorAll('.menu-item'), 'transition.slideDownIn', {
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

    var postBlock = document.querySelectorAll('.post-block, .pagination, .comments');
    var postBlockTransition = CONFIG.motion.transition.post_block;
    var postHeader = document.querySelectorAll('.post-header');
    var postHeaderTransition = CONFIG.motion.transition.post_header;
    var postBody = document.querySelectorAll('.post-body');
    var postBodyTransition = CONFIG.motion.transition.post_body;
    var collHeader = document.querySelectorAll('.collection-header');
    var collHeaderTransition = CONFIG.motion.transition.coll_header;
    var hasPost = postBlock.length > 0;

    if (hasPost) {
      var postMotionOptions = window.postMotionOptions || {
        stagger : 100,
        drag    : true,
        complete: function() {
          integrator.next();
        }
      };

      if (CONFIG.motion.transition.post_block) {
        Velocity(postBlock, 'transition.' + postBlockTransition, postMotionOptions);
      }
      if (CONFIG.motion.transition.post_header) {
        Velocity(postHeader, 'transition.' + postHeaderTransition, postMotionOptions);
      }
      if (CONFIG.motion.transition.post_body) {
        Velocity(postBody, 'transition.' + postBodyTransition, postMotionOptions);
      }
      if (CONFIG.motion.transition.coll_header) {
        Velocity(collHeader, 'transition.' + collHeaderTransition, postMotionOptions);
      }
    }
    if (NexT.utils.isPisces() || NexT.utils.isGemini()) {
      integrator.next();
    }
  },

  sidebar: function(integrator) {
    NexT.utils.updateSidebarPosition();
    var sidebarAffix = document.querySelector('.sidebar-inner');
    var sidebarAffixTransition = CONFIG.motion.transition.sidebar;
    // Only for Pisces | Gemini.
    if (CONFIG.motion.transition.sidebar && (NexT.utils.isPisces() || NexT.utils.isGemini())) {
      Velocity(sidebarAffix, 'transition.' + sidebarAffixTransition, {
        display : null,
        duration: 200,
        complete: function() {
          // After motion complete need to remove transform from sidebar to let affix work on Pisces | Gemini.
          sidebarAffix.style.transform = 'initial';
        }
      });
    }
    integrator.next();
  }
};
