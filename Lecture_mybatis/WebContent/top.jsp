<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>top.jsp</title>
<style>
#top{
	font-size:40px;
	font-weight: bold;
	width:100%;
	text-align: center;
	background-color: #777777;
	color:#eeeeee;
	padding:40px;
	box-sizing:border-box;
	box-shadow:0px 3px 5px #aaaaaa;
}
</style>
</head>
<body>
<%
// 로그인 정보가 기억되어 있는 세션정보를 취득
String sessionID = (String)session.getAttribute("mid");
%>
<div id='top'>
	Mybatis Home Page
</div>
</body>

</html>





