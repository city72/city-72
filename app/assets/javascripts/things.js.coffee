$( ->
	categories = [
		{ href: '#tab-essentials-content', contentSelector: '.essential', anchorSelector: '[href="#tab-essentials-content"]' }
		{ href: '#tab-useful-content', contentSelector: '.useful', anchorSelector: '[href="#tab-useful-content"]' }
		{ href: '#tab-personal-content', contentSelector: '.personal', anchorSelector: '[href="#tab-personal-content"]' }
	]

	showActive categories

	window.onhashchange = -> showActive categories
)