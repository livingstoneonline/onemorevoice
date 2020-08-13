
/* StickyNav */
/* Taken from https://www.mattmorgante.com/technology/sticky-navigation-bar-javascript */

const nav = document.querySelector('#nav2');
const navTop = nav.offsetTop;

function stickyNavigation() {
  console.log('navTop = ' + navTop);
  console.log('scrollY = ' + window.scrollY);

  if (window.scrollY >= navTop) {
    // nav offsetHeight = height of nav
    document.body.style.paddingTop = nav.offsetHeight + 'px';
    document.body.classList.add('fixed-nav');
  } else {
    document.body.style.paddingTop = 0;
    document.body.classList.remove('fixed-nav');
  }
}

window.addEventListener('scroll', stickyNavigation);

/* Overlay */
/* Adapted from https://www.w3schools.com/howto/howto_js_fullscreen_overlay.asp */
/* This works, but there is probably a much more concise way to write this. */

function openNav() {
    document.getElementById("nav3").style.display = "block";
    if (document.getElementById("skiptocontent") !== null) {document.getElementById("skiptocontent").style.display = "none"};
    if (document.getElementById("title-div") !== null) {document.getElementById("title-div").style.display = "none"};
    if (document.getElementById("main-div") !== null) {document.getElementById("main-div").style.display = "none"};
    if (document.getElementById("manuscript-div") !== null) {document.getElementById("manuscript-div").style.display = "none"};
    if (document.getElementById("journal-div") !== null) {document.getElementById("journal-div").style.display = "none"};
    if (document.getElementById("credits-div") !== null) {document.getElementById("credits-div").style.display = "none"};
    if (document.getElementById("credits1-div") !== null) {document.getElementById("credits1-div").style.display = "none"};
    if (document.getElementById("credits2-div") !== null) {document.getElementById("credits2-div").style.display = "none"};
    if (document.getElementById("footer-div") !== null) {document.getElementById("footer-div").style.display = "none"};
  }
  
  function closeNav() {
    document.getElementById("nav3").style.display = "none";
    if (document.getElementById("skiptocontent") !== null) {document.getElementById("skiptocontent").style.display = "block"};
    if (document.getElementById("title-div") !== null) {document.getElementById("title-div").style.display = "block"};
    if (document.getElementById("main-div") !== null) {document.getElementById("main-div").style.display = "block"};
    if (document.getElementById("manuscript-div") !== null) {document.getElementById("manuscript-div").style.display = "block"};
    if (document.getElementById("journal-div") !== null) {document.getElementById("journal-div").style.display = "block"};
    if (document.getElementById("credits-div") !== null) {document.getElementById("credits-div").style.display = "block"};
    if (document.getElementById("credits1-div") !== null) {document.getElementById("credits1-div").style.display = "block"};
    if (document.getElementById("credits2-div") !== null) {document.getElementById("credits2-div").style.display = "block"};
    if (document.getElementById("footer-div") !== null) {document.getElementById("footer-div").style.display = "block"};
  }

/* Keyboard Navigation for Dropdown Menus */
/* Adapted by Philip Allfrey for One More Voice from https://www.w3.org/TR/wai-aria-practices/examples/menubar/menubar-1/js/MenubarItemLinks.js */

const menu = document.getElementById('nav1');
menu.addEventListener('keydown', handleKeydown);
menu.addEventListener('focusin', handleFocusIn);

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
}

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

  switch(char){

  case keyCode.DOWN:
    // Stop the browser moving the page
    event.preventDefault();

    // If the popup has just been opened, move focus to first menu element
    if(event.target.attributes['aria-haspopup'] && event.target.attributes['aria-haspopup'].value === "true"){
      const firstMenuElement = event.target.parentElement.querySelector('[role="menuitem"]');
      firstMenuElement.focus();
    }
    // Otherwise move focus down one element
     else if(event.target.attributes['role'] && event.target.attributes['role'].value === "menuitem"){
      const menuItems = Array.from(
        event.target.closest('ul').querySelectorAll('[role="menuitem"]')
      );
      const currentIndex = menuItems.findIndex(x => x == event.target);
      // Wrap around to the top if we reach the bottom of the dropdown
      const nextMenuItem = menuItems[Math.min(currentIndex + 1, menuItems.length) % menuItems.length];
      nextMenuItem.focus();
    }
    break;

    case keyCode.UP:
      // Stop the browser from moving the page
      event.preventDefault();

      // Move the focus up one element
      if(event.target.attributes['role'] && event.target.attributes['role'].value === "menuitem"){
        const menuItems = Array.from(
          event.target.closest('ul').querySelectorAll('[role="menuitem"]')
        );
        const currentIndex = menuItems.findIndex(x => x == event.target);
        // Wrap around to the bottom if we reach the top of the dropdown
        const prevMenuItem = menuItems[Math.max(currentIndex - 1 + menuItems.length, 0) % menuItems.length];
        prevMenuItem.focus();
      }
      break;

    case keyCode.ESC:
      // Close all dropdowns
      Array.from(
        menu.querySelectorAll('[aria-haspopup]')
      )
      .forEach(x => {
        x.checked = false;
      })
      break;
  }

}

  /* Image Rotation */
  // Adapted from https://www.w3schools.com/howto/howto_js_toggle_class.asp and https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Roles/Switch_role

function myFunction() {
    var element1 = document.getElementById("rotate-button");
    var element2 = document.getElementById("image-to-rotate");
    if (element1.getAttribute("aria-checked") == "true") {
        element1.setAttribute("aria-checked", "false");
    } else {
        element1.setAttribute("aria-checked", "true");
    }
    element1.classList.toggle("click-color");
    element2.classList.toggle("rotate-180");
  }