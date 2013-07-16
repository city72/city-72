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

	populateFakeData()

	$(document).bind('keydown', 'alt+q', -> scope.edit(); scope.$apply();)
]
