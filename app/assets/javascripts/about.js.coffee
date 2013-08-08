$(->
	$('input.send').click -> makeCorsRequest "#{window.location.origin}/emails", 
		(xhr) ->
			response = $.parseJSON xhr.response
			console.log xhr
			alert response.msj, 
		{ 
			from_email: $('input.from-email').val(),
			subject: $('input.subject').val(),
			message: $('input.message').val(),
		}
)