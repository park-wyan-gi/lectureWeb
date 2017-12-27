<?xml version='1.0' encoding='utf-8'?>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="bean.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
<board>
<%
String findStr = "";
if(request.getParameter("findStr") != null ){
	findStr = request.getParameter("findStr");
}
Connection conn = new DBConnect().getConn();
PreparedStatement ps=null;
ResultSet rs = null;
try{
String sql = "select * from boardbasic where subject like ? or content like ?";
ps = conn.prepareStatement(sql);
ps.setString(1, "%" + findStr + "%");
ps.setString(2, "%" + findStr + "%");

rs = ps.executeQuery();

while(rs.next()){ %>
	<item>
		<serial><%=rs.getInt("serial") %></serial>
		<mdate><%=rs.getDate("mdate") %></mdate>
		<subject><%=rs.getString("subject") %></subject>
		<worker><%=rs.getString("worker") %></worker>
		<hit><%=rs.getInt("hit") %></hit>
	</item>

<%}

}catch(Exception ex){
	out.print(ex.toString());
}
%>
</board>










