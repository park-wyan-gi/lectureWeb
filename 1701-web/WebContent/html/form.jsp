<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>form</title>
</head>
<body>
<h3>form관련된 태그들<hr/></h3>

<form name='frm' method='post'>
<label>전송할 파일을 선택하시오.</label>
<input type='file' name='fileName'>
<br/>

<label>패스워드를 입력하세요.</label>
<input type='password' name='password'>
<br/>

<label>버튼의 네 종류</label>
<input type='reset' value='초기값으로'>
<input type='button' value='버튼'/>
<input type='submit' value='전송'>
<input type='image' src='../images/icon2.png'>
<br/>

<label>x버튼을 클릭하면 입력 내용이 모두 삭제됨</label>
<input type='search' name='search'>
<br/>

<label>당신의 이해도는 ?</label>
<input type='range' min='0' max='120' value='100'>
<br/>

<label>월을 선택하세요.</label>
<input type='number' min='1' max='12' step='1' name='month'>
<br/>

<label>출발일자를 선택하세요</label>
<input type='date' name='chulbal'>
<br/>

<label>출발 시간을 선택하세요.</label>
<input type='time' name='sigan'>
<br/>

<label>가장 좋아하는 색상은 ?</label>
<input type='color' name='color'>
<br/>
<label>기타 사항을 입력하세요.</label>
<textarea name='doc' cols='60' rows='10'></textarea>

<p/>
<input type='submit' value='최종전송'/>
</form>

</body>
</html>