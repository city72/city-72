$(->
	$('#title_bar').hide()

	Admin =
		_showPanel: ->
			$('#modal-panel').modal()

		_confirmPanel: ->
			$('#confirm-off-panel').modal()

		initializeTurnOnBtn: ->
			$('#turn-on-btn').click ->
				Admin._showPanel()

		initializeTurnOffBtn: ->
			$('#turn-off-btn').click ->
				Admin._confirmPanel()

		initializeUpdateCrisisInfoBtn: ->
			$('#update_crisis_info').click ->
				Admin._showPanel()

		init: ->
			this.initializeTurnOnBtn()
			this.initializeUpdateCrisisInfoBtn()
			this.initializeTurnOffBtn()

	Admin.init()

)