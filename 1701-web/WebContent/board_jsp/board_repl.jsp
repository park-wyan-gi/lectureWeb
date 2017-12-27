<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>board_repl</title>
</head>
<body>
<%
String findStr = request.getParameter("findStr");
String nowPage = request.getParameter("nowPage");
String serial = request.getParameter("serial");
String grp = request.getParameter("grp");
String deep = request.getParameter("deep");
%>
<div id='board'>
   <h2>게시판 댓글 입력(JSP)</h2>
   <form name='frm_board' method='post' 
               action='tri_index.jsp?inc=../../board_jsp/board_repl_result.jsp'>
               
      <label>작성자</label>
      <input type='text' name='worker' value='repl'><br/>
      <label>제목</label>
      <input type='text' name='subject' value='답변)hi.....' size='70'><br/>
      <label></label>
      <textarea rows="15" cols="72" name='content'>답변)수고하세요~~</textarea>
      <br/>
      <label></label>
      <input type='submit' value='댓글 작성'>
      <input type='hidden' name='findStr'     value="<%=findStr %>"/>
      <input type='hidden' name='nowPage'  value="<%=nowPage %>"/>
      <input type='hidden' name='serial'        value="<%=serial %>"/>
      <input type='hidden' name='grp'        value="<%=grp %>"/>
      <input type='hidden' name='deep'        value="<%=deep %>"/>
      
</form>

</body>
</html>