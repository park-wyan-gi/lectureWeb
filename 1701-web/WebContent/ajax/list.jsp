<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="bean.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
.items { line-height: 140% }
.items > span{ display: inline-block;}
.serial { width:70px;}
.worker { width:100px;}
.subject{ width:300px;}
</style>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
String findStr = request.getParameter("findStr");

Connection conn = new DBConnect().getConn();
PreparedStatement ps = null;
ResultSet rs = null;
try{
	String sql = "select serial, nvl(worker, '') worker, "
			   + " nvl(subject, '') subject"
			   + " from boardbasic "
               + " where subject like ? or content like ?";

	ps = conn.prepareStatement(sql);
	ps.setString(1, "%" + findStr + "%");
	ps.setString(2, "%" + findStr + "%");
	
	rs = ps.executeQuery();
	
	while(rs.next()){
		out.print("<div class='items'>");
		out.print("<span class='serial'>" + rs.getInt("serial")     + "</span>");
		out.print("<span class='worker'>" + rs.getString("worker")  + "</span>");
		out.print("<span class='subject'>"+ rs.getString("subject") + "</span>");
		out.print("</div>");
	}
	
}catch(Exception ex){
	out.print(ex.toString());
}

%>

</body>
</html>











