<%@page import="board.BoardVo"%>
<%@page import="board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src = 'http://code.jquery.com/jquery-3.2.1.min.js' ></script>
<script>
$(document).ready(function(){
	$('#brd_view label').css({
		'display':'inline-block',
		'width'  :'50px',
		'padding' : '4px',
		'margin-bottom' : '2px'
	});
	$('#brd_view span').css({
		'display':'inline-block',
		'width'  :'50px',
		'padding' : '4px'
	});
	
	$('#brd_view .worker').css({
		'width':'210px',
		'height' : '22px',
		'background-color' : '#eeeeee'
	});
	$('#brd_view .subject').css({
		'width':'580px',
		'background-color' : '#eeeeee'
	});
	$('#brd_view .content').css({
		'width'      :'650px',
		'min-height' : '100px',
		'background-color' : '#eeeeee',
		'border-radius' : '6px',
		'padding'       : '20px',
		'box-sizing'    : 'border-box',
		'box-shadow'    :'3px 3px 5px #dddddd'
	});
	
	$('#brd_view #frm_brd').css('text-align', 'center');
	
	//버튼 처리
	$url = 'index.jsp?inc=./board/new_list.jsp&subInc=./board/';
	
	$frm = document.frm_brd;
	$('#brd_view #btnModify').click(function(){
		$url += 'modify.jsp';
		$frm.action = $url;
		$frm.submit();
	});
	$('#brd_view #btnDelete').click(function(){
		$yn = confirm("정말 삭제하시겠습니까 ??");
		if($yn){
			$url += 'delete_result.jsp';
			$frm.action = $url;
			$frm.submit();
		}else{
			alert('삭제 작업이 취소되었습니다.');
		}
	});
	$('#brd_view #btnRepl').click(function(){
		$url += 'repl.jsp';
		$frm.action = $url;
		$frm.submit();
	});
	
	$('#brd_view #btnList').click(function(){
		$url += 'list.jsp';
		$frm.action = $url;
		$frm.submit();
	});

});
</script>
</head>
<body>
<div id='brd_view'>
	<h3>자료실 상세보기</h3>
	<%
	int serial = Integer.parseInt(request.getParameter("serial"));
	BoardDao dao = new BoardDao();
	BoardVo vo = dao.selectOne(serial);
	request.setAttribute("vo", vo);
	%>	
	<label>작성자</label>
	<span class='item worker'>${vo.worker } </span> ${vo.mdate } [ ${vo.hit } ] <br/>
	
	<label>제목</label>
	<span class='item subject'>${vo.subject }</span><br/>
	<span class='item content'>${vo.content }</span><br/>
	
	<c:if test="${vo.attFile !=null }">
		<label>첨부</label><hr/>
		<c:forEach var='att' items="${vo.attFile }">
			<a href='./download/${att.key}' download >
				<img src= './download/${att.key}' 
				     alt = '${att.value}' width='200px' height='160px'/>
			</a>
		</c:forEach>	
	</c:if>


	<hr/>
	<form name='frm_brd' method='post' id='frm_brd'>
		<input type='button' value='수정' name='btnModify' id='btnModify' />
		<input type='button' value='삭제' name='btnDelete' id='btnDelete' />
		<input type='button' value='답글' name='btnRepl'   id='btnRepl' />
		<input type='button' value='목록' name='btnList'   id='btnList' />

		<input type='hidden' value='${param.serial }'  name='serial'/>
		<input type='hidden' value='${param.findStr }' name='findStr'/>
		<input type='hidden' value='${param.nowPage }' name='nowPage'/>

		<input type='hidden' value='${vo.grp }'  name='grp'/>
		<input type='hidden' value='${vo.deep }' name='deep'/>
		
	</form>
</div>
</body>
</html>











