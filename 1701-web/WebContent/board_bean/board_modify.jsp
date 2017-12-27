<%@page import="bean.BoardVo"%>
<%@page import="bean.BoardDao"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="bean.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>board_modify</title>
<script>
function start(){
   var ff = document.frm_board;
   var url = "tri_index.jsp?inc=../../board_bean/";
   
   document.getElementById("btnView").onclick = function(){
      //history.back();
      url += "board_view.jsp";
      ff.action = url;
      ff.submit();
   }
   document.getElementById("btnList").onclick = function(){
         url += "board_list.jsp";
         ff.action = url;
         ff.submit();
   }
}
</script>
</head>
<body>
<h2>게시판 수정</h2>
<jsp:useBean id="vo" class="bean.BoardVo" scope="page"/>
<jsp:setProperty property="*" name="vo"/>
<%
BoardDao dao = new BoardDao();
BoardVo v = dao.selectOne(vo);
%>
<div id='board'>
   <h2>게시판 수정(JSP)</h2>
   <form name='frm_board' method='post' 
               action='tri_index.jsp?inc=../../board_bean/board_modify_result.jsp'>
               
      <label>작성자</label>
      <input type='text' name='worker' value='<%=v.getWorker() %>'  readonly><br/>
      <label>제목</label>
      <input type='text' name='subject' value='<%=v.getSubject() %>' size='70'><br/>
      <label></label>
      <textarea rows="15" cols="72" name='content'><%=v.getContent() %></textarea>
      <br/>
      <label></label>
      <input type='submit' value='수정'>
      <input type='button' value='상세보기' id='btnView'>
      <input type='button' value='목록으로' id='btnList'>
      
      <input type='hidden' name='serial' value='<%=v.getSerial()%>'/>
      <input type='hidden' name='findStr' value='<%=v.getFindStr()%>'/>
      <input type='hidden' name='nowPage' value='<%=v.getNowPage()%>'/>
   </form>
</div>
<script>start()</script>
</body>
</html>