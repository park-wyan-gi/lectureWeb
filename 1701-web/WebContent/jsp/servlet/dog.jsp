<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang='ko'>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name='viewport' content='width=device-width'>
<title>dog.jsp</title>
</head>
<body>
<div id='title'>
   Servlet에서 하나의 파라메터로 여러 개의 값을 전달 받기
</div>

<form name='frm' method='post' action='Dog'>
   <h4>당신이 좋아 하는 강아지를 선택하세요.</h4>
   <label><input type='checkbox' name='dog' value='푸들'>푸들</label>
   <label><input type='checkbox' name='dog' value='진돗개'>진돗개</label>
   <label><input type='checkbox' name='dog' value='풍산개'>풍산개</label>
   <label><input type='checkbox' name='dog' value='삽살개'>삽살개</label>

   <input type='submit' value='선택'/>
</form>

</body>
</html>














