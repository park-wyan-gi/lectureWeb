<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String id = (String)session.getAttribute("id");

if(id == null){
   out.print("<a href='login.jsp' target='rightFrame'>로그인</a>");
}else{
	out.print(id + " 님 방가.....");
}

%>
</body>
</html>