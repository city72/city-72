$(->
	$('input.send').click ->
		$('.error-response-container').hide()
		$('.sending-notification').show()
		makeCorsRequest(
			"#{window.location.origin}/emails", 
			(xhr) ->
				$('.sending-notification').hide()
				response = $.parseJSON xhr.response
				if xhr.status == 200
					$('.contact-form').hide()
					$('.error-response-container').hide()
					$('.successful-response-container').show()
				else
					$('.error-response-container p').text(response.msj)
					$('.error-response-container').show()
			,{ 
				from_email: $('input.from-email').val(),
				name: $('input.name').val(),
				message: $('textarea.message').val(),
				captcha: $('[name="captcha"]').val(),
				captcha_key: $('[name="captcha_key"]').val()
			}
		)
)