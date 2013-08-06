$(->
	$('input.submit').click -> makeCorsRequest "#{window.location.origin}/suscriptions", 
		(xhr) -> console.log xhr, 
		{ email: $('input.email').val() }
)