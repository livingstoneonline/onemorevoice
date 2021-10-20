// Needed for Google translate
function googleTranslateElementInit() {
	new google
			.translate
			.TranslateElement({
					pageLanguage: 'en'
			}, 'google_translate_element')
}

$.getScript("//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit");