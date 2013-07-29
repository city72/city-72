
window.twitterShare = (text) ->
	if text
		window.open("http://twitter.com/share?text=#{text}:", '', 'width=600,height=300')
	else
		window.open("http://twitter.com/share?text=The%20San%20Francisco%20Manifesto%20from%20SF72.org:", '', 'width=600,height=300')

window.facebookShare = -> window.open("http://facebook.com", '', 'width=600,height=300')