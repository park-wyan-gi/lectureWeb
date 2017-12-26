<%@page import="java.util.ArrayList"%>
<%@page import="board.BoardMyba"%>
<%@page import="board.BoardVo"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>community(list)</title>
<link rel='Stylesheet' type='text/css' href='./css/board.css'></link>
<script src='./js/board.js'></script>

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

<div id='board_body'>

	<h1>Community List Mybatis (${vo.part })</h1>
	
	<div style="width:100%">
		<input type='button' value='게시물입력' id='btnInsert'>
		<form name='community_form' method='post' id="community_form">
			<input type='text' name='find' id='find'
					value="${param.findStr }">
			<input type='button' value='검색'  id='btnFind'>
			<input type='hidden' name='nowPage'>
		</form>
	</div>
	<div style='text-align:right;font-size:10pt'>
		총 건수 : ${dao.totSize }
	</div>
	
	<div>
		<div id='list_title'>
			<div class='item1'>NO</div>
			<div class='item2'>제목</div>
			<div class='item3'>작성자</div>
			<div class='item4'>작성일</div>
			<div class='item5'>조회수</div>
		</div>
		
		
		<div class='list_item_block'>
			<c:forEach var='data' items="${list }">
				<div class='item1'>${data.serial }</div>
				<div class='item2'>
					<a href='#' onclick = 'view(${data.serial})'>
						${data.subject }
					</a>
				</div>
				<div class='item3'>${data.worker }</div>
				<div class='item4'>${data.mdate }</div>
				<div class='item5'>${data.hit }</div>
			</c:forEach>
		</div>
		
	</div>
	
	<div id='list_location_btn'><!-- 페이지 분리 영역 -->
		<c:if test="${dao.nowBlock > 1 }">
			<input type='button' value='맨첨' onclick='goPage(1)' class='btnLeft'>
			<input type='button' value='이전' onclick='goPage(${dao.startPage-1})' class='btnLeft'>
		</c:if>
		
		<c:forEach var='p' begin="${dao.startPage }" end = "${dao.endPage }">
			<input type='button' value='${p }' class='btnGo' onclick='goPage(${p})'>
		</c:forEach>
		
		<c:if test="${dao.nowBlock < dao.totBlock }">
			<input type='button' value='다음' onclick='goPage(${dao.endPage+1})' class='btnRight'>
			<input type='button' value='맨끝' onclick='goPage(${dao.totPage})' class='btnRight'>
		</c:if>
	</div>

	
</div>
<script>init()</script>
</body>
</html>







