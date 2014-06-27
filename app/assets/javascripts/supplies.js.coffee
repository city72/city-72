categories = [
	{ href: '#tab-essentials-content', contentSelector: '.tab-essentials-content', anchorSelector: '[href="#tab-essentials-content"]' }
	{ href: '#tab-useful-content', contentSelector: '.tab-useful-content', anchorSelector: '[href="#tab-useful-content"]' }
	{ href: '#tab-personal-content', contentSelector: '.tab-personal-content', anchorSelector: '[href="#tab-personal-content"]' }
]

$(document).ready ->

  $('a.pdf-languages-trigger').click ->
    $(this).toggleClass 'active'
    $('.download-languages').toggleClass 'active'


  $('.tab-useful-content').hide()
  $('.tab-personal-content').hide()

	showActive categories

window.onhashchange = -> showActive categories
