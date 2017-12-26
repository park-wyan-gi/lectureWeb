<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>gogole maps</title>
<style>
#map{
	border:1px solid #aaaaaa;
	width:500px; height:400px;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src = 'http://maps.google.com/maps/api/js?key=AIzaSyCfKdv6idaMM19FbMSxPBdidDHgrnSbwcs'>
</script>
<script>
	window.onload = function(){
		var map = document.getElementById('map');
		//위도, 경도의 객체
		var latlng = new google.maps.LatLng(37.4479420, 127.1414300);
		var gMap = new google.maps.Map(
					map,
					{
						zoom:16, //1~21
						center:latlng,
						mapTypeId : google.maps.MapTypeId.ROADMAP
					}
		);
		
		//marker
		var marker = new google.maps.Marker(
			{position : latlng,
				map : gMap,
				title : '우리집'
			}		
		);
	}

</script>
</head>
<body>
<h1>Maps</h1>
<div id='map'></div>
</body>
</html>