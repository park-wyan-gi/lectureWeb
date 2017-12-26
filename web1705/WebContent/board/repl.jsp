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
	$url = 'index.jsp?inc=./board/new_list.jsp&subInc=./board/';
	
	//취소(목록으로 이동)
	$('#brd_repl #btnCancel').click(function(){
		$frm = document.frm_brd;
		$frm.enctype='';
		$frm.action = $url + 'list.jsp';
		$frm.submit();
		
	});

	//저장 버튼
	$('#brd_repl #btnSave').click(function(){
		$frm = document.frm_brd;
		$frm.action = $url + 'repl_result.jsp';
		$frm.submit();
		
	});



})

</script>

</head>
<body>

<%
String sId = "";
if(session.getAttribute("sId") != null){
	sId = (String)session.getAttribute("sId");
}

%>
<div id='brd_repl'>
	<h3>답변작성</h3>
		<form name='frm_brd' id='frm_brd' method='post' 
			enctype='multipart/form-data'>
			<label>작성자</label>
			<input type='text' readonly size='8' name='worker' value="<%=sId%>"/>
			 [ <output name='mDate' ></output> ] <br/>
			 
			<label>제 목</label>
			<input type='text' size='70' name='subject' /><br/>
			
			<textarea rows="10" cols="81" name='content'></textarea>
			<br/>
			<label>첨 부</label>
			<input type='file' name='attch1' /><br/>
			<label></label>
			<input type='file' name='attch2' /><br/>
			
			<label>암 호</label>
			<input type='password' size='8' name='pwd' /><p/>
			
			<input type='button' value='저장' name='btnSave'   id='btnSave'/>
			<input type='button' value='취소' name='btnCancel' id='btnCancel'/>
			
			<input type='hidden' value='${param.findStr }' name='findStr'/>
			<input type='hidden' value='${param.nowPage }' name='nowPage'/>
			
			<input type='hidden' name='grp' value='${param.grp }'/>
			<input type='hidden' name='deep' value='${param.deep }'/>
			
			</form>
</div>
</body>
</html>