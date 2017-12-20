<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id='modify'>
	<h3>자료실 수정</h3>
	<form name='frm_brd' method='post' action='' enctype='multipart/form-data'>

		<label>아 이 디</label>
		<input type='text' size='6' name='worker' readOnly value='${vo.worker }'><br/>
		<label>제 목</label>
		<input type='text' size='60' name='subject' 
				value='${vo.subject }' 	id='subject'/><br/>
		<label></label>
		<textarea rows="20" cols="70" name='content' id='content'>${vo.content }</textarea>
		<p/>
		<label>첨부파일</label>
		<span style='display:inline-block'>
			<input type='file' name='attfile1'/><br/>
			<input type='file' name='attfile2'/><br/>
		</span>
		<p/>		
		<label>암 호</label>
		<input type='password' name='pwd' size='10'/>[저장시 암호]<p/>




		<input type='button' value='수정' name='btnModify' id='btnModify'/>
		<input type='button' value='취소' name='btnList'   id='btnList'/>
		
		<input type='text' name='serial'  value='${param.serial }'/>
		<input type='text' name='nowPage' value='${param.nowPage }'/>
		<input type='text' name='grp'     value='${vo.grp }'/>
		<input type='text' name='deep'    value='${vo.deep }'/>
		<input type='text' name='findStr' value='${param.findStr }'/>
	</form>

</div>

<script>
var frm = document.frm_brd;
frm.btnModify.onclick = function(){
	frm.action = 'modifyR.do';
	frm.submit();
}

frm.btnList.onclick = function(){
	frm.enctype='';
	frm.action = 'list.do';
	frm.submit();
}


</script>





</body>
</html>