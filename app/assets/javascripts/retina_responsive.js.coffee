class RetinaResponsive

	isRetinaDisplay = ->
		window.devicePixelRatio && window.devicePixelRatio > 1

	checkRetinaDisplay = ->
		if isRetinaDisplay()
			images = $('img.retina-img')
			$.each images, (i, e) ->
				retina_url = $(e).attr('data-retina-url')
				$(e).attr('src', retina_url)
			true

	check: ->
		checkRetinaDisplay()

@Sf72.RetinaResponsive = new RetinaResponsive
