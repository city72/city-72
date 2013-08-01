
window.showActive = (elements, noneBlock = true) ->
	urlHash = window.location.hash || elements[0].href
	activeElem = _(elements).find (elem) -> elem.href == urlHash
	inactiveElems = _(elements).filter (elem) -> elem.href != urlHash

	if noneBlock
		$(activeElem.contentSelector).show()
	else
		$(activeElem.contentSelector).css('visibility', 'visible');
		$(activeElem.contentSelector).css('height', '13rem');
	$(activeElem.anchorSelector).parent('li').addClass 'active'

	_(inactiveElems).each (inactiveElem) ->
		if noneBlock
			$(inactiveElem.contentSelector).hide()
		else
			$(inactiveElem.contentSelector).css('visibility', 'hidden');
			$(inactiveElem.contentSelector).css('height', '0');
		$(inactiveElem.anchorSelector).parent('li').removeClass 'active'