$(->
	$('#title_bar').hide()

	Admin =
		_showPanel: ->
			$('#modal-panel').show()

		_hidePanel: ->
			$('#modal-panel').hide()

		initializeCrisisModePanel: ->
			Admin._hidePanel()

		initializeTurnOnBtn: ->
			$('#turn-on-btn').click ->
				Admin._showPanel()

		initializeUpdateCrisisInfoBtn: ->
			$('#update_crisis_info').click ->
				Admin._showPanel()

		init: ->
			this.initializeCrisisModePanel()
			this.initializeTurnOnBtn()
			this.initializeUpdateCrisisInfoBtn()

	Admin.init()

)