<%@page import="java.util.ArrayList"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 
	// Connection Pool Example
	// Tomcat + Oralce 11gXE
	// author : pwg
	// date : 2014.12
 -->

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Connection Pool Example</title>
</head>
<body>
	<% // 연결 정보만 표시
		Connection conn = null;
		try {
			Context context = new InitialContext();
			DataSource ds = (DataSource) context
					.lookup("java:comp/env/jdbc/OracleDB");
			conn = ds.getConnection();
			out.print("<h3>Data base Connection success !!!!");

		} catch (Exception ex) {
			out.print("<h3>Connect Fail:<p/>");
			out.print(ex.toString());
		}
	%>
	<h3>Java Bean Connection Pool</h3>

</body>
</html>