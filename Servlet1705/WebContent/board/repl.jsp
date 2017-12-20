<%@ page language="java" contentType="text/html; charset=UTF-8"
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
#repl >#frm_brd label{
	display: inline-block;
	width:70px;
	text-align: right;
	vertical-align: top;
}

#repl #subject, #repl #content{
	width:600px;
}
#repl #btnZone{
	text-align: center;
}

</style>
</head>
<body>
<div id='repl'>
	<h3>답글하기</h3>
	
	<form name='frm_brd' id='frm_brd' method='post' action='' enctype='multipart/form-data'>
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
	
	
		<input type='button' value='답변저장' name='btnSave' />
		<input type='button' value='목록으로' name='btnList' />
		<input type='button' value='취소'    name = 'btnView' />
		<input type='hidden' name='serial'  value='${param.serial }' />		
		<input type='hidden' name='nowPage' value='${param.nowPage }' />		
		<input type='hidden' name='findStr' value='${param.findStr }' />	
		<input type='hidden' name='grp'     value='${param.grp }' />	
		<input type='hidden' name='deep'     value='${param.deep }' />	
			
	</form>
</div>
<script>
var frm = document.frm_brd;
frm.btnSave.onclick = function(){
	frm.action = 'replR.do';
	frm.submit();
}
frm.btnList.onclick = function(){
	frm.enctype='';
	frm.action = 'list.do';
	frm.submit();
}
frm.btnView.onclick = function(){
	frm.enctype='';
	frm.action = 'view.do';
	frm.submit();
}
</script>
</body>
</html>








