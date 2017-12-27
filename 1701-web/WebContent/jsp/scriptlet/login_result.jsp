<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="bean.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@page import="oracle.jdbc.driver.DBConversion"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>login_result.jsp</title>
<script>
window.onload=function(){
	var btn = document.getElementById('btnHome');
	btn.onclick = function(){
		location.href='login.jsp';
	}
}
</script>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");

String id = request.getParameter("id");
String pwd = request.getParameter("pwd");

Connection conn = new DBConnect().getConn();
String sql = "select userid, userpwd from member " 
           + " where userid=? and userpwd=? ";
PreparedStatement ps = conn.prepareStatement(sql);
ps.setString(1, id);
ps.setString(2, pwd);

ResultSet rs = ps.executeQuery();

if(rs.next()){
	session.setAttribute("id",id);
	out.print("session에 id가 정상적으로 저장됨.");
}else{
	out.print("<script>alert('사용자 정보가 틀림')</script>");
}
%>
<input type='button' value='홈으로' id='btnHome'/>

</body>
</html>