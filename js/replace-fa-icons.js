// Replaces Font/Fork Awesome icons in nav with text if either CSS fails; hides other FA icons on page
// Created in collaboration with ChatGPT (https://chat.openai.com/chat) through an extended Q&A process
document.addEventListener('DOMContentLoaded', () => {
  const urls = ["https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css", "https://cdn.jsdelivr.net/npm/fork-awesome@1.2.0/css/fork-awesome.min.css"];
  const results = [];
  urls.forEach(url => {
      fetch(url, {method: "HEAD"}).then(response => {
          results.push(response.ok);
          if (results.length === urls.length) {
              if (!results.every(result => result)) {
                  replaceIconsWithText();
                  hideElementsWithClasses()
              }
          }
      }).catch(error => {
          results.push(false);
          if (results.length === urls.length) {
              replaceIconsWithText();
              hideElementsWithClasses()
          }
      })
  });
  function replaceIconsWithText() {
      const icons = [
          {
              selector: ".fa-bars",
              text: "Menu"
          }, {
              selector: ".fa-times",
              text: "Close"
          }, {
              selector: ".fa-map-marker",
              text: "Site Map"
          }, {
              selector: ".fa-home",
              text: "Home"
          }, {
              selector: ".fa-envelope",
              text: "Email"
          }, {
              selector: ".fa-github-alt",
              text: "GitHub"
          }, {
              selector: ".fa-zotero",
              text: "Zotero"
          }
      ];
      const navContainer = document.querySelector(".nav-container");
      if (navContainer) {
          icons.forEach(icon => {
              const elements = navContainer.querySelectorAll(icon.selector);
              elements.forEach(element => {
                  const textNode = document.createTextNode(icon.text);
                  element
                      .parentNode
                      .replaceChild(textNode, element)
              })
          })
      }
  }
  function hideElementsWithClasses() {
      const classes = ["fa", "fas", "fa-solid", "fa-brands", "caption-icon"];
      const bodyElements = document.querySelectorAll("body *:not(.nav-container)");
      bodyElements.forEach(element => {
          classes.forEach(className => {
              if (element.classList.contains(className)) {
                  element.style.display = "none";
                  element.style.visibility = "hidden"
              }
          })
      })
  }
});