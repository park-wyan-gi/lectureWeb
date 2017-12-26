<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>form_tag</title>
</head>
<body>
<h1>form tag</h1>

<h2>로그인</h2>

<%
request.setCharacterEncoding("utf-8");
String mid = "";
String pwd ="";

if( request.getMethod().equals("POST") ){
	mid = request.getParameter("mid");
	pwd = request.getParameter("pwd");
}
%>

<form method='post'>
	<label for='mid'>아이디</label>
	<input type='text' id='mid' name='mid' value='<%=mid%>'/>
	<br/>
	<label>암 호</label>
	<input type='password' name='pwd' id='pwd' value = '<%=pwd%>'/>
	<p/>
	<input type='submit' value='로그인' />


</form>

<%
out.print("<ul>");
out.print("<li>" + mid + "</li>");
out.print("<li>" + pwd + "</li>");
out.print("</ul>");
%>


</body>
</html>












