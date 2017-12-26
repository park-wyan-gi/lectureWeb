<%@page import="board.BoardVo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="jdk.nashorn.internal.runtime.arrays.ArrayLikeIterator"%>
<%@page import="board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src = 'http://code.jquery.com/jquery-3.2.1.min.js' ></script>
<script>
$(document).ready(function(){
	$('#brd_list #frm_brd').css('overflow','hidden');
	$('#brd_list #btnInsert').css('float','left');
	$('#brd_list #findZone').css('float','right');
	
	//제목부분
	$('#brd_list #title').css({
		'background-color':'#888888',
		'border-top'      :'1px solid #666666',
		'border-bottom'   :'2px solid #444444',
		'margin-top'      :'5px',
		'padding'         :'3px',
		'font-weight'     :'bolder'
	});
	
	$('#brd_list span').css({
		'display' : 'inline-block'
	});
	
	$('#brd_list .items').hover(
			function(obj){//mouse over
				$(this).css('background-color','#eeeeee');
			}, 
			function(obj){//mouse out
				$(this).css('background-color','');
			}
	);
	
	$('#brd_list a').css('text-decoration','none');
	
	//각 항목
	$('#brd_list .no').css('width', '50px');
	$('#brd_list .subject').css('width', '330px');
	$('#brd_list .worker').css('width', '80px');
	$('#brd_list .mdate').css('width', '90px');
	$('#brd_list .hit').css('width', '80px');
	
	//자료추가 버튼이 클릭된 경우
	$('#brd_list #btnInsert').click(function(){
		$url = "index.jsp?inc=./board/new_list.jsp"
				+ "&subInc=./board/insert.jsp";
		location.href=$url;
	});
	
	//검색 버튼 클릭시
	$('#brd_list #btnFind').click(function(){
		$frm = this.form;
		$frm.nowPage.value = 1;
		$frm.submit();
	})
	
	$('#brd_list #page').css('text-align','center');
})

function movePage(nowPage){
	if(document.frm_brd == null) return;
	var frm = document.frm_brd;
	frm.nowPage.value = nowPage;
	frm.submit();
}

function go(serial){
	var frm = document.frm_brd;
	frm.serial.value = serial;
	frm.action = 'index.jsp?inc=./board/new_list.jsp'
			     + '&subInc=./board/view.jsp';
	frm.submit();
}
</script>
</head>
<body>
<%
String findStr = "";
int nowPage = 1;
if(request.getParameter("findStr") != null){
	findStr = request.getParameter("findStr");
}
if(request.getParameter("nowPage") != null){
	nowPage = Integer.parseInt(request.getParameter("nowPage"));
}
%>
<div id='brd_list'>
	<h3>자료실 조회</h3>
	<form name='frm_brd' method='post' id='frm_brd'>
		<input type='button' value='자료추가' name='btnInsert' id='btnInsert'>
		
		<div id='findZone'>
			<input type='text' name='findStr' value="<%=findStr%>">
			<input type='button' value='검색' name='btnFind' id='btnFind'/>
		</div>
		<input type='hidden' name='nowPage' value="<%=nowPage%>"/>
		<input type='hidden' name='serial' />
	</form>
	
	<div id='title'>
		<span class='no'>No</span>
		<span class='subject'>제 목</span>
		<span class='worker'>작성자</span>
		<span class='mdate'>작성일</span>
		<span class='hit'>조회수</span>
	</div>
	<%
		BoardDao dao = new BoardDao();
		ArrayList<BoardVo> list = dao.select(findStr, nowPage);
		
		request.setAttribute("dao",dao);
		request.setAttribute("list",list);
	%>
		<c:forEach var='v' items='${list }'>
			<div class='items'>
				<span class='no'>${v.serial}</span>
				<span class='subject'>
					<a href='#' onclick='go(${v.serial})'>
							${v.subject } (${v.cnt }) 
					</a>
				
				</span>
				<span class='worker'>${v.worker }</span>
				<span class='mdate'>${v.mdate }</span>
				<span class='hit'>${v.hit }</span>
			</div>
		</c:forEach>
		<hr/>
		<div id='page'>
		<c:if test="${dao.nowBlock>1 }">
			<input type='button' value='|←' name='btnFirst'  onclick = 'movePage(1)'>
			<input type='button' value='←'  name='btnPrev'  onclick = 'movePage(${dao.startPage-1})'>
		</c:if>

		<c:forEach var='i' begin="${dao.startPage }" end="${dao.endPage }">
			<input type='button' value='${i }' name='btn1' ${nowPageFlag } 
						onclick = 'movePage(${i})' ${(i==dao.nowPage) ? "disabled" :"" }	>
		</c:forEach>
		
		<c:if test = "${dao.nowBlock < dao.totBlock }">			
			<input type='button' value='→'  name='btnNext'  onclick = 'movePage(${dao.endPage+1})'>
			<input type='button' value='→|' name='btnLast'   onclick = 'movePage(${dao.totPage})'>
		</c:if>
	</div>
	
</div>
</body>
</html>














