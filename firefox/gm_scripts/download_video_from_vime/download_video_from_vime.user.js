// ==UserScript==
// @name           Download video from vimeo.com
// @namespace      userscripts.org
// @description    Adds a download link to the flv video underneath videos on vimeo.com & underneath any embeded vimeo videos.
// @include        *
// ==/UserScript==

(function(){

	function makeLink(linkSrc, emPar){
	
		var cNum = linkSrc.split('clip_id=')[1].split('&')[0];
	
		GM_xmlhttpRequest({
				method: 'GET',
				url: 'http://www.vimeo.com/moogaloop/load/clip:'+cNum+'/local?ver=4',
				headers: {
					'User-agent': 'Mozilla/4.0 (compatible)',
				},
				onload: function(responseDetails) {
					
					var data = responseDetails.responseText;

					var parser=new DOMParser();
					var xmlDoc=parser.parseFromString(data,"text/xml");
					var flvURL = xmlDoc.getElementsByTagName('file')[0].textContent;

					
					var newP = document.createElement('p');
					var newB = document.createElement('b');
					newB.innerHTML = 'Download :  ';
					var newA = document.createElement('a');
					newA.innerHTML = flvURL;
					newA.href = flvURL;
					newP.appendChild(newB);
					newP.appendChild(newA);
					
			        if(emPar.parentNode.nodeName == 'OBJECT'){

			            emPar = emPar.parentNode;

			        }
					var emSib = emPar.nextSibling;
					if(emSib){
					
						emPar.parentNode.insertBefore(newP, emSib);
						
					}
					else{
					
						emPar.parentNode.appendChild(newP);
					
					}				

				}
				
		});
		

	}

	var getEmbeds = document.getElementsByTagName('embed');

	for(var i=0;i<getEmbeds.length;i++){

		var emPar = getEmbeds[i];
		var eS = emPar.src;

	    if(eS.indexOf('http://www.vimeo.com/moogaloop.swf')>-1){

			makeLink(eS, emPar);

	    }
		else if(eS.indexOf('http://www.vimeo.com/moogaloop_local.swf')>-1){

			makeLink(emPar.getAttribute('flashvars'), emPar);
		
		}

	}	
	
})();