
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