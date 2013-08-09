$(->
	$('input.send').click -> makeCorsRequest "#{window.location.origin}/emails", 
		(xhr) ->
			response = $.parseJSON xhr.response
			alert response.msj, 
		{ 
			from_email: $('input.from-email').val(),
			name: $('input.name').val(),
			message: $('textarea.message').val(),
			captcha: $('[name="captcha"]').val(),
			captcha_key: $('[name="captcha_key"]').val()
		}
)