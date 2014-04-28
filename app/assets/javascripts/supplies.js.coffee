$( ->

  $('a.pdf-languages-trigger').click ->
    $(this).toggleClass 'active'
    $('.download-languages').toggleClass 'active'

	categories = [
		{ href: '#tab-essentials-content', contentSelector: '.tab-essentials-content', anchorSelector: '[href="#tab-essentials-content"]' }
		{ href: '#tab-useful-content', contentSelector: '.tab-useful-content', anchorSelector: '[href="#tab-useful-content"]' }
		{ href: '#tab-personal-content', contentSelector: '.tab-personal-content', anchorSelector: '[href="#tab-personal-content"]' }
	]

	showActive categories

	window.onhashchange = -> showActive categories

)