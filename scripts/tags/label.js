/* global hexo *///console.log()
// Class: default, primary, success, info, warning, danger
// Usage: {% label class,Content %} 
// Alias: {% lb class,Content %}

function Trim(str) {
	return str.replace(/(^\s*)|(\s*$)/g, "");
}

function getClass(type) {
	var perPart = 'info';

	if (type == 'info') {
	perPart = 'info';
	} else
	if (type == 'primary') {
	perPart = 'primary';
	} else
	if (type == 'success') {
	perPart = 'success';
	} else
	if (type == 'warning') {
	perPart = 'warning';
	} else
	if (type == 'danger') {
	perPart = 'danger';
	} else
	if (type == '1') {
	perPart = 'info';
	} else
	if (type == '1') {
	perPart = 'primary';
	} else
	if (type == '2') {
	perPart = 'success';
	} else
	if (type == '3') {
	perPart = 'warning';
	} else
	if (type == '4') {
	perPart = 'danger';
	};

	perPart = '<span class="label label-' + perPart + '">';

	return perPart;
}

function label(args) {	
	args = args.join(' ').split(',');
	var type = args[0];
	var perPart = getClass(Trim(type));
	var endPart = '</span>';
	
	var content = args[1];
	for (var i=2;i<args.length;i++)
	{
	   content = content + ',' + args[i];
	}	

	return perPart + content + endPart;
}

hexo.extend.tag.register('label', label);
hexo.extend.tag.register('lb', label);
