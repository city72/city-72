project.controller "storyDetailController", ["$scope", "restService", "$routeParams",  (scope, restService, routeParams) ->
	scope.editMode = false
	scope.edit = -> scope.editMode = !scope.editMode

	scope.story = {}

	populateFakeData = ->
		scope.story.main_image_url = 'http://placekitten.com.s3.amazonaws.com/homepage-samples/408/287.jpg'
		scope.story.victim = 'Kristin'
		scope.story.disaster = 'Hurricane Sandy'
		scope.story.location = 'New York City'
		scope.story.date = 'Nov 2012'
		scope.story.age = '27'
		scope.story.civil_state = 'Single'
		scope.story.home_type = 'apartment'
		scope.story.main_story = 'Kirstin was living with three roommates in her East Villiage apartment when Hurricane Sandy struck. Kirstin’s apartment quickly became the tech hub of her neighborhood. Hear her story.'
		scope.story.main_quote = 'After Hurricane Sandy we set up a generator and started charging people’s phones'
		scope.story.needed_list_1_image_url = 'http://placekitten.com/300/170'
		scope.story.needed_list_1_quote = 'It means you can leave the house at night.'
		scope.story.needed_list_2_image_url = 'http://placekitten.com/300/170'
		scope.story.needed_list_2_quote = 'We didn’t use it but it helped us feel safe.'
		scope.story.needed_list_3_image_url = 'http://placekitten.com/300/170'
		scope.story.needed_list_3_quote = 'Our friends came around because we had wine.'
		scope.story.learned_list_1_quote = 'I wish I had set a meeting spot with my friends. Once the hurricane hit, it was too late.'
		scope.story.learned_list_1_href = '#'
		scope.story.learned_list_1_anchor = 'See the app'
		scope.story.learned_list_2_quote = 'I wish I had set a meeting spot with my friends. Once the hurricane hit, it was too late.'
		scope.story.learned_list_2_href = '#'
		scope.story.learned_list_2_anchor = 'Get your stuff'
		scope.story.learned_list_3_quote = 'Everyone has something to share. Even a bike can be an invaluable tool.'
		scope.story.learned_list_3_href = '#'
		scope.story.learned_list_3_anchor = 'Sign up for AlertSF'

	if id
		restService.stories.get
			id: id
		,
			(story) -> scope.story = story
		,
			(error) -> console.log(error)
	else
		populateFakeData()

	$(document).bind('keydown', 'alt+q', -> scope.edit(); scope.$apply();)

	$('[id]').each (index, editableObj) -> 
		$(editableObj).bind 'click', -> 
			scope.story[$(editableObj).attr('id')] = editableObj.textContent
			scope.editMode = false; scope.$apply()

	$('img').bind 'click', -> scope.edit(); scope.$apply()
	$('a').bind 'click', -> scope.edit(); scope.$apply()

	successCallback = -> console.log('successfully saved')
	errorCallback =-> console.log('error while saving')

	if id
		scope.save = -> 
			restService.stories.update scope.story, successCallback, errorCallback
	else
		scope.save = -> 
			restService.stories.save scope.story, successCallback, errorCallback
]
