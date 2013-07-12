function initialize() {
	var myCenter = new google.maps.LatLng(51.508742,-0.120850);
	var mapProp = {
		center: myCenter,
		zoom:5,
		mapTypeId:google.maps.MapTypeId.ROADMAP
	};

	var map=new google.maps.Map(document.getElementById("googleMap"), mapProp);

	placeMarker(myCenter)

	function placeMarker(location) {
		var marker = new google.maps.Marker({
			position: location,
			map: map,
		});
		google.maps.event.addListener(marker, 'click', function(event) { 
	       deleteMarker(marker)
	    });
		return marker;
	}

	function saveMarker(marker) {
		$.post('map_marker/create', { lon: marker.position.lng(), lat: marker.position.lat() }, function(data) {
			console.log('successfully  created marker')
		});
	}

	function deleteMarker(marker) {
		marker.setMap(null)
		$.ajax({
			url: 'map_marker/delete',
			type: 'delete',
			data: { lon: marker.position.lng(), lat: marker.position.lat() },
			success: function(data) { console.log('successfully  deleted marker') }
		})
	}

	google.maps.event.addListener(map, 'click', function(event) {
		var marker = placeMarker(event.latLng);
		saveMarker(marker);
	});

	function getMarkers() {
		$.get('map_marker/' + myCenter.lng() + '/' + myCenter.lat() + '/300000', function(serverMarkers){
			_(serverMarkers).each(function(sm){
				placeMarker(new google.maps.LatLng(sm.lon_lat.lat, sm.lon_lat.lon));
			})
		})
	}

	getMarkers()

	google.maps.event.addListener(map,'mouseup',function() {
		if(myCenter != map.getCenter()) {
			myCenter = map.getCenter();
			getMarkers();
		}
	});
}

google.maps.event.addDomListener(window, 'load', initialize);