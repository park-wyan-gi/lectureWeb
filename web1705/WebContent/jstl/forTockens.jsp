<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"     uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>forTokens</title>
</head>
<body>
<h3>forTokens</h3>
<p>문자열을 특정 기호나 문자로 분리하여 토큰으로 반환</p>

<c:forTokens items="빨,주,노,초.파.남,보" delims=",." var='color'>
	${color }

</c:forTokens>
<p/>
<%
String color="#ff0000,#00ff00, #0000ff, #ffff00, #00ffff, #ff00ff";
request.setAttribute("color", color);
%>
<c:forTokens items="${color }" delims="," var='c'>
	<span style='background-color:${c }'>aaaaaaa</span>
</c:forTokens>



</body>
</html>