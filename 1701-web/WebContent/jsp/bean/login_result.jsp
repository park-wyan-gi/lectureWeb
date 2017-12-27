<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>login_result.jsp</title>
</head>
<body>
<jsp:useBean id="m" class="bean.Login" scope="page"/>
<jsp:setProperty property="*" name="m"/>
<h3>Result</h3>
<ul>
   <li><%=m.getId() %></li>
   <li><%=m.getPwd() %></li>
</ul>
</body>
</html>