<%@page import="java.sql.Connection"%>
<%@page import="bean.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>bean_test.jsp</title>
</head>
<body>
<%
DBConnect db = new DBConnect();
Connection conn  = db.getConn();

Connection conn2 = new DBConnect().getConn();
%>

<jsp:useBean id="db2" class='bean.DBConnect' scope='page'/>

<%
Connection conn3 = db2.getConn();
%>



</body>
</html>








