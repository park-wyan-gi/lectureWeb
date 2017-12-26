<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1.0' />

<title>dynamic_layout2</title>

<style>
	#main > div { 
		height:300px;
		float:left;
	}
	#main{
		overflow: hidden;
	}
	
	@media screen  and  (min-width:801px){
		#left { width: 20% ; background-color: #ffaaaa;}
		#center{ width:50% ; background-color: #aaffaa;}
		#right{ width:30% ; background-color: #aaaaff; }
	}
	
	@media screen and (min-width:600px) and (max-width:800px){
		#left { width: 50% ; background-color: #ffaaaa;}
		#center{ width:50% ; background-color: #aaffaa;}
		#right{ width:100% ; background-color: #aaaaff;  clear:left}
	}
	 
	@media screen  and (max-width:600px){
		#left { width: 100% ; background-color: #ffaaaa;}
		#center{ width:100% ; background-color: #aaffaa; clear:left}
		#right{ width:100% ; background-color: #aaaaff;  clear:left}
	}


</style>

</head>
<body>
<h1>단수 반응형 웹</h1>
<div id='main'>
	<div id='left'>LEFT</div>
	<div id='center'>CENTER</div>
	<div id='right'>RIGHT</div>
</div>

<h2>web1705</h2>

</body>
</html>