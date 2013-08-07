$( ->
	reports = [
		{ href: '#tab-citizen-updates', contentSelector: '.citizen-reports', anchorSelector: '[href="#tab-citizen-updates"]' }
		{ href: '#tab-official-reports', contentSelector: '.official-reports', anchorSelector: '[href="#tab-official-reports"]' }
		{ href: '#tab-service-status', contentSelector: '.status', anchorSelector: '[href="#tab-service-status"]' }
	]

	showActive reports

	window.onhashchange = -> showActive reports

	$('.em-quick-guide').hide()

	$('a.show-quick-guide').click ->
		$('.em-quick-guide').show()
		$('a.hide-quick-guide').css('display', 'block')
		$(this).css('display', 'none')

	$('a.hide-quick-guide').click ->
		$('.em-quick-guide').hide()
		$('a.show-quick-guide').css('display', 'block')
		$(this).css('display', 'none')

	$.get(window.location.origin + "/em",
		(response) ->
			$('.alert-info h3').text(response.title)
			$('.alert-info p').text(response.text)
	)
)