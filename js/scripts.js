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


// Unregisters all service workers

if ("serviceWorker" in navigator) {
	navigator.serviceWorker.getRegistrations().then(function (registrations) {
				for (let registration of registrations) {
					registration.unregister()
				}
	})
};


// Keyboard Navigation for Dropdown Menus
// Adapted by Philip Allfrey for One More Voice from https://www.w3.org/TR/wai-aria-practices/examples/menubar/menubar-1/js/MenubarItemLinks.js

const menu = document.getElementById('nav4');
menu.addEventListener('keydown', handleKeydown);
menu.addEventListener('focusin', handleFocusIn);

const lastMenuItem = Array.from(menu.querySelectorAll('[role="menuitem"]')).pop();
const topLevelItems = Array.from(menu.querySelectorAll('[aria-haspopup]'));

function handleFocusIn(event){
	if(event.target.attributes['aria-haspopup']){
		// Find all popup toggles
		Array.from(
			menu.querySelectorAll('[aria-haspopup]')
		)
		// Exclude the toggle that has just been focussed
		.filter(x => x !== event.target)
		// Set all other toggles to false to hide their dropdowns
		.forEach(x => {
			x.checked = false;
		})

	}
};

function handleKeydown(event){
	const keyCode = Object.freeze({
		'TAB': 9,
		'RETURN': 13,
		'ESC': 27,
		'SPACE': 32,
		'PAGEUP': 33,
		'PAGEDOWN': 34,
		'END': 35,
		'HOME': 36,
		'LEFT': 37,
		'UP': 38,
		'RIGHT': 39,
		'DOWN': 40
	});

	const target = event.target;
	const char = event.keyCode;

	let currentItem = null;

	switch(char){

		case keyCode.DOWN:
			// Stop the browser moving the page
			event.preventDefault();

			// If we're on a top-level element
			if(target.attributes['aria-haspopup'] && target.attributes['aria-haspopup'].value === "true"){
				// If the popup has just been opened, move focus to first menu element
				if(target.checked){
					const firstMenuElement = target.parentElement.querySelector('[role="menuitem"]');
					firstMenuElement.focus();
				}
				// If popup is not opened, open it
				else{
					target.checked = true;
				}
			}
			// Otherwise move focus down one element
			 else if(target.attributes['role'] && target.attributes['role'].value === "menuitem"){
				const menuItems = Array.from(
					target.closest('ul').querySelectorAll('[role="menuitem"]')
				);

				// Wrap around to the top if we reach the bottom of the dropdown
				const nextMenuItem = getNextElement(menuItems, target);
				nextMenuItem.focus();
			}
			break;

			case keyCode.UP:
				// Stop the browser from moving the page
				event.preventDefault();

				// If we're on an open top-level element
				if(target.attributes['aria-haspopup'] && target.attributes['aria-haspopup'].value === "true" && target.checked){
					target.checked = false;
				}
				// If we're in a dropdown
				else if(target.attributes['role'] && target.attributes['role'].value === "menuitem"){
					// Get list of elements in the dropdown
					const menuItems = Array.from(
						target.closest('ul').querySelectorAll('[role="menuitem"]')
					);

					// Check whether we're already at the top
					const prevMenuItem = getPreviousElement(menuItems, target);
					// Close the dropdown
					if(prevMenuItem === target){
						const topLevelItem = target.closest('.dropdown').querySelector('input');
						topLevelItem.checked = false;
						topLevelItem.focus();
					}
					// Move the focus up one element
					else {
						prevMenuItem.focus();
					}

				}
				break;

			case keyCode.LEFT:
				// Stop the browser moving the page
				event.preventDefault();

				// If we're on a top-level menu elements
				if(target.attributes['aria-haspopup']){
					currentItem = target;
				}
				// If we're inside a dropdown
				 else if(target.attributes['role'] && target.attributes['role'].value === "menuitem"){
					currentItem = target.closest('.dropdown').querySelector('input');
				}
				// If neither applies, stop
				else{
					break;
				}


				const prevTopLevelItem = getPreviousElement(topLevelItems, currentItem);
				// Move focus to previous top-level item and open it if dropdown is open
				if(prevTopLevelItem.attributes['aria-haspopup'] && prevTopLevelItem.attributes['aria-haspopup'].value === "true"){
					prevTopLevelItem.checked = currentItem.checked;
				} else{
					prevTopLevelItem.checked = false;
				}

				prevTopLevelItem.focus();
				break;

			case keyCode.RIGHT:
				// Stop the browser moving the page
				event.preventDefault();

				// If we're on a top-level menu element
				if(target.attributes['aria-haspopup']){
					currentItem = target;
				}
				// If we're inside a dropdown
				else if(target.attributes['role'] && target.attributes['role'].value === "menuitem"){
					currentItem = target.closest('.dropdown').querySelector('input');
				}
				else{
					break;
				}

				const nextTopLevelItem = getNextElement(topLevelItems, currentItem);
				// Move focus to previous top-level item and open it if dropdown is open
				if(nextTopLevelItem.attributes['aria-haspopup'] && nextTopLevelItem.attributes['aria-haspopup'].value === "true"){
					nextTopLevelItem.checked = currentItem.checked;
				} else{
					nextTopLevelItem.checked = false;
				}
				nextTopLevelItem.focus();
				break;

			case keyCode.RETURN:
				// Open or close dropdown
				// Space also does this by default
				if(target.attributes['aria-haspopup'] && target.attributes['aria-haspopup'].value === "true"){
					target.checked = !target.checked;
				}
				break;

			case keyCode.TAB:
				if(event.target === lastMenuItem){
					// Close dropdown
					const lastDropdown = Array.from(
						menu.querySelectorAll('[aria-haspopup]')
					).pop();
					lastDropdown.checked = false;
				}
				break;

			case keyCode.ESC:
				let parentPopup;
				// If we're on a top-level menu element
				if(target.attributes['aria-haspopup']){
					parentPopup = target;
				}
				// If we're inside a dropdown
				else if(target.attributes['role'] && target.attributes['role'].value === "menuitem"){
					parentPopup = target.closest('.dropdown').querySelector('input');
				}
				parentPopup.checked = false;
				parentPopup.focus();
				break;
	}

};

