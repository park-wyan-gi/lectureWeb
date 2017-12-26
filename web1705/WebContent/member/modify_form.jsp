<%@page import="member.MemberVo"%>
<%@page import="member.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String mid = request.getParameter("mid");
MemberDao dao = new MemberDao();
MemberVo v = dao.selectOne(mid);
request.setAttribute("v", v);

%>

<div id='modify_form'>
	<h3>회원 정보 수정</h3>
	<form name='frm_modify' method='post' id='frm_modify'>
		<label>아이디</label>
		<input type='text' name='mid' value='<%=mid %>'  readonly><br/>
		
		<label>성명</label>
		<input type='text' name='irum' value='${v.irum }' ><br/>
		
		<label>닉네임</label>
		<input type='text' name='nicName' value='${v.nicName }' ><br/>

		<label>이메일</label>
		<input type='text' name='email' value='${v.email }' ><br/>

		<label>주소</label>
		<input type='text' name='post' value='${v.post }' >
		<input type='button' name='btnFindZip' value='검색' ><br/>
		<label></label><input type='text' size='30' name='address1' value='${v.address1 }'  /><br/>
		<label>상세주소</label><input type='text' size='30' name='address2' value='${v.address2 }' /><br/>
		
		<label>연락처</label>
		<input type='text' name='phone' value='${v.phone }' ><br/>
	
		<label>성별</label>
		<label att='gen'><input type='radio' name='gender'  ${(v.gender eq 'm')? 'checked': '' } value='m'>남</label>
		<label att='gen'><input type='radio' name='gender'  ${(v.gender eq 'f' )? 'checked': '' }   value ='f' >여</label> <br/>

		<label>포인트</label>
		<input type='text' name='point' value='${v.point }' ><br/>

		<label>가입일</label>
		<input type='date' name='rDate' value='${v.rDate }' ><br/>
		
		<label>암호</label>
		<input type='password' name='pwd' size='8'>
		확인 <input type='password' name='tempPwd' size='8' >
		[수정삭제시 기본 암호 사용]
		<br/>
	
		<input type='button' name='btnDelete' value='삭제하기'>
		<input type='button' name='btnModify' value='저장하기'>
		<input type='button' name='btnCancel' value='취소'>
		<input type='button' name='btnList' value='목록으로'>
	
		<input type='hidden' name='findStr' value='${param.findStr }' />
		<input type='hidden' name='nowPage' value='${param.nowPage }' />
	</form>
</div>

<script>initModifyForm()</script>

</body>
</html>