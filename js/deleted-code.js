// From HTML file, header

// Hides fallback nav so that it only appears if Javascript disabled
// Not really needed because the Javascript for including HTML snippets (see end of file) actually replaces the fallback nav when Javascript is enabled
// function addStyle(styles){var css=document.createElement('style');if(css.styleSheet){css.styleSheet.cssText=styles}else{css.appendChild(document.createTextNode(styles))}document.getElementsByTagName("head")[0].appendChild(css)}var styles='.fallbacks{display:none !important;visibility:hidden !important}';window.onload=function(){addStyle(styles)};


// Reloads given page, keeps base URL, path, and any #, but removes random query string
// Taken from https://stackoverflow.com/a/28840664 and https://stackoverflow.com/a/48542058
// (function(){if(window.localStorage){if(!localStorage.getItem('firstLoad')){localStorage['firstLoad']=true;window.location.href=window.location.origin+window.location.pathname+window.location.hash;}else{localStorage.removeItem('firstLoad')}}})();


// From HTML file, footer

// Adds CSS file and adds random string to end of CSS file.
// Adapted from https://stackoverflow.com/a/22634359 and https://stackoverflow.com/a/39179486
// var randomString=Math.floor(Math.random()*1000000);var css=document.createElement("link");css.rel="stylesheet";css.type="text/css";css.href="/css/style.css?="+randomString;document.head.appendChild(css);

// Loads JS file only after rest of page has loaded; adds random string to end of file.
// Adapted from https://learn.jquery.com/using-jquery-core/document-ready/ and https://stackoverflow.com/a/39179486
// $(window).on("load",function(){var randomString=Math.floor(Math.random()*1000000);var element=document.createElement("script");element.src="/js/scripts.js?="+randomString;document.body.appendChild(element)});


// From JS file

// Service Worker
// Taken from https://pwa-workshop.js.org/2-service-worker/#registering-the-service-worker

// if ("serviceWorker" in navigator) {
//   navigator.serviceWorker
//     .register("/sw.js?=newVers_0002")
//     .then(serviceWorker => {
//       serviceWorker.update();
//       console.log("Service Worker registered: ", serviceWorker);
//     })
//     .catch(error => {
//       console.error("Error registering the Service Worker: ", error);
//     });
// }


// // Keyboard Navigation for Dropdown Menus
// // Adapted by Philip Allfrey for One More Voice from https://www.w3.org/TR/wai-aria-practices/examples/menubar/menubar-1/js/MenubarItemLinks.js

// const menu = document.getElementById('nav4');
// menu.addEventListener('keydown', handleKeydown);
// menu.addEventListener('focusin', handleFocusIn);

// const lastMenuItem = Array.from(menu.querySelectorAll('[role="menuitem"]')).pop();
// const topLevelItems = Array.from(menu.querySelectorAll('[aria-haspopup]'));

// function handleFocusIn(event){
// 	if(event.target.attributes['aria-haspopup']){
// 		// Find all popup toggles
// 		Array.from(
// 			menu.querySelectorAll('[aria-haspopup]')
// 		)
// 		// Exclude the toggle that has just been focussed
// 		.filter(x => x !== event.target)
// 		// Set all other toggles to false to hide their dropdowns
// 		.forEach(x => {
// 			x.checked = false;
// 		})

// 	}
// };

// function handleKeydown(event){
// 	const keyCode = Object.freeze({
// 		'TAB': 9,
// 		'RETURN': 13,
// 		'ESC': 27,
// 		'SPACE': 32,
// 		'PAGEUP': 33,
// 		'PAGEDOWN': 34,
// 		'END': 35,
// 		'HOME': 36,
// 		'LEFT': 37,
// 		'UP': 38,
// 		'RIGHT': 39,
// 		'DOWN': 40
// 	});

// 	const target = event.target;
// 	const char = event.keyCode;

// 	let currentItem = null;

// 	switch(char){

// 		case keyCode.DOWN:
// 			// Stop the browser moving the page
// 			event.preventDefault();

// 			// If we're on a top-level element
// 			if(target.attributes['aria-haspopup'] && target.attributes['aria-haspopup'].value === "true"){
// 				// If the popup has just been opened, move focus to first menu element
// 				if(target.checked){
// 					const firstMenuElement = target.parentElement.querySelector('[role="menuitem"]');
// 					firstMenuElement.focus();
// 				}
// 				// If popup is not opened, open it
// 				else{
// 					target.checked = true;
// 				}
// 			}
// 			// Otherwise move focus down one element
// 			 else if(target.attributes['role'] && target.attributes['role'].value === "menuitem"){
// 				const menuItems = Array.from(
// 					target.closest('ul').querySelectorAll('[role="menuitem"]')
// 				);