function getNextElement(items, currentItem){
	const currentIndex = items.findIndex(x => x == currentItem);
	return items[Math.min(currentIndex + 1, items.length - 1)];
};

function getPreviousElement(items, currentItem){
	const currentIndex = items.findIndex(x => x == currentItem);
	return items[Math.max(currentIndex - 1, 0)];
};


// Highlights users current section in navigation
// Adapted from https://stackoverflow.com/a/21718316

checkUrl();
			
function checkUrl () {
	if(location.pathname == "/" && 
		location.hash.length <= 1 && 
		location.search.length <= 1) {
			document.getElementById("home-tab").setAttribute("class","current");
	}
	if (window.location.href.indexOf("index") > -1) {	
			document.getElementById("home-tab").setAttribute("class","current");
	};
	if (window.location.href.indexOf("texts") > -1 ||
		window.location.href.indexOf("visual") > -1 ||
		window.location.href.indexOf("books") > -1 ||
		window.location.href.indexOf("motion") > -1 ||
		window.location.href.indexOf("essays") > -1 ||
		window.location.href.indexOf("_TEI") > -1 ||
		window.location.href.indexOf("_ART") > -1) {	
			document.getElementById("materials-tab").setAttribute("class","current");
	};
	if (window.location.href.indexOf("analytical") > -1 ||
		window.location.href.indexOf("design") > -1 ||
		window.location.href.indexOf("collaboration") > -1 ||
		window.location.href.indexOf("guidelines") > -1) {	
			document.getElementById("about-tab").setAttribute("class","current");
	};
	if (window.location.href.indexOf("contributors") > -1 ||
		window.location.href.indexOf("acknowledgments") > -1 ||
		window.location.href.indexOf("bibliography") > -1 ||
		window.location.href.indexOf("site_map") > -1) {	
			document.getElementById("misc-tab").setAttribute("class","current");
	};
};	


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


