<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"     uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>choose</title>
</head>
<body>
<h3>choose</h3>
<pre>
&ltc:choose>
	&ltc:when test='비교연산' >
		True
	&lt/c:when>
	&ltc:when test='비교연산' >
		True
	&lt/c:when>

	&ltc:otherwise>
		비교값이 아무것도 없는 경우
	&lt/c:otherwise>
&lt/c:choose>
</pre>

<c:choose>
	<c:when test="${param.name =='hong' }">
		당신은 ${param.name } 씨이군.
	</c:when>
	
	<c:when test="${param.age>20 }">
		당신은 성년 입니다.
	</c:when>
	
	<c:otherwise>
		당신은 미성년자 이면서 홍씨가 아니군요...
	</c:otherwise>

</c:choose>








</body>
</html>