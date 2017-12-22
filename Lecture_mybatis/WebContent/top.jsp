<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>top.jsp</title>
<style>
a:link{ text-decoration: none;}
a:hover{ text-decoration: underline}

#top_body{
	margin-bottom:10px;
}

#top_center{
	width:100%; height:250px;
	background-image: url(./images/back7.png);
}

#top_login{
	text-align: right;
	color:#ffffff;
}

#top_content{
	margin-top:4px;
	text-align: center;
	font-size:11pt;
}

#top_content>a{
	display:inline-block;
	border:1px solid #aaaaaa;
	padding:2px;
	width:100px;
	border-radius:3px;
	box-shadow:2px 2px 3px #dddddd;
	background-color: #eeeeee
	
}

</style>
</head>
<body>
<%
// 로그인 정보가 기억되어 있는 세션정보를 취득
String sessionID = (String)session.getAttribute("mid");
%>
<div id='top_body'>
	<div id='top_content'>
		<a href='index.jsp?inc_left=./board_myba/board_list.jsp&inc_content=./board_myba/list.jsp'>게시(myBa)</a>
	</div>
</div>
</body>
<script>init();</script>
</html>





