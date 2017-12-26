<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id='insert_form'>
	<h3>회원가입</h3>
	<form name='frm_insert' method='post' id='frm_insert'>
		<label>아이디</label>
		<input type='text' name='mid' value='${param.mid }'  size='10'>
		<input type='button' name='btnIdCheck' value='중복체크'><br/>
		
		<label>성명</label>
		<input type='text' name='irum' value='${param.irum }' size='12'><br/>
		
		<label>닉네임</label>
		<input type='text' name='nicName' value='${param.nicName }'  size='18'><br/>

		<label>이메일</label>
		<input type='text' name='email' value='${param.email }' size='26'><br/>

		<label>주소</label>
		<input type='text' name='post' value='${param.post }'  size='5' />
		<input type='button' name='btnFindZip' value='검색'  /><br/>
		<label> </label>
		<input type='text' size='30' name='address1' value='${param.address1 }'  size='40' /><br/>
		
		<label>상세주소</label>
		<input type='text' size='30' name='address2' value='${param.address2 }' size='35' /><br/>
		
		<label>연락처</label>
		<input type='text' name='phone' value='${param.phone }' ><br/>
	
		<label>성별</label>
		<label att='gen'><input type='radio' name='gender'  value='m'>남</label>
		<label att='gen'><input type='radio' name='gender' value ='f' checked>여</label> <br/>
		
		<label>암호</label>
		<input type='password' name='pwd' size='5'>
		확인 <input type='password' name='tempPwd'  size='5'>
		<p/>
	
		<input type='button' name='btnRegister' value='가입'>
		<input type='button' name='btnCancel' value='취소'>
		<input type='button' name='btnList' value='목록으로'>
	
	</form>
</div>

<script>initInsertForm()</script>

</body>
</html>