<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"     uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>forEach</title>
</head>
<body>
<h3>forEach</h3>
<pre>
&lt c:forEach var = '변수' items={array| collection | map} 
               begin='n' end='n' step='n'> 

&lt /c:forEach>
</pre>
<h4>type 1(x~y까지)</h4>
<div>
	<c:forEach var = 'i' begin='1' end='10'>
		${i }
	</c:forEach>
</div>

<h4>type2 (x~y를 step을 지정)</h4>
<div>
	<c:forEach var='i' begin='1' end='30' step='2'>
		${i }
	</c:forEach>
</div>

<h4>type3 (array)</h4>
<%
int[] score = {10,50,40,30,70,90,80};
request.setAttribute("score", score);
%>
<div>
	<c:forEach var='i' items='${score }'>
		${i }
	</c:forEach>
</div>

<div>
	<c:forEach var='i' items='${score}' begin='2' end='5'>
		${i }
	</c:forEach>
</div>

<h4>type 4(map)</h4>
<%
Map<String, String> map = new HashMap<String, String>();
map.put("id", "kim");
map.put("pwd","1234");
map.put("nicName", "kim C");
map.put("phone","010-1111-2222");
map.put("email","kim@naver.com");

request.setAttribute("map", map);
%>
<c:forEach items='${map }' var='m'>
	<div>
		${m.key } = ${m.value }
	</div> 
</c:forEach>





</body>
</html>





