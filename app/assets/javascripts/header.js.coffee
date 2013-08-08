$( ->
	windowPath = window.location.pathname

	paths = _($('.header a')).pluck 'pathname'

	if windowPath == '/home' || windowPath == '/'
		$('[href="/home"]').addClass('active')
	else
		_(paths).each (path) ->
			if path == windowPath
				$('[href="' + path + '"]').parent('li').addClass('active')
				#if link is in a submenu, also set active to parent li
				if $('[href="' + path + '"]').closest('.submenu')
					$('[href="' + path + '"]').closest('ul.submenu').parent('li').addClass('active')
)