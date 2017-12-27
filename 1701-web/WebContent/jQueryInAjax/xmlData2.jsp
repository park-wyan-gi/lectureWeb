<?xml version='1.0' encoding='utf-8'?>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="bean.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String findStr = "";
if(request.getParameter("findStr") != null){
	findStr = request.getParameter("findStr");
}
Connection conn = new DBConnect().getConn();
PreparedStatement ps = null;
ResultSet rs = null;
StringBuilder sb = new StringBuilder();
sb.append("<members>");
try{
	String sql = "select * from member where userid like ?";
	ps = conn.prepareStatement(sql);
	ps.setString(1, "%"+findStr+"%");
		
	rs = ps.executeQuery();
	String temp=null;
	while(rs.next()){
		temp = String.format("<member><mid>%s</mid><pwd>%s</pwd></member>", 
				                  rs.getString("userid"), rs.getString("userpwd"));
		sb.append(temp);
	}
	sb.append("</members>");
	temp = sb.toString();
	out.print(temp);
}catch(Exception ex){
	out.print(ex.toString());
}
%>
    