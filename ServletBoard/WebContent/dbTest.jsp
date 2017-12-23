<%@page import="java.sql.Connection"%>
<%@page import="bean.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>Oracle Database Connecting...</h3>
<%
DBConnect con = new DBConnect();
Connection conn = con.getConn();
if(conn==null){
	out.print("connection is null");
}else{
	out.print("connection is good");
}
%>
</body>
</html>