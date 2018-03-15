// 对 Next 主题进行定制

//MathJax
/* window.MathJax = {
    AuthorInit: function () {
      MathJax.Hub.Register.StartupHook("Begin",function () {
        MathJax.Hub.Queue(function() {
      var all = MathJax.Hub.getAllJax(), i;
      for (i=0; i < all.length; i += 1) {
        all[i].SourceElement().parentNode.className += ' has-jax';
      }
    });
      });
    }
  };
window.MathJax = {
    tex2jax: {
      inlineMath: [ ['$','$'], ["\\(","\\)"] ],
      processEscapes: true,
      skipTags: ['script', 'noscript', 'style', 'textarea', 'pre', 'code']
    }
  };
//  <script type="text/javascript" src="//cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML"></script>
// jQuery
$.getScript('https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.1/MathJax.js?config=TeX-AMS-MML_HTMLorMML', function()
{
    // script is now loaded and executed.
    // put your dependent JS here.
}); */


// 特定段落(标志 ooNoIndent00)不缩进
$('p:contains("ooNoIndent00")').each(function() {
	var str = $(this).text();
	if (str.match("^ooNoIndent00")) {
		var text = $(this).html();
		$(this).css('text-indent', '0em');
		$(this).html(text.replace('ooNoIndent00', '')); 
	}
});

// 函数: html 中去掉 某 tag 最后那一次出现
var rmLastElm = function(text, selector) {
    var wrapped = $("<div>" + text + "</div>");
    wrapped.find(selector).last().remove();
    return wrapped.html();
}
// 弹出 tip 显示 脚注
var $fRef = $(".footnoteRef");
for(let i=0; i<$fRef.length; i++) {
	var sup = $fRef.children("sup")[i];		//work reliably as long as there's exactly one sup per footnotRef
//	var sup = $fRef[i].children("sup");		//a classic Dom Element, so it doesn't have any children method
	sup.onmouseover = function(event) {
		$('.footnoteTip').remove();
		var pTip = document.createElement('div');
		pTip.className = 'footnoteTip';		// CSS
		pTip.innerHTML = rmLastElm(document.getElementById($fRef[i].getAttribute("href").substring(1)).innerHTML,"a");
		document.body.appendChild(pTip);

		var posLeft = event.pageX - 180;
		if (posLeft<0) posLeft = 20;
		var posTop = event.pageY + 20;
		var od = $('.footnoteTip');
		var oH = od.outerHeight();
		var oW = od.outerWidth();
		if(posTop + oH - window.pageYOffset > $(window).height()) 	posTop = posTop - oH -40;
		if (posLeft + oW > $(window).width()) posLeft = $(window).width() - oW -20;	//NexT.Mist pageXOffset=0
		pTip.style.left = posLeft + 'px';
		pTip.style.top = posTop + 'px';

	};

	sup.onmouseout = function(event) {
		$('.footnoteTip').remove();
	};
}



