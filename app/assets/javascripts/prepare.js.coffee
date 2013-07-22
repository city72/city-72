$( ->
	$('a.quick-guide-trigger').click ->
		$('.modal').addClass('active')
		$('.modal.bg').addClass('active')

	$('.modal.bg').click ->
		$('.modal').removeClass('active')
		$('.modal.bg').removeClass('active')
)