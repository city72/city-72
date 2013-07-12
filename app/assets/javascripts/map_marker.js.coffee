initialize = ->
	placeMarker = (location) ->
		marker = new google.maps.Marker position: location, map: map
		markers.push(marker)
		google.maps.event.addListener marker, "click", (event) -> deleteMarker marker
		return marker

	saveMarker = (marker) ->
		$.post "map_marker/create", { lon: marker.position.lng(), lat: marker.position.lat() }, (data) -> 
			console.log "successfully  created marker"

	removeMarker = (marker) ->
		marker.setMap null
		marker = null

	deleteMarker = (marker) ->
		$.ajax
			url: "map_marker/delete"
			type: "delete"
			data:
				lon: marker.position.lng()
				lat: marker.position.lat()
			success: (data) ->
				removeMarker marker
				console.log "successfully  deleted marker"

	getMarkers = ->
		$.get "map_marker/#{map.getBounds().getNorthEast().lng()}
						 /#{map.getBounds().getNorthEast().lat()}
						 /#{map.getBounds().getSouthWest().lng()}
						 /#{map.getBounds().getSouthWest().lat()}", (serverMarkers) ->
			markersToRemove = _(markers).filter (m) -> _(serverMarkers).every (sm) -> m.position.lng() != sm.lon_lat.lon or m.position.lat() != sm.lon_lat.lat
			_(markersToRemove).each (m) -> removeMarker m
			_(serverMarkers).each (sm) -> placeMarker(new google.maps.LatLng(sm.lon_lat.lat, sm.lon_lat.lon))

	markers = []
	myCenter = new google.maps.LatLng(51.508742, -0.120850)
	mapProp =
		center: myCenter
		zoom: 14
		mapTypeId: google.maps.MapTypeId.ROADMAP

	map = new google.maps.Map(document.getElementById("googleMap"), mapProp)

	google.maps.event.addListener map, "click", (event) ->
		marker = placeMarker(event.latLng)
		saveMarker marker

	google.maps.event.addListener map, 'idle', () -> 
		myCenter = map.getCenter()
		getMarkers()

google.maps.event.addDomListener window, "load", initialize
	