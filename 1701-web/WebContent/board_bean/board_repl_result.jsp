<%@page import="bean.BoardDao"%>
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
<jsp:useBean id="vo" class="bean.BoardVo" scope="page"/>
<jsp:setProperty property="*" name="vo"/>

<%
BoardDao dao = new BoardDao();
int r = dao.repl(vo);

if(r>0) {
		out.print("답변글이 등록되었습니다.");
}else{
		out.print("<font color='red'>입력중 오류 발생</font>");
}
%>
<p/>
<form name='frm_board' method='post' 
         action = "tri_index.jsp?inc=../../board_bean/board_list.jsp" >
      <input type='hidden' name='findStr'     value="<%=vo.getFindStr()%>"/>
      <input type='hidden' name='nowPage'  value="<%=vo.getNowPage() %>"/>
      <input type='hidden' name='serial'        value="<%=vo.getSerial() %>"/>
      <input type='submit' value='목록으로' />
</form>

</body>
</html>

