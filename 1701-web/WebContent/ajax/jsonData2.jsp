<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="bean.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.net.ConnectException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id='data'>
<%
Connection conn = new DBConnect().getConn();
PreparedStatement ps = null;
ResultSet rs = null;

try{
	String sql = "select * from board";
	ps = conn.prepareStatement(sql);
	rs = ps.executeQuery();
	StringBuffer sb = new StringBuffer();
	sb.append("[");
	while(rs.next()){
		sb.append("{'serial' : '" + rs.getInt("serial")     + "'," );
		sb.append("'worker'  : '" + rs.getString("worker")  + "'," );
		sb.append("'subject' : '" + rs.getString("subject") + "'," );
		sb.append("'mdate'   : '" + rs.getDate("mdate")     + "'," );
		sb.append("'hit'     : '" + rs.getInt("hit")        + "'},");
	}
	sb.append("]");
	
	String temp = sb.toString();
	temp = temp.replaceAll("'", "\"");
	temp = temp.replace(",]", "]");
	
	out.print(temp);
}catch(Exception ex){
	out.print(ex.toString());
}

%>
</div>

</body>
</html>









