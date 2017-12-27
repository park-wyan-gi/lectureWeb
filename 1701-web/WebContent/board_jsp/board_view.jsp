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
	
	var url = "tri_index.jsp?inc=../../board_jsp/";
	
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

<%
String findStr = request.getParameter("findStr");
String nowPage = request.getParameter("nowPage");
String serial = request.getParameter("serial");

Connection conn = new DBConnect().getConn();
PreparedStatement ps = null;
ResultSet rs = null;
String sql = "";
BoardVo v = new BoardVo();
try{
	//hit수 증가
	sql = "update board set hit = hit+1 where serial=?";
	ps = conn.prepareStatement(sql);
	ps.setString(1, serial);
	ps.executeUpdate();
	
	sql = "select * from board where serial = ?";
	ps = conn.prepareStatement(sql);
	ps.setString(1, serial);
	rs = ps.executeQuery();
	rs.next();

	v.setSerial(rs.getInt("serial"));
	v.setmDate(rs.getDate("mDate") + "");
	v.setWorker(rs.getString("worker"));
	v.setSubject(rs.getString("subject"));
	v.setContent(rs.getString("content"));
   v.setHit(rs.getInt("hit"));
   v.setGrp(rs.getInt("grp"));
   v.setDeep(rs.getString("deep"));
}catch(Exception ex){
	out.print(ex.toString());
}

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
   <input type='hidden' name='serial'        value ="<%=v.getSerial() %>"/>
   <input type='hidden' name='grp'           value ="<%=v.getGrp() %>"/>
   <input type='hidden' name='deep'         value ="<%=v.getDeep() %>"/>
   <input type='hidden' name='nowPage'  value ="<%=nowPage %>"/>
   <input type='hidden' name='findStr'     value ="<%=findStr%>"/>
</form>

<script>start()</script>
</body>
</html>