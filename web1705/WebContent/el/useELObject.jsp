<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>useELObject</title>
</head>
<body>
<h3>el 사용방법</h3>
<ul>
	<li>자바 메서드를 간단한 표현 방법으로 호출 가능</li>
	<ul>
		<li>application(applicationScope)</li>
		<li>session(sessionScope)</li>
		<li>request(requestScope)</li>
		<li>page(pageScope)</li>
	</ul>
	등의 영역을 쉽게 접근할 수 있다.
	<li>&#36{expr } 형식으로 사용한다.</li>
</ul>
<hr/>

<%
	request.setAttribute("irum", "박원기");
%>

<ol>
	<li>요청 URL : ${pageContext.request.requestURI }</li>
	<li>request : ${requestScope.irum }</li>
	<li> Code : ${param.code }</li>
</ol>


</body>
</html>








