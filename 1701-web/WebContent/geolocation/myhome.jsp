<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>myhome</title>
<style>
#map{
	width:400px;
	height:500px;
	border:2px solid #aaaaaa;
}
</style>
<script src='http://maps.google.com/maps/api/js?key=AIzaSyChaXjBYC3odLFuFOgZxM9dqZE2I0_WDCM'></script>

<script>
window.onload=start;

function start(){
	var btnGo = document.getElementById('go');
	var btnHome = document.getElementById('goHome');
	
	btnGo.onclick=function(){
		var map = document.getElementById('map');
		var lat = 35.1631140;
		var lon = 129.1635510;
		var pos = new google.maps.LatLng(lat, lon);
		var gmap = new google.maps.Map(map, {
			zoom:16,
			center:pos,
			mapTypeId:google.maps.MapTypeId.ROADMAP
		});
		
	}
	
	btnHome.onclick=function(){
		var map = document.getElementById('map');
		var lat = 37.4479420;
		var lon = 127.1414300;
		var pos = new google.maps.LatLng(lat, lon);
		var gmap = new google.maps.Map(map, {
			zoom:16,
			center:pos,
			mapTypeId:google.maps.MapTypeId.ROADMAP
		});
	}
	
}

</script>

</head>
<body>
<h3>geolocation example<hr/></h3>

<div id='map'></div>

<p/>

<input type='button' value='해운대' id='go'/>
<input type='button' value='집으로' id='goHome'>
</body>
</html>