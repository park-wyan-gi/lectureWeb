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

</head>
<body>
<h2>게시판 수정(JSP)</h2>
<%
String findStr = request.getParameter("findStr");
String nowPage = request.getParameter("nowPage");
String serial = request.getParameter("serial");
String subject = request.getParameter("subject");
String content = request.getParameter("content");

Connection conn = new DBConnect().getConn();
PreparedStatement ps = null;
int r =0;
String sql = "";

try{
      sql = "update board set subject=? , content=? where serial=?";
      ps = conn.prepareStatement(sql);
      ps.setString(1, subject);
      ps.setString(2, content);
      ps.setString(3, serial);
      r = ps.executeUpdate();
   }catch(Exception ex){
      out.print(ex.toString());
   }


if(r>0){
   out.print("정성적으로 수정됨....");
}else{
   out.print("수정중 오류 발생....");
}
%>
<p/>
<!-- 각 페이지로 이동할때 전달할 기본 정보 -->
<form name='frm_board' method='post' 
         action='tri_index.jsp?inc=../../board_jsp/board_list.jsp'>
   <input type='hidden' name='serial'       value ="<%=serial%>"/>
   <input type='hidden' name='nowPage'  value ="<%=nowPage %>"/>
   <input type='hidden' name='findStr'     value ="<%=findStr%>"/>
   <input type='submit' value='목록으로'/>
</form>

</body>
</html>