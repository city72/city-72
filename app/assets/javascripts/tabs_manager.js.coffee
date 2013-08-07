
window.showActive = (elements) ->
	urlHash = window.location.hash || elements[0].href
	activeElem = _(elements).find (elem) -> elem.href == urlHash
	if activeElem
		inactiveElems = _(elements).filter (elem) -> elem.href != urlHash

		$(activeElem.contentSelector).show()
		$(activeElem.anchorSelector).parent('li').addClass 'active'

		_(inactiveElems).each (inactiveElem) ->
			$(inactiveElem.contentSelector).hide()
			$(inactiveElem.anchorSelector).parent('li').removeClass 'active'