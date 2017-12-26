<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"     uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 
  <!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>if</title>
</head>
<body>
<h2>if</h2>
<div>
	&ltc:if test ='조건'>
	   true
	&lt/c:if>
</div>
<p>변수가 a,b에 임의의 값을 대입한 후 큰값을 출력 하시오.</p>
<c:set var='a' value='100' />
<c:set var='b' value='50' />
<!--  문자열화된 자료를 숫자형으로 -->
<fmt:parseNumber  value='${a }'  var='nA'/>
<fmt:parseNumber  value='${b }'  var = 'nB'/>

<c:if test='${nA>nB}'>
큰값은 a입니다.
</c:if>
<c:if test='${nA<nB}'>
큰값은 b입니다.
</c:if>

</body>
</html>




