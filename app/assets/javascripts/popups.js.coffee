
window.twitterShare = (text) ->
	if text
		window.open("http://twitter.com/share?text=#{text}:", '', 'width=600,height=300')
	else
		window.open("http://twitter.com/share?text=Let’s%20get%20connected.+Let’s%20get%20prepared.:", '', 'width=600,height=300')

window.facebookShare = -> window.open('https://www.facebook.com/sharer/sharer.php?u='+encodeURIComponent(location.href),
								      'facebook-share-dialog',
								      'width=626,height=436');