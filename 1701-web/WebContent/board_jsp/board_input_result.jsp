<%@page import="bean.DBConnect"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang='ko'>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name='viewport' content='width=device-width'>
<title>board_input_result.jsp</title>
</head>
<body>
<%
String worker = request.getParameter("worker");
String subject = request.getParameter("subject");
String content = request.getParameter("content");
Connection conn = null;
PreparedStatement ps=null;
int rs = 0; // 정성적으로 저장된 경우 0보다 큰값.
String sql = "insert into board(serial, mdate, worker, subject, content, hit, grp, deep) "
                 + " values(seq_board_serial.nextval, sysdate, ?, ?, ?, 0, " 
                 + " seq_board_serial.currval, seq_board_serial.currval) ";
try{
	conn = new DBConnect().getConn();
	ps = conn.prepareStatement(sql);
	ps.setString(1, worker);
	ps.setString(2, subject);
	ps.setString(3, content);
	
	rs = ps.executeUpdate();
	
}catch(Exception ex){
	rs = -1;
	out.print(ex.toString());
}

if(rs>0){
	out.print("내용이 정상적으로 입력되었습니다.");
}else{
	out.print("<font color='red'>저장중 오류 발생</font>");
}
%>
<p/>
<a href='tri_index.jsp?inc=../../board_jsp/board_list.jsp'>조회화면으로</a>

</body>
</html>