// Overlay
// Adapted from https://www.w3schools.com/howto/howto_js_fullscreen_overlay.asp

function openNav() {
	document.getElementById("nav7").style.display = "block";
	document.getElementById("nav7").style.visibility = "visible";
	document.getElementsByTagName("html")[0].style.overflowY = "hidden";
};

function closeNav() {
	document.getElementById("nav7").style.display = "none";
	document.getElementById("nav7").style.visibility = "hidden";
	document.getElementsByTagName("html")[0].style.overflowY = "unset";
};


// Trap Focus in Overlay
// Adapted from https://www.taraprasad.com/trap-focus-inside-an-element/
// Also see https://hiddedevries.nl/en/blog/2017-01-29-using-javascript-to-trap-focus-in-an-element
jQuery(document).ready(function () {
	jQuery('#overlay-last').on('keydown', function (e) {
		var isTabPressed = (e.key === 'Tab' || e.keyCode === KEYCODE_TAB);
		if (!isTabPressed) {
			return
		}
		if (e.shiftKey) {
			return
		} else {
			jQuery('#nav8').focus();
			e.preventDefault()
		}
			});
	jQuery('#nav8').on('keydown', function (e) {
		var isTabPressed = (e.key === 'Tab' || e.keyCode === KEYCODE_TAB);
		if (!isTabPressed) {
			return
		}
		if (e.shiftKey) {
			jQuery('#overlay-last').focus();
			e.preventDefault()
		} else {
			return
		}
	})
});


// Needed to prevent a "Best Practices" issue created by Google Translate
// Adapted from https://social.technet.microsoft.com/Forums/en-US/809eaecb-fc3b-40e2-ae0b-f2d79feb58b0/need-easy-way-to-force-all-links-to-open-in-new-tab

AddRelNoopener();

function AddRelNoopener(){
		var links = document.querySelectorAll("a");
		for(var i = 0; i < links.length; i++){
				links[i].setAttribute("rel","noopener");
		}
};


// Link cache buster: Takes all site links, changes them from relative to absolute links (if relative in the first place; absolute links stay absolute), adds a random string to the end.
// Note: Add random string bit currently disabled.

RandomiseHref();

function RandomiseHref(){
		var links = document.querySelectorAll("a:not([href^='http']):not([href*='#']):not([href^='mailto']):not([onclick]):not([class='trans-return']):not([class='art-return'])");
		for(var i = 0; i < links.length; i++){
			// var randomString = Math.floor(Math.random()*1000000);
			// links[i].href = links[i].href + "?=" + randomString;
			links[i].href = links[i].href;
		}
};


// Removes unused Google script that also registers an unload listener
// Adapted from https://stackoverflow.com/a/30073090

$('head').find('script').filter(function(){
    return $(this).attr('src') === 'https://translate.googleapis.com/element/TE_20201130_00/e/js/element/element_main.js'
}).remove();


// Ensures that Google logo for Translate is served at correct size
// Adapted from https://stackoverflow.com/a/30073090

$('body').find('img').filter(function(){
    return $(this).attr('src') === 'https://www.gstatic.com/images/branding/googlelogo/1x/googlelogo_color_42x16dp.png'
}).replaceWith( "<img src='https://www.gstatic.com/images/branding/googlelogo/2x/googlelogo_color_42x16dp.png' srcset='https://www.gstatic.com/images/branding/googlelogo/2x/googlelogo_color_42x16dp.png 2x, https://www.gstatic.com/images/branding/googlelogo/1x/googlelogo_color_42x16dp.png 1x' sizes='38.5px' width='38.5px' height='14.656px' style='padding-right:3px;' alt='Google Translate' />" );


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