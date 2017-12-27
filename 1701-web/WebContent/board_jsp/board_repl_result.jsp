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
<title>board_repl_result.jsp</title>
</head>
<body>
<h2>답변 저장(JSP)</h2>
<%
String findStr = request.getParameter("findStr");
String nowPage = request.getParameter("nowPage");
String serial = request.getParameter("serial");
String grp = request.getParameter("grp");
String deep = request.getParameter("deep");
String worker = request.getParameter("worker");
String subject = request.getParameter("subject");
String content = request.getParameter("content");

Connection conn = new DBConnect().getConn();
PreparedStatement ps = null;
int r = 0;
String sql = "insert into board(serial, mdate, worker, subject, content, hit, grp, deep )"
                + " values(seq_board_serial.nextval, sysdate, ?, ?, ?, 0, ?, " 
                + " ? || '-' || seq_board_serial.currval)";
try{
	   ps = conn.prepareStatement(sql);
	   ps.setString(1, worker);
	   ps.setString(2, subject);
	   ps.setString(3, content);
	   ps.setString(4, grp);
	   ps.setString(5, deep);
	   
	   r = ps.executeUpdate();
}catch(Exception ex){
	r = -1;
	out.print(ex.toString());
}finally{
	if(r>0) {
		out.print("답변글이 등록되었습니다.");
	}else{
		out.print("<font color='red'>입력중 오류 발생</font>");
	}
}

%>
<p/>
<form name='frm_board' method='post' 
         action = "tri_index.jsp?inc=../../board_jsp/board_list.jsp" >
      <input type='hidden' name='findStr'     value="<%=findStr%>"/>
      <input type='hidden' name='nowPage'  value="<%=nowPage %>"/>
      <input type='hidden' name='serial'        value="<%=serial %>"/>
      <input type='submit' value='목록으로' />
</form>

</body>
</html>

