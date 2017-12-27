<%@page import="bean.BoardDao"%>
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
<h2>게시판 삭제(bean)</h2>
<jsp:useBean id="vo" class="bean.BoardVo" scope="request"/>
<jsp:setProperty property="*"  name="vo"/>
<%
BoardDao dao = new BoardDao();
int r = dao.delete(vo);

if(r>0){
	out.print("정성적으로 삭제됨....");
}else{
	out.print("삭제중 오류 발생....");
}
%>
<p/>
<form name='frm_board' method='post' 
      action = 'tri_index.jsp?inc=../../board_bean/board_list.jsp'>
   <input type='hidden' name='serial'       value ="<%=vo.getSerial() %>"/>
   <input type='hidden' name='nowPage'  value ="<%=vo.getNowPage() %>"/>
   <input type='hidden' name='findStr'     value ="<%=vo.getFindStr()%>"/>
   <input type='submit' value='목록으로'/>    
</form>
</body>
</html>