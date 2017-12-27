<%@page import="bean.BoardDao"%>
<%@page import="bean.BoardVo"%>
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
<style>
#title{
   background:linear-gradient(to right, #aaaaaa, #fefefe);
   padding:10px;
   box-sizing:border-box;
   border-radius:7px 7px;
   margin-top:10px;
   margin-bottom:10px;
}

#content{
   border:2px solid #aaaaaa;
   padding:10px;
   box-sizing:border-box;
   width:100%;
   margin-top:10px;
   margin-bottom:10px;
   box-shadow:4px 4px 8px #aaaaaa;
   border-radius:4px;
}
.label{
   display: inline-block;
   width:90px;
   
}
</style>
<script>
function start(){
	var ff = document.frm_board;
	
	var url = "tri_index.jsp?inc=../../board_bean/";
	
	document.getElementById("btnDelete").onclick = function(){
		url += "board_delete.jsp";
		ff.action = url;
		ff.submit();
	}
	
   document.getElementById("btnModify").onclick = function(){
	      url += "board_modify.jsp";
	      ff.action = url;
	      ff.submit();
   }

   document.getElementById("btnRepl").onclick = function(){
	      url += "board_repl.jsp";
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
<jsp:useBean id="vo" class="bean.BoardVo" scope="page"/>
<jsp:setProperty property="*" name="vo"/>
<%
BoardDao dao = new BoardDao();
BoardVo v = dao.view(vo);

%>
<div id='view'>
   <h2 id='title'>게시판 상세보기</h2>
   <div><span class='label'>문서번호 </span> <%=v.getSerial() %></div>
   <div><span class='label'>작성자 </span> <strong><%=v.getWorker() %></strong> 
      <span>[ <%=v.getmDate()%></li> ]</span>
      <span> /  <%=v.getHit() %></span>
   </div>
   <div><span class='label'>제목 </span> <%=v.getSubject() %></div>
   <div id='content'><%=v.getContent().replaceAll("\n","<br/>") %></div>
	   
	<input type='button' value='삭제'  id='btnDelete'>
	<input type='button' value='수정'  id='btnModify'>
	<input type='button' value='댓글'  id='btnRepl'>
	<input type='button' value='목록'  id='btnList'>
</div>

<!-- 각 페이지로 이동할때 전달할 기본 정보 -->
<form name='frm_board' method='post'>
   <input type='hidden' name='serial'       value ="<%=v.getSerial() %>"/>
   <input type='hidden' name='nowPage'  value ="<%=v.getNowPage() %>"/>
   <input type='hidden' name='findStr'     value ="<%=v.getFindStr()%>"/>
   <input type='hidden' name='grp'           value ="<%=v.getGrp() %>"/>
   <input type='hidden' name='deep'         value ="<%=v.getDeep() %>"/>
</form>

<script>start()</script>
</body>
</html>