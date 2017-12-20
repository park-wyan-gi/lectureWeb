<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
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
#modify >#frm_brd label{
	display: inline-block;
	width:70px;
	text-align: right;
	vertical-align: top;
}

#modify #subject, #modify #content{
	width:600px;
}
#modify #btnZone{
	text-align: center;
}

</style>
</head>
<body>
<div id='modify'>
	<h3>자료실 수정</h3>
	<form name='frm_brd' id='frm_brd' method='post' action='' enctype='multipart/form-data'>

		<label>아 이 디</label>
		<input type='text' size='6' name='worker' readOnly value='${vo.worker }'><br/>
		<label>제 목</label>
		<input type='text' size='60' name='subject' 
				value='${vo.subject }' 	id='subject'/><br/>
		<label></label>
		<textarea rows="20" cols="70" name='content' id='content'>${vo.content }</textarea>
		<p/>
		
		<label>첨부 파일</label>
		<span style='display:inline-block'>
		<c:if test="${vo.attFile != null}">
				<c:forEach var='att' items="${vo.attFile }">
					<span class='attfile'>
						<img src='./download/${att.key }' 
						      alt = '${att.value }' 
						      width='300px' height='200px'> 
							<label><input type='checkbox' name='deleteAtt' 
										value='${att.key }' 
										onclick='delFunc(this)'>삭제</label> 
					</span><br/>
				</c:forEach>
			</c:if>
		</span>
		<p/>	
		<label>신규 첨부</label>
		<span id='attZone' style='display:inline-block'>
			<c:forEach var='att' begin = '1' 
										end="${2-vo.attFile.size() }">
				<div><input type='file' name='attch${att}' /></div>
			</c:forEach>
		</span>
		
		<p/>		
		<label>암 호</label>
		<input type='password' name='pwd' size='10'/>[저장시 암호]<p/>




		<input type='button' value='수정' name='btnModify' id='btnModify'/>
		<input type='button' value='취소' name='btnList'   id='btnList'/>
		
		<input type='hidden' name='serial'  value='${param.serial }'/>
		<input type='hidden' name='nowPage' value='${param.nowPage }'/>
		<input type='hidden' name='grp'     value='${vo.grp }'/>
		<input type='hidden' name='deep'    value='${vo.deep }'/>
		<input type='hidden' name='findStr' value='${param.findStr }'/>
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

var cnt =3;
function delFunc(obj){
	var attZone = document.getElementById("attZone");
	if(obj.checked){
		var div = document.createElement('div');
		var input = document.createElement('input');
		input.setAttribute('type', 'file');
		input.setAttribute('name', 'att'+cnt);
		div.appendChild(input);
		attZone.appendChild(div);
		
		cnt++;
	}else{
		var remove = attZone.lastChild;
		attZone.removeChild(remove);
		cnt--;
	}
}
</script>





</body>
</html>