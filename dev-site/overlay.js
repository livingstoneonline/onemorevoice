/* Taken from https://www.w3schools.com/howto/howto_js_fullscreen_overlay.asp */

        function openNav() {
          document.getElementById("overlay").style.display = "block";
          document.getElementById("title-div").style.display = "none";
          document.getElementById("main-div").style.display = "none";
          document.getElementById("manuscript-div").style.display = "none";
          document.getElementById("journal-div").style.display = "none";
          document.getElementById("credits-div").style.display = "none";
          document.getElementById("credits1-div").style.display = "none";
          document.getElementById("credits2-div").style.display = "none";
          document.getElementById("footer-div").style.display = "none";
        }
        
        function closeNav() {
          document.getElementById("overlay").style.display = "none";
          document.getElementById("title-div").style.display = "block";
          document.getElementById("main-div").style.display = "block";
          document.getElementById("manuscript-div").style.display = "block";
          document.getElementById("journal-div").style.display = "block";
          document.getElementById("credits-div").style.display = "block";
          document.getElementById("credits1-div").style.display = "block";
          document.getElementById("credits2-div").style.display = "block";
          document.getElementById("footer-div").style.display = "block";
        }