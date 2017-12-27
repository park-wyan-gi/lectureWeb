<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>selector2</title>
<style>
input:focus{ background-color:#eeeeff}
</style>
<script src = '../jq_lib/jquery-3.2.1.min.js'></script>
<script>
$().ready(
	function(){
		$("input:nth-child(3n-1)").css("color","#ff0000");

	}	
);
</script>
</head>
<body>
<div>
<input type='text' value='abc1'><br/>
<input type='text' value='abc2'><br/>
<input type='text' value='abc3'><br/>
<input type='text' value='abc4'><br/>
<input type='text' value='abc5'><br/>
<input type='text' value='abc6'><br/>
<input type='text' value='abc7'><br/>
<input type='text' value='abc8'><br/>
<input type='text' value='abc9'><br/>
</div>
</body>
</html>