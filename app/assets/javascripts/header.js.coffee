$( ->
	windowPath = window.location.pathname

	paths = ['/connect', '/prepare', '/about']

	_(paths).each (path) -> if path == windowPath then $('[href="' + path + '"]').parent('li').addClass('active')
)