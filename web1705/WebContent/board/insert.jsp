<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src = 'http://code.jquery.com/jquery-3.2.1.min.js' ></script>
<script>
$(document).ready(function(){
	var frm = document.frm_brd;
	frm.mDate.value = new Date().toLocaleDateString();
	
	$('#brd_insert label').css({
		'display'    : 'inline-block',
		'width'      : '52px',
		'text-align' :'right'
	});
	$('#brd_insert #frm_brd').css('line-height', '24px');
	
	//button ---------------------------------------
	$('#brd_insert #btnSave').click(function(){
		frm.action = 'index.jsp?inc=./board/new_list.jsp'
				     + '&subInc=./board/insert_result.jsp';
		frm.submit();
	});
	$('#brd_insert #btnCancel').click(function(){
		frm.action = 'index.jsp?inc=./board/new_list.jsp'
				     + '&subInc=./board/list.jsp';
		frm.submit();
		
	});
	
})


</script>

<title>Insert title here</title>
</head>
<body>
<%
	String sId ="";
	if(session.getAttribute("sId") != null){
		sId = (String)session.getAttribute("sId");
	}
%>
<div id='brd_insert'>
	<h3>자료실</h3>
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
	</form>
</div>
</body>
</html>