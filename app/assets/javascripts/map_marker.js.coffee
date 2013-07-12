initialize = ->
	placeMarker = (location) ->
		marker = new google.maps.Marker position: location, map: map
		google.maps.event.addListener marker, "click", (event) -> deleteMarker marker
		return marker

	saveMarker = (marker) ->
		$.post "map_marker/create", { lon: marker.position.lng(), lat: marker.position.lat() }, (data) -> 
			console.log "successfully  created marker"

	deleteMarker = (marker) ->
		marker.setMap null
		$.ajax
			url: "map_marker/delete"
			type: "delete"
			data:
				lon: marker.position.lng()
				lat: marker.position.lat()

			success: (data) ->
				console.log "successfully  deleted marker"

	getMarkers = ->
		$.get "map_marker/#{myCenter.lng()}/#{myCenter.lat()}/300000", (serverMarkers) ->
			_(serverMarkers).each (sm) -> placeMarker(new google.maps.LatLng(sm.lon_lat.lat, sm.lon_lat.lon))

	myCenter = new google.maps.LatLng(51.508742, -0.120850)
	mapProp =
		center: myCenter
		zoom: 5
		mapTypeId: google.maps.MapTypeId.ROADMAP

	map = new google.maps.Map(document.getElementById("googleMap"), mapProp)
	placeMarker myCenter
	google.maps.event.addListener map, "click", (event) ->
		marker = placeMarker(event.latLng)
		saveMarker marker

	getMarkers()
	google.maps.event.addListener map, "mouseup", ->
		if myCenter isnt map.getCenter()
			myCenter = map.getCenter()
			getMarkers()

google.maps.event.addDomListener window, "load", initialize