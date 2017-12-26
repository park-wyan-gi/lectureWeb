<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>textarea_tag</title>
</head>
<body>
<h1>여러줄 입력(textarea)</h1>
<ul>특성
	<li>html태그를 인식하지 못한다.</li>
	<li>빈칸, 엔터키를 모두 인식한다.</li>
	<li>cols : 칸수 지정</li>
	<li>rows : 줄수 지정</li>
</ul>
<form name='frm'>
	<p>본문 내용을 입력하세요</p>
	<textarea name='doc' cols='80' rows='20'></textarea>
</form>





</body>
</html>