<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
.mem_lbl { display:inline-block; /*영역을 하나의 내부 블럭형으로*/ 
	   width:140px;text-align:right; 
	   margin-bottom:4px; margin-right:20px; }	
.mem_span1 {display:inline-block; width:300px; 
		border:1px solid #ff0000;  }
#mem_form{line-height:25px;}
</style>
</head>
<body>
<h3>회원가입화면</h3>
<form name='mem_form' method='post' id='mem_form'
	action='index.jsp?inpage=./member_myba/member_insert_result.jsp'>
	<label class='mem_lbl'>아이디 </label>
	<input type='text' name='mid' id='mem_mid' 
			maxlength='10' value='park'><br/>
	
	<label class='mem_lbl'>성 명 </label>
	<input type='text' name='irum' 
		id='mem_irum' value='박원기'><br/>
	
	<label class='mem_lbl'>암호 </label>
	<input type='password' value='1111' name='pwd' id='mem_pwd'>
	<br/>

	<label class='mem_lbl'>성별</label> 
	<label><input type='radio' value='남' name='gender'>남자</label>
	<label><input type='radio' value='여' name='gender' checked>여자</label>
	<br/>


	<label class='mem_lbl'>우편번호 </label>
	<input type='text' name='zip1' id='mem_zip1' size='3' >
	- <input type='text' name='zip2' id='mem_zip2' size='3' >
	<input type='button' value='우편번호검색' id='mem_zip_search'>
	<br/>
	<label class='mem_lbl'>주 소 </label>
	<input type='text' name='address' id='mem_address' 
			size='50' value='seoul'><br/>
	
	<label class='mem_lbl'>연락처 </label>
	<input type='text' name='phone' id='mem_phone' 
			size='20' value='123-1234'><br/>
			 
	<label class='mem_lbl'>사진 
	</label><input type='file' name='picture'><br/>
	
	<div style='width:450px; text-align:center;'>
	<input type='submit' value='회원추가' id='mem_submitBtn'>
	<input type='reset' value='초기화'>
	</div>
</form>
</body>
</html>