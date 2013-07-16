project.controller "storyDetailController", ["$scope", (scope) ->
	scope.editMode = false
	scope.edit = -> scope.editMode = !scope.editMode

	populateFakeData = ->
		scope.video_src = 'http://player.vimeo.com/video/57727292'
		scope.name = 'Kristin'
		scope.disaster = 'Hurricane Sandy'
		scope.location = 'New York City'
		scope.date = 'Nov 2012'
		scope.age = '27'
		scope.civil_state = 'Single'
		scope.home_type = 'apartment'
		scope.main_story = 'Kirstin was living with three roommates in her East Villiage apartment when Hurricane Sandy struck. Kirstin’s apartment quickly became the tech hub of her neighborhood. Hear her story.'
		scope.main_quote = 'After Hurricane Sandy we set up a generator and started charging people’s phones'
		scope.needed_list_1_image_url = 'http://placekitten.com/300/170'
		scope.needed_list_1_quote = 'It means you can leave the house at night.'
		scope.needed_list_2_image_url = 'http://placekitten.com/300/170'
		scope.needed_list_2_quote = 'We didn’t use it but it helped us feel safe.'
		scope.needed_list_3_image_url = 'http://placekitten.com/300/170'
		scope.needed_list_3_quote = 'Our friends came around because we had wine.'
		scope.learned_list_1_quote = 'I wish I had set a meeting spot with my friends. Once the hurricane hit, it was too late.'
		scope.learned_list_1_href = '#'
		scope.learned_list_1_anchor = 'See the app'
		scope.learned_list_2_quote = 'I wish I had set a meeting spot with my friends. Once the hurricane hit, it was too late.'
		scope.learned_list_2_href = '#'
		scope.learned_list_2_anchor = 'Get your stuff'
		scope.learned_list_3_quote = 'Everyone has something to share. Even a bike can be an invaluable tool.'
		scope.learned_list_3_href = '#'
		scope.learned_list_3_anchor = 'Sign up for AlertSF'

	populateFakeData()

	$(document).bind('keydown', 'alt+q', -> scope.edit(); scope.$apply();)

	$('[id]').each (index, editableObj) -> 
		$(editableObj).bind 'click', -> 
			scope[$(editableObj).attr('id')] = editableObj.textContent
			scope.editMode = false; scope.$apply()

	$('img').bind 'click', -> scope.edit(); scope.$apply()
	$('a').bind 'click', -> scope.edit(); scope.$apply()
]
