$( ->
	windowPath = window.location.pathname

	paths = []
	$('.header a').each (index, elem) -> paths.push elem.pathname

	if windowPath == '/home' || windowPath == '/'
		$('[href="/home"]').addClass('active')
	else
		_(paths).each (path) -> if path == windowPath then $('[href="' + path + '"]').parent('li').addClass('active')
)