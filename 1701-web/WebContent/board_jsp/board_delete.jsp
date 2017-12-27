<%@page import="java.sql.PreparedStatement"%>
<%@page import="bean.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>board_delete.jsp</title>
</head>
<body>
<h2>게시판 삭제</h2>
<%
String findStr = request.getParameter("findStr");
String nowPage = request.getParameter("nowPage");
String serial = request.getParameter("serial");

Connection conn = new DBConnect().getConn();
PreparedStatement ps = null;
String sql = "delete from board where serial=?";
int r=0;//삭제 결과

try{
	ps = conn.prepareStatement(sql);
	ps.setString(1, serial);
	r = ps.executeUpdate();
}catch(Exception ex){
	r = -1;
	out.print(ex.toString());
}

if(r>0){
	out.print("정성적으로 삭제됨....");
}else{
	out.print("삭제중 오류 발생....");
}
%>
<p/>
<form name='frm_board' method='post' 
      action = 'tri_index.jsp?inc=../../board_jsp/board_list.jsp'>
   <input type='hidden' name='serial'       value ="<%=serial %>"/>
   <input type='hidden' name='nowPage'  value ="<%=nowPage %>"/>
   <input type='hidden' name='findStr'     value ="<%=findStr%>"/>
   <input type='submit' value='목록으로'/>    
</form>
</body>
</html>