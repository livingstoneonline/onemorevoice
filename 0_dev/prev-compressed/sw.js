"use strict";console.log('WORKER: executing.');var version='v002::';var offlineFundamentals=['/site.webmanifest','/favicon.ico','/common/footer-1.html','/common/footer-2.html','/common/nav-1.html','/common/nav-2.html','/common/sidebar-1.html','/common/sidebar-2.html','/css/critical.css','/css/font-awesome.min.css','/css/style.css','/css/styleTEI-add.css','/css/styleTEI.css','/fonts/fontawesome-webfont.woff','/fonts/fontawesome-webfont.woff2','/img/logo/OMV-logo-29px.jpg','/img/logo/OMV-logo-36px.jpg','/img/logo/OMV-logo-39px.jpg','/img/logo/OMV-logo-58px.jpg','/img/logo/OMV-logo-72px.jpg','/img/logo/OMV-logo-78px.jpg','/img/logo/OMV-logo-87px.jpg','/sidebar/liv_021018_0001_sidebar-100px.jpg','/sidebar/liv_021018_0001_sidebar-200px.jpg','/sidebar/liv_021041_0001_sidebar-100px.jpg','/sidebar/liv_021041_0001_sidebar-200px.jpg','/sidebar/liv_023018_0001_sidebar-100px.jpg','/sidebar/liv_023018_0001_sidebar-200px.jpg','/sidebar/liv_023021_0001_sidebar-100px.jpg','/sidebar/liv_023021_0001_sidebar-200px.jpg','/sidebar/github-100px.png','/sidebar/github-200px.png','/sidebar/livingstone_online-175px.png','/sidebar/livingstone_online-350px.png','/sidebar/zotero-100px.png','/sidebar/zotero-200px.png','/js/journal-transform.js','/js/jquery-3.5.1.min.js','/js/manuscript-transform.js','/js/scripts.js'];self.addEventListener("install",function(event){console.log('WORKER: install event in progress.');event.waitUntil(caches .open(version+'fundamentals').then(function(cache){return cache.addAll(offlineFundamentals)}).then(function(){console.log('WORKER: install completed')}))});self.addEventListener("fetch",function(event){console.log('WORKER: fetch event in progress.');if(event.request.method!=='GET'){console.log('WORKER: fetch event ignored.',event.request.method,event.request.url);return}event.respondWith(caches .match(event.request).then(function(cached){var networked=fetch(event.request).then(fetchedFromNetwork,unableToResolve).catch(unableToResolve);console.log('WORKER: fetch event',cached?'(cached)':'(network)',event.request.url);return cached||networked;function fetchedFromNetwork(response){var cacheCopy=response.clone();console.log('WORKER: fetch response from network.',event.request.url);caches .open(version+'pages').then(function add(cache){cache.put(event.request,cacheCopy)}).then(function(){console.log('WORKER: fetch response stored in cache.',event.request.url)});return response}function unableToResolve(){console.log('WORKER: fetch request failed in both cache and network.');return new Response('<h1>Service Unavailable</h1>',{status:503,statusText:'Service Unavailable',headers:new Headers({'Content-Type':'text/html'})})}}))});self.addEventListener("activate",function(event){console.log('WORKER: activate event in progress.');event.waitUntil(caches .keys().then(function(keys){return Promise.all(keys.filter(function(key){return!key.startsWith(version)}).map(function(key){return caches.delete(key)}))}).then(function(){console.log('WORKER: activate completed.')}))});