// ==UserScript==
// @name           Scrub Google Redirect Links
// @namespace      http://www.zooomr.com/photos/ping/
// @description    Removes the Google redirect in search result links.
// @include        http://www.google.com/search?*
// ==/UserScript==
(function() {

	var redirectLinks = document.evaluate(
		"//a[@class='l']"
		, document
		, null
		, XPathResult.UNORDERED_NODE_SNAPSHOT_TYPE
		, null);
		
	
	if (typeof redirectLinks != 'undefined' && redirectLinks.snapshotLength > 0) {
		for (var i = 0; i < redirectLinks.snapshotLength; i++) {
			redirectLinks.snapshotItem(i).setAttribute('onmousedown','');
		} 
	}
	
})()