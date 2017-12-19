<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	#brd_list{
		display:inline-block;
		margin:0px auto;
		text-align:left;
	}
</style>
</head>
<body>
<div id='brd_list'>
	<h3>자료실</h3>
	<form name='frm_brd' method='post' action=''>
		<input type='button' value='자료추가' name='btnInsert' 
		       id='btnInsert'/>
		       
		<input type='hidden' name='serial' />		       
	</form>
	<div id='title'>
		<span class='subject'>
			제 목
		</span>
	</div>
	<div id='list'>
		<span class='subject'>	
			<a href='#' onclick='go(100)'>상세보기 테스트</a>
		</span><br/>	
		<span class='subject'>	
			<a href='#' onclick='go(200)'>상세보기 테스트</a>
		</span>	
	</div>			
</div>

<script>
var frm = document.frm_brd;
var url = 'index.jsp?inc=./board/';

frm.btnInsert.onclick = function(){
	frm.action = 'insert.do';	
	frm.submit();
}
function go(serial){
	frm.serial.value = serial;
	frm.action = url + 'view.jsp';
	frm.submit();
}
</script>	
	
</body>
</html>