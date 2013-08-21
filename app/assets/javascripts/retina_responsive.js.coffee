class RetinaResponsive

	isRetinaDisplay = ->
		window.devicePixelRatio && window.devicePixelRatio > 1

	checkRetinaDisplay = ->
		if isRetinaDisplay()
			images = $('img.retina-img')
			$.each images, (i, e) ->
				retina_url = $(e).attr('alt')
				$(e).attr('src', retina_url)
			console.log('Retina responsive!')

	check: ->
		checkRetinaDisplay()

@Sf72.RetinaResponsive = new RetinaResponsive
