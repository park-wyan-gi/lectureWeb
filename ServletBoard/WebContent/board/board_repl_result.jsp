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
<title>board_repl_result.jsp(Serlet)</title>
</head>
<body>
<h2>답변 저장(JSP)</h2>
${rMap['msg']}
<p/>
<form name='frm_board' method='post'  action = "list.do" >
      <input type='text' name='findStr'     value="${rMap['findStr'] }"/>
      <input type='text' name='nowPage'  value="${rMap['nowPage'] }"/>
      <input type='submit' value='목록으로' />
</form>

</body>
</html>

