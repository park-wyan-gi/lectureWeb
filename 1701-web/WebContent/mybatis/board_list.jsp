<%@page import="myba.BoardFactory"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="java.util.List"%>
<%@page import="bean.BoardVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
#title{
	background-color: #dddddd;
	padding:5px;
	box-sizing: border-box;
}
#title > span, .item > span { display: inline-block;}
.serial  { width: 70px;}
.worker  { width: 100px;}
.subject { width: 280px;}
.mdate   { width: 220px;}
.hit     { width: 70px;}

.item:hover{background-color: #cccccc; cursor: pointer;}
a{text-decoration:none;}
</style>
</head>
<body>
<%request.setCharacterEncoding("utf-8"); %>
<h2>myBatis로 만든 게시판 LIST</h2>
<%
String findStr = "";
if(request.getParameter("findStr") != null) findStr = request.getParameter("findStr");

%>

<form name='frm' method='post'>
	<input type='text' name='findStr' value='<%=findStr %>'>
	<input type='submit' value='검색'>
	<input type='button' value='입력' 
		onclick="location.href='board_input.jsp'">
</form>
<hr/>
<div id='title'>
	<span class='serial'>순번</span>
	<span class='worker'>작성자</span>
	<span class='subject'>제목</span>
	<span class='mdate'>작서일</span>
	<span class='hit'>조회수</span>
</div>
<%
if(request.getMethod().equals("GET")) return;

SqlSession bf = BoardFactory.getFactory().openSession();

BoardVo v = new BoardVo();
v.setFindStr(findStr);

List<BoardVo> data = bf.selectList("member.brd_list", v);
String str = "<div class='item'>"
           + "<span class='serial'>%d</span>"
		       + "<span class='worker'>%s</span>"
		       + "<span class='subject'>"
		       + "    <a href='board_view.jsp?serial=%d'>%s</a></span>"
		       + "<span class='mdate'>%s</span>"
		       + "<span class='hit'>%s</span></div>";
		       
for(int i=0 ; i<data.size() ; i++){
	String temp = 
			String.format(str,
					data.get(i).getSerial(), data.get(i).getWorker(), 
					data.get(i).getSerial(),
					data.get(i).getSubject(), data.get(i).getmDate(), data.get(i).getHit() );
	out.print(temp);
}

%>
</body>
</html>




