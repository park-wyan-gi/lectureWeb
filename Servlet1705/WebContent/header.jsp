<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
#header{
	text-align: right;
}
</style>
<script>
function header_init(){
	var btnLogin =document.getElementById("btnLogin");
	var btnLogout = document.getElementById("btnLogout");
	
	if(btnLogin != null ){
		btnLogin.onclick = function(){
			location.href = '/Servlet1705/member/login.jsp';
		}
	}
	if(btnLogout != null){
		btnLogout.onclick = function(){
			location.href = '/Servlet1705/member/logout.jsp';
		}
		
	}
}
</script>
</head>
<body>
<div id='header'>
	<c:if test="${sId==null }">
	[손님이시군요..로그인하셔야 합니다. ^^]
		<input type='button' value='로그인' id='btnLogin'/>
	</c:if>
	<c:if test="${sId!=null }">
		[${sId }] 님 방가
		<input type='button' value='로그아웃' id='btnLogout'/>
	</c:if>
</div>
<script>header_init()</script>
</body>
</html>