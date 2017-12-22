<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>

#view #frm_brd{
	display:inline-block;
	margin:0px auto;
	text-align:left;
}
#view #content{
	width:650px;
	min-height:50px;
	padding:20px;
	background-color: #eeeeee;
}
#view >#frm_brd label{
	display: inline-block;
	width:70px;
	text-align: right;
	vertical-align: top;
}
#view #frm_brd{
	text-align: left;
}
</style>
</head>
<body>
<div id='view'>
	<h3>자료실 상세 내용</h3>
	
	<form name='frm_brd' method='post' action='' id='frm_brd'>
	
			<label>아 이 디</label>
		<input type='text' size='6' name='worker' readOnly value='${vo.worker }'>
			<a href='#' onclick="mail('${vo.email}')">[${vo.email}] 메일 보내기</a>
		<br/>
		<label>제 목</label>
		<input type='text' size='60' name='subject' 
				value='${vo.subject }' 	id='subject'/><br/>
		<label></label>
		<div id='content'>${vo.content }</div>
		<p/>
			
		<c:if test="${vo.attFile != null}">
			<label>첨부파일</label>
				<c:forEach var='item' items="${vo.attFile }">
					<span>
						<a href='./download/${item.key }' download>
							<img src='./download/${item.key }'
									alt='${item.value }' width='300px' height='200px'/>
						</a>		
					</span>
				</c:forEach>
		</c:if>
		
		<p/>		
	
		<input type='button' value='수정' name='btnModify' id='btnModify'/>
		<input type='button' value='삭제' name='btnDelete' id='btnDelete'/>
		<input type='button' value='댓글' name='btnRepl'   id='btnRepl'/>
		<input type='button' value='목록' name='btnList'   id='btnList'/>
		<input type='hidden' name='serial'  value='${vo.serial }'/>
		<input type='hidden' name='nowPage' value='${param.nowPage }'/>
		<input type='hidden' name='grp'     value='${vo.grp }'/>
		<input type='hidden' name='deep'    value='${vo.deep }'/>
		<input type='hidden' name='findStr' value='${param.findStr }'/>
	</form>
</div>

<script>
var frm = document.frm_brd;
frm.btnModify.onclick = function(){
	frm.action = 'modify.do';
	frm.submit();
}
frm.btnDelete.onclick = function(){
	var yn = confirm('자료를 정말 삭제 하시겠습니까 ?');
	if(yn){
		frm.action = 'deleteR.do';
		frm.submit();
	}else{
		alert('삭제 작업이 취소 되었습니다.');
	}
}

frm.btnRepl.onclick = function(){
	frm.action = 'repl.do';
	frm.submit();
}

frm.btnList.onclick = function(){
	frm.action = 'list.do';
	frm.submit();
}

function mail(receiver){
	var url = './email/mail_form.jsp?receiver=' + receiver;
	var w=window.open(url,"w", 
							"width=400px, height=500px, left=400px, top=200px");
}
</script>

</body>
</html>






