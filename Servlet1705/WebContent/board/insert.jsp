<%@ page language="java" contentType="text/html; charset=UTF-8" autoFlush="true"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
#frm_brd{
	display:inline-block;
	margin:0px auto;
	text-align:left;
}
#insert >#frm_brd label{
	display: inline-block;
	width:70px;
	text-align: right;
	vertical-align: top;
}

#frm_brd #subject, #frm_brd #content{
	width:600px;
}
#frm_brd #btnZone{
	text-align: center;
}

</style>
</head>
<body>
<div id='insert'>
	<h3>자료입력</h3>

	<form name='frm_brd' method='post' action='' id='frm_brd'
			enctype='multipart/form-data'>
		<label>아 이 디</label>
		<input type='text' size='6' name='worker' readOnly value='${sId }'><br/>
		<label>제 목</label>
		<input type='text' size='60' name='subject' id='subject'/><br/>
		<label></label>
		<textarea rows="20" cols="70" name='content' id='content'></textarea>
		<p/>
		<label>첨부파일</label>
		<span style='display:inline-block'>
			<input type='file' name='attfile1'/><br/>
			<input type='file' name='attfile2'/><br/>
		</span>
		<p/>		
		<label>암 호</label>
		<input type='password' name='pwd' size='10'/><p/>
		<div id='btnZone'>
			<input type='button' value='목록으로' name='btnList' id='btnList'/>
			<input type='button' value='저장' name='btnSave' id='btnSave'/>
		</div>
	</form>
</div>
<script>
	var frm = document.frm_brd;
	
	frm.btnList.onclick =function(){
		frm.action = "list.do";
		frm.submit();
	}
	frm.btnSave.onclick = function(){
		frm.action = 'insertR.do';
		frm.submit();
	}
</script>
</body>
</html>






