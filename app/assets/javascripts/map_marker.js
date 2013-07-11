var myCenter = new google.maps.LatLng(51.508742,-0.120850);
function initialize() {
	var mapProp = {
		center: myCenter,
		zoom:5,
		mapTypeId:google.maps.MapTypeId.ROADMAP
	};

	var map=new google.maps.Map(document.getElementById("googleMap"), mapProp);

	var marker=new google.maps.Marker({ position: myCenter});

	marker.setMap(map);

	for (var i = serverMarkers.length - 1; i >= 0; i--) {
		var marker=new google.maps.Marker({ position: serverMarkers[i] })
		marker.setMap(map);
	};

	google.maps.event.addListener(map, 'click', function(event) {
		placeMarker(event.latLng);
	});

	function placeMarker(location) {
		var marker = new google.maps.Marker({
			position: location,
			map: map,
		});
		
		$.post('create', { lon: marker.position.lng(), lat: marker.position.lat() },function(data) {
			marker.setMap(map)
		});
	}
}

google.maps.event.addDomListener(window, 'load', initialize);