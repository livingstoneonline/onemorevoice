// Image Rotation */
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