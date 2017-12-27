<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>choose.jsp</title>
</head>
<body>
<div>
jstl의 choose를 사용하여 점수에 따른 학점을 구해서 출력
</div>
<form name='frm' method='post' action='choose_result.jsp'>
   <label>국어</label>
   <input type='text' name='kor' value='90'><br/>
   <label>영어</label>
   <input type='text' name='eng' value='80'><p/>
   <input type='submit' value='전송'/>
</form>
</body>
</html>