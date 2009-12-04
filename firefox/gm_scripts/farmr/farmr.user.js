// ==UserScript==
// @name          Farmr
// @version	  0.5
// @description   Farm server proxy
// @namespace     http://selif.yhsif.com
// @identifier    http://selif.yhsif.com/farmr.user.js
// @include       *

// Revisions:
// ==========
//
// 0.6	2008-7-6
//	 * just remove farm1/farm2 to use static.flickr.com
//
// 0.5	2007-6-14
//	 * use fsurf
//
// 0.4	2007-6-13
//	 * use httpsurf
//
// 0.3	2007-6-11
//	 * handle all "static.flickr.com" sources
//
// 0.2	2007-6-10
//	 * use proxyhub web proxy instead of ip replacer
//
// 0.1	2007-6-8
//	 * initial version

// ==/UserScript==

(function() {
	var allImgs, thisImg, src;
	allImgs = document.getElementsByTagName('img');
	for (var i = 0; i < allImgs.length; i++) {
		thisImg = allImgs[i];
		src = thisImg.src;
		if(/static\.flickr\.com/.test(src)) {
			src = src.replace(/farm2.static.flickr.com/, 'static.flickr.com');
			src = src.replace(/farm1.static.flickr.com/, 'static.flickr.com');
			thisImg.setAttribute('src', src);
		}
	}
})();

