<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name='viewport' content='width=device-width'>
<title>requestTest1.jsp</title>
</head>
<body>
<h3>form 정보를 다른 JSP 페이지에 전달<hr/></h3>

<form name='frm' method='post' action='requestTest1.jsp'>
  <label>이름 <input type='text' name='irum' value='park'></label>
  <br/>
  <label>성별</label>
  <label><input type='radio' name='gender' value='male'>남자</label>
  <label><input type='radio' name='gender' value='female'>여자</label>
  <br/>
  <label>취미</label>
  <label><input type='checkbox' name='hobby' value='독서'>독서</label>
  <label><input type='checkbox' name='hobby' value='게임'>게임</label>
  <label><input type='checkbox' name='hobby' value='TV시청'>TV시청</label>
  <label><input type='checkbox' name='hobby' value='축구'>축구</label>
  <label><input type='checkbox' name='hobby' value='기타'>기타</label>
  <p/>
  <input type='submit' value='전송'/>

</form>

</body>
</html>