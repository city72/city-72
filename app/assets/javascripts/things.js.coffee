$( ->
	showEssential = -> 
		$('.essential').show()
		$('.useful').hide()
		$('.personal').hide()

	showUseful = -> 
		$('.essential').hide()
		$('.useful').show()
		$('.personal').hide()

	showPersonal = -> 
		$('.essential').hide()
		$('.useful').hide()
		$('.personal').show()

	showCategoryItems = -> 
		switch window.location.hash
			when '#tab-useful-content' then showUseful()
			when '#tab-personal-content' then showPersonal()
			else showEssential()

	showCategoryItems()

	window.onhashchange = -> showCategoryItems()
)