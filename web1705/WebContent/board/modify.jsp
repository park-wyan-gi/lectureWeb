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
	var frm = document.frm_brd;
	$url = 'index.jsp?inc=./board/new_list.jsp&subInc=./board/';
	
	$('#brd_modify label').css({
		'display'    : 'inline-block',
		'width'      : '52px',
		'text-align' :'right'
	});
	$('#brd_insert #frm_brd').css('line-height', '24px');
	
	//button ---------------------------------------
	$('#brd_modify #btnSave').click(function(){
		frm.action = $url + 'modify_result.jsp';
		frm.submit();
	});
	$('#brd_modify #btnCancel').click(function(){
		frm.action = $url + 'list.jsp';
		frm.enctype='';
		frm.submit();
		
	});
	
})

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
</head>
<body>
<%
int serial = Integer.parseInt(request.getParameter("serial"));
BoardDao dao = new BoardDao();
BoardVo vo = dao.selectOne(serial);

request.setAttribute("vo", vo);

%>

<div id='brd_modify'>
	<h3>자료실 수정</h3>
		<form name='frm_brd' id='frm_brd' method='post' 
			enctype='multipart/form-data'>
			<label>작성자</label>
			<input type='text' readonly size='8' name='worker' 
			       value="${vo.worker }" readOnly/>
			 [ <output name='mDate' >${vo.mdate }</output> ] <br/>
			 
			<label>제 목</label>
			<input type='text' size='70' name='subject' 
			       value='${vo.subject }'/><br/>
			
			<textarea rows="10" cols="81" name='content'>${vo.content }</textarea>
			<br/>
			<label>첨 부</label><br/>
			<c:if test="${vo.attFile != null}">
				<c:forEach var='att' items="${vo.attFile }">
					<div class='attfile'>
						<img src='./download/${att.key }' 
						      alt = '${att.value }' 
						      width='300px' height='200px'> 
							<label>
								<input type='checkbox' name='deleteAtt' 
										value='${att.key }' 
										onclick='delFunc(this)'>삭제</label> 
					</div><br/>
				</c:forEach>
			</c:if>
			<div id='attZone'>
				<c:forEach var='att' begin = '1' 
											end="${2-vo.attFile.size() }">
					<div><input type='file' name='attch${att}' /></div>
				</c:forEach>
			</div>
			
			<label>암 호</label>
			<input type='password' size='8' name='pwd' />[작성시 암호]<p/>
			
			<input type='button' value='저장' name='btnSave'   id='btnSave'/>
			<input type='button' value='취소' name='btnCancel' id='btnCancel'/>
			
			<input type='hidden' value='${param.serial }' name='serial'/>
			<input type='hidden' value='${param.findStr }' name='findStr'/>
			<input type='hidden' value='${param.nowPage }' name='nowPage'/>
			
	</form>
</div>
</body>
</html>











