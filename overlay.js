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
}