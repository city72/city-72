$( ->
	categories = [
		{ href: '#tab-essentials-content', contentSelector: '.essential', anchorSelector: '[href="#tab-essentials-content"]' }
		{ href: '#tab-useful-content', contentSelector: '.useful', anchorSelector: '[href="#tab-useful-content"]' }
		{ href: '#tab-personal-content', contentSelector: '.personal', anchorSelector: '[href="#tab-personal-content"]' }
	]

	showActive = ->
		urlHash = window.location.hash || categories[0].href
		activeElem = _(categories).find (cat) -> cat.href == urlHash
		inactiveElems = _(categories).filter (cat) -> cat.href != urlHash

		$(activeElem.contentSelector).show()
		$(activeElem.anchorSelector).parent('li').addClass 'active'

		_(inactiveElems).each (inactiveElem) ->
			$(inactiveElem.contentSelector).hide()
			$(inactiveElem.anchorSelector).parent('li').removeClass 'active'

	showActive()

	window.onhashchange = -> showActive()
)