<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
#email{
	width:100%;
	text-align: left;
}
#email #btnZone{
	text-align: center;
	margin-top:20px;
}
#email #btnZone input{
	width:100px;
	height:40px;
}
</style>
</head>
<body>
<div id='email'>
	<h3>메일 보내기</h3>
	<form name='frm_mail' method='post' enctype='multipart/form-data'>
		<span>작성자</span>
		<input type='text' size='40' name='sender' value='hipwg@naver.com'><br/>
		<span>수신자</span>
		<input type='text' size='40' name='receiver' value='${param.receiver }'/><br/>
		<span>제&nbsp;&nbsp;&nbsp;목</span>
		<input type='text' size='50' name='subject' /><br/>
		<textarea rows="18" cols="59" name='content'></textarea><br/>
		<span>첨부</span>
		<input type='file' name='attFile' />
		<p/>
		<div id='btnZone'>
			<input type='button' value='보내기' name='btnSend' id='btnSend'/>
			<input type='button' value='취소' name='btnCancel' id='btnCancel'/>
		</div>
	</form>
</div>

<script>
var frm = document.frm_mail;
frm.btnSend.onclick = function(){
	frm.action = "mail_send.jsp";
	frm.submit();
}

frm.btnCancel.onclick = function(){
	self.close();
}
</script>
</body>
</html>