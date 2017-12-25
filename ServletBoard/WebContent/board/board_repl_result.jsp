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
${msg}
<p/>
<form name='frm_board' method='post'  action = "list.do" >
      <input type='hidden' name='findStr'     value="${obj.findStr }"/>
      <input type='hidden' name='nowPage'  value="${obj.nowPage }"/>
      <input type='hidden' name='serial'        value="${obj.serial }"/>
      <input type='hidden' name='grp'           value="${obj.grp }"/>
      <input type='hidden' name='deep'         value="${obj.deep }"/>
      <input type='submit' value='목록으로' />
</form>

</body>
</html>

