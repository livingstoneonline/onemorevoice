
/* Adapted from https://social.technet.microsoft.com/Forums/en-US/809eaecb-fc3b-40e2-ae0b-f2d79feb58b0/need-easy-way-to-force-all-links-to-open-in-new-tab */

AddRelNoopener();

function AddRelNoopener(){
    var links = document.querySelectorAll("a");
    for(var i = 0; i < links.length; i++){
        links[i].setAttribute("rel","noopener");
    }
}