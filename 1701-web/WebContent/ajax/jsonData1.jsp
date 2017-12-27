<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id='data'>
<%
String score = "["
         	+ "{'irum':'홍길동', 'kor':'90', 'mat':'70'},"
         	+ "{'irum':'일지매', 'kor':'70', 'mat':'60'},"
         	+ "{'irum':'성춘향', 'kor':'60', 'mat':'60'},"
         	+ "{'irum':'향   단', 'kor':'90', 'mat':'90'} "
         	+ "]";

score = score.replaceAll("'", "\"");
out.print(score);
%>
</div>

</body>
</html>