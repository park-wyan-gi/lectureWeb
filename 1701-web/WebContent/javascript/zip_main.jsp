<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name='viewport'  content='width=device-width'>
<title>Insert title here</title>
<style>
#title{
   border:0px solid #4444ff;
   width:90%;
   padding:20px;
   box-sizing:border-box;
   margin-bottom:20px;
   box-shadow:3px 3px 5px #aaaaaa;
   border-radius:5px;
   background:linear-gradient(to right, #999999, #ffffff);
}
form{
   line-height: 170%;
}
form > label{
   display:inline-block;
   width:70px;
   text-align:right;
}
</style>
<script>
function start(){
	var ff = document.frm;
	ff.btnFind.onclick=function(){
		var url = 'zip_find.jsp';
		window.open(url, 'win', 'width=400px, height=300px, top=400px, left=600px');
	}
}
</script>
</head>
<body>
<div id='title'>우편 번호를 배열에서 검색하여 그 값을 메인창에 적용하시오</div>
<form name='frm'>
   <label>우편번호</label>
   <input type='text' size='4' name='zip1'>-<input type='text' size='4' name='zip2'>
   <input type='button' name='btnFind'  value='우편번호 검색'><br/>
   <label>주소</label>
   <input type='text' size='30' name='address1'><br/>
   <label>상세주소</label>
   <input type='text' size='30' name='address2'>
</form>

<script>start()</script>
</body>
</html>