// 				// Wrap around to the top if we reach the bottom of the dropdown
// 				const nextMenuItem = getNextElement(menuItems, target);
// 				nextMenuItem.focus();
// 			}
// 			break;

// 			case keyCode.UP:
// 				// Stop the browser from moving the page
// 				event.preventDefault();

// 				// If we're on an open top-level element
// 				if(target.attributes['aria-haspopup'] && target.attributes['aria-haspopup'].value === "true" && target.checked){
// 					target.checked = false;
// 				}
// 				// If we're in a dropdown
// 				else if(target.attributes['role'] && target.attributes['role'].value === "menuitem"){
// 					// Get list of elements in the dropdown
// 					const menuItems = Array.from(
// 						target.closest('ul').querySelectorAll('[role="menuitem"]')
// 					);

// 					// Check whether we're already at the top
// 					const prevMenuItem = getPreviousElement(menuItems, target);
// 					// Close the dropdown
// 					if(prevMenuItem === target){
// 						const topLevelItem = target.closest('.dropdown').querySelector('input');
// 						topLevelItem.checked = false;
// 						topLevelItem.focus();
// 					}
// 					// Move the focus up one element
// 					else {
// 						prevMenuItem.focus();
// 					}

// 				}
// 				break;

// 			case keyCode.LEFT:
// 				// Stop the browser moving the page
// 				event.preventDefault();

// 				// If we're on a top-level menu elements
// 				if(target.attributes['aria-haspopup']){
// 					currentItem = target;
// 				}
// 				// If we're inside a dropdown
// 				 else if(target.attributes['role'] && target.attributes['role'].value === "menuitem"){
// 					currentItem = target.closest('.dropdown').querySelector('input');
// 				}
// 				// If neither applies, stop
// 				else{
// 					break;
// 				}


// 				const prevTopLevelItem = getPreviousElement(topLevelItems, currentItem);
// 				// Move focus to previous top-level item and open it if dropdown is open
// 				if(prevTopLevelItem.attributes['aria-haspopup'] && prevTopLevelItem.attributes['aria-haspopup'].value === "true"){
// 					prevTopLevelItem.checked = currentItem.checked;
// 				} else{
// 					prevTopLevelItem.checked = false;
// 				}

// 				prevTopLevelItem.focus();
// 				break;

// 			case keyCode.RIGHT:
// 				// Stop the browser moving the page
// 				event.preventDefault();

// 				// If we're on a top-level menu element
// 				if(target.attributes['aria-haspopup']){
// 					currentItem = target;
// 				}
// 				// If we're inside a dropdown
// 				else if(target.attributes['role'] && target.attributes['role'].value === "menuitem"){
// 					currentItem = target.closest('.dropdown').querySelector('input');
// 				}
// 				else{
// 					break;
// 				}

// 				const nextTopLevelItem = getNextElement(topLevelItems, currentItem);
// 				// Move focus to previous top-level item and open it if dropdown is open
// 				if(nextTopLevelItem.attributes['aria-haspopup'] && nextTopLevelItem.attributes['aria-haspopup'].value === "true"){
// 					nextTopLevelItem.checked = currentItem.checked;
// 				} else{
// 					nextTopLevelItem.checked = false;
// 				}
// 				nextTopLevelItem.focus();
// 				break;

// 			case keyCode.RETURN:
// 				// Open or close dropdown
// 				// Space also does this by default
// 				if(target.attributes['aria-haspopup'] && target.attributes['aria-haspopup'].value === "true"){
// 					target.checked = !target.checked;
// 				}
// 				break;

// 			case keyCode.TAB:
// 				if(event.target === lastMenuItem){
// 					// Close dropdown
// 					const lastDropdown = Array.from(
// 						menu.querySelectorAll('[aria-haspopup]')
// 					).pop();
// 					lastDropdown.checked = false;
// 				}
// 				break;

// 			case keyCode.ESC:
// 				let parentPopup;
// 				// If we're on a top-level menu element
// 				if(target.attributes['aria-haspopup']){
// 					parentPopup = target;
// 				}
// 				// If we're inside a dropdown
// 				else if(target.attributes['role'] && target.attributes['role'].value === "menuitem"){
// 					parentPopup = target.closest('.dropdown').querySelector('input');
// 				}
// 				parentPopup.checked = false;
// 				parentPopup.focus();
// 				break;
// 	}

