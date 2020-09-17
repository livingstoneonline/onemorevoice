/* Inversion, Justification Switches */
/* Created for One More Voice by way of Livingstone Online by Nigel Banks */

// Wait till document is loaded before executing.
document.addEventListener("DOMContentLoaded", function(event) {
    // Select the button element using it's ID.
    document.querySelector('input#invert')
    // Call this function when the button is clicked.
    .onclick = function () {
        // Find the element with class transcription,
        // and toggle the class 'change-display'.
        document.querySelector('body.transcription')
        .classList
        .toggle('invert-color');
    };
});

// Wait till document is loaded before executing.
document.addEventListener("DOMContentLoaded", function(event) {
    // Select the button element using it's ID.
    document.querySelector('input#remove-justification')
    // Call this function when the button is clicked.
    .onclick = function () {
        // Find the element with class transcription,
        // and toggle the class 'change-display'.
        document.querySelector('body.transcription')
        .classList
        .toggle('unjustify');
    };
});
