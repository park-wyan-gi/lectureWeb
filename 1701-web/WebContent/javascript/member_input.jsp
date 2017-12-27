<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, user-scalable=no">
<title>회원가입</title>
<style>
#title {
   background-color: #eeeeee;
   font-size: 20pt;
   font-weight: bold;
   padding: 10px;
   box-sizing: border-box;
   background: linear-gradient(to right, #666666, #ffffff);
   color: #ffffff;
}

form {
   line-height: 180%;
}

form>label {
   display: inline-block;
   width: 80px;
   text-align: right;
   vertical-align: top;
   margin-right: 7px;
}

#inter {
   display: inline-block;
}

#inter>label {
   display: inline-block;
   width: 100px;
}

#buttons {
   margin-left: 90px;
}

#buttons>input {
   width: 100px;
   height: 40px;
}
</style>
<script>
function start(){
   ids = new Array('a001','a002','a003');
   var ff = document.frm;
   ff.onsubmit = fRegister;
   ff.btnCheck.onclick=fIdCheck;
   
   ff.e3.onchange = function(){
      ff.e2.value = ff.e3.value;
   }
   
}

function fIdCheck(){
   var ff = document.frm;
   var mid = ff.mid.value;
   var b=false;
   var pattern = /[^\w]+/gi; //영숫자가 아닌 문자가 들어오면~
   if(mid == ''){
      alert('아이디를 입력해 주세요. ');
      ff.mid.focus();
      return;
   }
   for(i=0 ; i<ids.length ; i++){
      if(ids[i] == mid) b=true;
   }
   
   if(pattern.test(mid)){
      alert('영숫자만 입력하세요');
      ff.mid.focus();
   }else if(b){
      alert('아이디가 중복되었습니다. ');
      ff.mid.focus();
   }else if(mid.length <6 || mid.length > 12){
      alert('아이디가 너무 길거나 짧습니다.. ');
      ff.mid.focus();
   }
}

function fRegister(){
   var ff = document.frm;
   var flag=true;
   // 이름 한영 체크
   var pattern = /[^a-z가-휗]+/gi;
   
   if(pattern.test(ff.irum.value)){
      alert('이름 오류');
      ff.irum.focus();
      flag=false;
   }

   if(ff.pwd.value == ''){
      alert('암호를 입력해 주세요.');
      ff.pwd.focus();
      flag=false;
   }else if(ff.pwd.value != ff.pwd2.value){
      alert('암호가 일치하지 않습니다.');
      ff.pwd.focus();
      flag=false;
   }
   
   if( !( ff.gender[0].checked || ff.gender[1].checked)){
      alert('성별을 체크해 주세요.');
      ff.gender[0].focus();
      flag=false;
   }
   
   var inter_cnt=0;
   for(i=0 ; i<ff.inter.length ; i++){
      if(ff.inter[i].checked) inter_cnt++;
   }
   
   if(inter_cnt==0){
      flag=false;
      alert('관심사를 하나라도 체크해 주세요.');
   }
   
   if(flag) return true;
   else     return false;
}
</script>


</head>
<body>
   <p id='title'>회원가입</p>
   <form name='frm'>
      <label>아이디</label> <input type='text' name='mid' value='a001'
         placeholder="6~12자리 영숫자만..."> <input type='button'
         name='btnCheck' value='중복체크'><br /> <label>성명</label> <input
         type='text' name='irum' value='원기'><br /> <label>암호</label> <input
         type='text' name='pwd' value='1111' size='10'><br /> <label>암호확인</label>
      <input type='text' name='pwd2' value='1111' size='10'><br /> <label>성별</label>
      <label><input type='radio' name='gender' value='m'>남자</label>
      <label><input type='radio' name='gender' value='f'>여자</label><br />

      <label>연락처</label> <select name='ph1'>
         <option value='010'>010</option>
         <option value='011'>011</option>
         <option value='017'>017</option>
      </select> <input type='text' name='ph2' value='1111' size='8'> <input
         type='text' name='ph3' value='2222' size='8'><br /> <label>이메일</label>
      <input type='text' name='e1' value='hipwg' size='10'> @ <input
         type='text' name='e2' value='naver.com'> <select name='e3'>
         <option value='naver.com'>naver.com</option>
         <option value='daum.net'>daum.net</option>
         <option value='gmail.com'>gmail.com</option>
         <option value='nate.com'>nate.com</option>
      </select><br /> <label>관심사</label>
      <div id='inter'>
         <label><input type='checkbox' name='inter' value='여행'>여행</label>
         <label><input type='checkbox' name='inter' value='도서'>도서</label>
         <label><input type='checkbox' name='inter' value='자동차'>자동차</label><br />
         <label><input type='checkbox' name='inter' value='피규어'>피규어</label>
         <label><input type='checkbox' name='inter' value='드라마'>드라마</label>
         <label><input type='checkbox' name='inter' value='영화'>영화</label>
      </div>
      <br /> <label>기타</label>
      <textarea name='etc' rows="10" cols="60"></textarea>

      <p />
      <div id='buttons'>
         <input type='reset' value='취소' /> <input type='submit' value='가입' />
      </div>

   </form>
   <script>start()</script>
</body>
</html>