// };

// function getNextElement(items, currentItem){
// 	const currentIndex = items.findIndex(x => x == currentItem);
// 	return items[Math.min(currentIndex + 1, items.length - 1)];
// };

// function getPreviousElement(items, currentItem){
// 	const currentIndex = items.findIndex(x => x == currentItem);
// 	return items[Math.max(currentIndex - 1, 0)];
// };


// Highlights users current section in navigation
// Adapted from https://stackoverflow.com/a/21718316

// checkUrl();
			
// function checkUrl () {
// 	if(location.pathname == "/" && 
// 		location.hash.length <= 1 && 
// 		location.search.length <= 1) {
// 			document.getElementById("home-tab").setAttribute("class","current");
// 	}
// 	if (window.location.href.indexOf("index") > -1) {	
// 			document.getElementById("home-tab").setAttribute("class","current");
// 	};
// 	if (window.location.href.indexOf("texts") > -1 ||
// 		window.location.href.indexOf("visual") > -1 ||
// 		window.location.href.indexOf("books") > -1 ||
// 		window.location.href.indexOf("motion") > -1 ||
// 		window.location.href.indexOf("essays") > -1 ||
// 		window.location.href.indexOf("_TEI") > -1 ||
// 		window.location.href.indexOf("_ART") > -1) {	
// 			document.getElementById("materials-tab").setAttribute("class","current");
// 	};
// 	if (window.location.href.indexOf("analytical") > -1 ||
// 		window.location.href.indexOf("design") > -1 ||
// 		window.location.href.indexOf("collaboration") > -1 ||
// 		window.location.href.indexOf("guidelines") > -1) {	
// 			document.getElementById("about-tab").setAttribute("class","current");
// 	};
// 	if (window.location.href.indexOf("contributors") > -1 ||
// 		window.location.href.indexOf("acknowledgments") > -1 ||
// 		window.location.href.indexOf("bibliography") > -1 ||
// 		window.location.href.indexOf("site_map") > -1) {	
// 			document.getElementById("misc-tab").setAttribute("class","current");
// 	};
// };	


//Scroll to top button
//Adapted from https://www.w3schools.com/howto/howto_js_scroll_to_top.asp

//Get the button
// var mybutton = document.getElementById("topButton");

// When the user scrolls down 20px from the top of the document, show the button
// window.onscroll = function() {scrollFunction()};

// function scrollFunction() {
//   if (document.body.scrollTop > 600 || document.documentElement.scrollTop > 600) {
//     mybutton.style.display = "block";
//     mybutton.style.visibility = "visible";
//   } 
//   else {
//     mybutton.style.display = "none";
//     mybutton.style.visibility = "hidden";
//   }
// };
			
// When the user clicks on the button, scroll to the top of the document
// function topFunction() {
// document.body.scrollTop = 0;
// document.documentElement.scrollTop = 0;
// };


// Adds Google translate
// Disabled because fails due to CORS issue
// For script injection, see https://stackoverflow.com/questions/950087/how-do-i-include-a-javascript-file-in-another-javascript-file
// function googleTranslateElementInit() {
// 	new google
// 			.translate
// 			.TranslateElement({
// 					pageLanguage: 'en'
// 			}, 'google_translate_element')
// }

// var translate = document.createElement('script');
// translate.src = "//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"
// translate.crossOrigin = "anonymous";
// document.body.appendChild(translate);


// Reloads given page, keeps base URL, path, and any #, but removes random query string
// Taken from https://stackoverflow.com/a/28840664 and https://stackoverflow.com/a/48542058

// (function () {
//     if (window.localStorage) {
//         if (!localStorage.getItem('firstLoad')) {
//             localStorage['firstLoad'] = true;
//             window.location.href = window.location.origin + window.location.pathname + window.location.hash;
//             // window.location.reload();
//         } else 
//             localStorage.removeItem('firstLoad');
//         }
// })();


//  Commented out b/c breaks external LO links

// Thanks();

//function Thanks(){
//		var links = document.querySelectorAll("a[href^='http']:not([href^='#']):not([href^='mailto']):not([onclick])");
//		for(var i = 0; i < links.length; i++){
//			links[i].href = links[i].href + "?=Thanks_for_visiting_One_More_Voice";
//		}
//}