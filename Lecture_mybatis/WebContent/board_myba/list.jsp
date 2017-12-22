<%@page import="java.util.ArrayList"%>
<%@page import="board.BoardMyba"%>
<%@page import="board.BoardVo"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>community(list)</title>
<link rel='Stylesheet' type='text/css' href='./board_myba/board.css'></link>
<script src='./board_myba/board.js'></script>

<style>
#board_body{
	margin-bottom:20px;
}
#list_title{
	width:100%;
	background-color: #333333;
	padding:3px;
	margin-top:7px;
	color:#ffffff;
}
#list_title>div{
	display:inline-block;
	font-size:12px;
	line-height: 130%;
	padding:2px;

}
.list_item_block>div{
	display:inline-block;
	font-size:12px;
	line-height: 130%;
 	background-color: #eeeeee;
 	padding:2px;
 }

.item1{ width:50px; text-align: center}
.item2{ width:410px; text-align: left}
.item3{ width:80px; text-align: center}
.item4{ width:100px; text-align: center}
.item5{ width:60px; text-align: center;}

#list_location_btn{
	text-align: center;
	margin-top:15px;
}

#btnInsert,#community_form{
	display:inline-block;
}

#community_form{ margin-left:450px;margin-bottom:10px;}

.btnGo{
	border-radius:20px;
}
.btnLeft{
	border-top-left-radius:20px;
	border-bottom-left-radius:20px;
	font-size:9pt;
}
.btnRight{
	border-top-right-radius:20px;
	border-bottom-right-radius:20px;
	font-size:9pt;
}

.btnLeft:hover, .btnRight:hover, .btnGo:hover{
	background-color:#aaaaaa;
}

</style>
</head>
<body>
<jsp:useBean id="boardVo" class="board.BoardVo"/>
<jsp:setProperty property="*" name="boardVo"/>
<%
// 검색어 세션처리
if(request.getMethod().equals("POST")){
	session.setAttribute("find", boardVo.getFind());
}else{
	if(session.getAttribute("find") != null){
		boardVo.setFind((String)session.getAttribute("find"));
	}
}
// 페이지 정보 유지
if(request.getParameter("nowPage")==null){
	if(session.getAttribute("nowPage") != null)
		boardVo.setNowPage((Integer)session.getAttribute("nowPage"));
}else{
	session.setAttribute("nowPage", boardVo.getNowPage());
}

//게시판의 종류 선별
String part = "notice";
if(!boardVo.getPart().equals("")) part = boardVo.getPart();

BoardMyba board = new BoardMyba();
board.setVo(boardVo);
board.setNowPage(boardVo.getNowPage());

ArrayList<BoardVo> v = board.list();

%>

<div id='board_body'>

	<h1>Community List Mybatis (<%=part %>)</h1>
	
	<div style="width:100%">
		<input type='button' value='게시물입력' id='btnInsert'>
		<form name='community_form' method='post' id="community_form">
			<input type='text' name='find' id='find'
					value="<%=boardVo.getFind()%>">
			<input type='button' value='검색'  id='btnFind'>
			<input type='hidden' name='nowPage'>
		</form>
	</div>
	<div style='text-align:right;font-size:10pt'>
		총 건수 : <%=board.getTotSize() %>
	</div>
	
	<div>
		<div id='list_title'>
			<div class='item1'>NO</div>
			<div class='item2'>제목</div>
			<div class='item3'>작성자</div>
			<div class='item4'>작성일</div>
			<div class='item5'>조회수</div>
		</div>
		
		<% for(int i=0 ; i<v.size() ; i++){ 
			BoardVo vo = v.get(i);
			int pad = (vo.getDeep().split("-")).length;
			String temp="";
			for(int j=2; j<pad*2 ; j++) temp += "&nbsp;";
			if(!temp.equals("")) temp += "└";
			
		%>
		<div class='list_item_block'>
			<div class='item1'><%=vo.getSerial() %></div>
			
			<div class='item2'>
				<a href='#' onclick = 'view(<%=vo.getSerial()%>)'>
					<%=temp%><%=vo.getSubject() %>
				</a></div>
				
				
			<div class='item3'><%=vo.getMid() %></div>
			<div class='item4'><%=vo.getMdate() %></div>
			<div class='item5'><%=vo.getHit() %></div>
		</div>
		<%} %>
	</div>
	<div id='list_location_btn'><!-- 페이지 분리 영역 -->
		<%if(board.getNowBlock()>1){ %>
			<input type='button' value='맨첨' onclick='goPage(1)' class='btnLeft'>
			<input type='button' value='이전' onclick='goPage(<%=board.getStartPage()-1%>)' class='btnLeft'>
		<%} %>
		
		<%for(int p=board.getStartPage() ; p<=board.getEndPage() ; p++){ %>
			<input type='button' value='<%=p %>' class='btnGo' onclick='goPage(<%=p%>)'>
		<%} %>
		
		<%if(board.getNowBlock() < board.getTotBlock()){ %>
			<input type='button' value='다음' onclick='goPage(<%=board.getEndPage()+1%>)' class='btnRight'>
			<input type='button' value='맨끝' onclick='goPage(<%=board.getTotPage()%>)' class='btnRight'>
		<%} %>
	</div>

	
</div>
<script>init()</script>
</body>
</html>







