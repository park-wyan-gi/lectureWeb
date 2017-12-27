	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>메일 전송</title>
<style>
#mail  label{
   display:inline-block;
   width:80px;
   text-align: right;
   vertical-align: top;
}
#mail>form{
   line-height: 170%;
}
</style>
</head>
<body>
<div id='mail'>
   <h2 id='title'>메일 발송</h2>
	<form name='frm_mail' method='post' action='mail_send_result.jsp' 
	           enctype='multipart/form-data'>
	   <label>발신자</label>
	   <input type='text' size='50' name='sender' value='hipwg@naver.com'><br/>
	   
	   <label>수신자</label>
	   <input type='text' size='50' name='receiver' value='hipwg@naver.com'><br/>
	
	   <label>제목</label>
	   <input type='text' size='80' name='subject' value='식사는 하셨나요???'><br/>
	
	   <label>내용</label>
	   <textarea cols='82' rows='20' name='content'>밥먹으로 가시죠 !!!!</textarea><br/>
	   
	   <label>첨부파일</label>
	   <input type='file' name='attfile'/>
	   
	   <p/>
	   <label></label>
	   <input type='submit' value='전송' id='btnSubmit'>
	   <input type='button' value='취소' id='btnCancel'>
	</form>
</div>
</body>
</html>
	