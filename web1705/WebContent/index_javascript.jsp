<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>index_javascript</title>
<link rel='stylesheet' type='text/css' href='./css/index_javascript.css' />

</head>
<body>
<%
String url = "index.jsp?inc=./index_javascript.jsp&subInc=";
%>
<div id='index_javascript'>
	<h3>JavaScript Example</h3>
	<ol>
		<li><a href='<%=url %>./javascript/script_import.jsp'>script import</a></li>
		<li><a href='<%=url %>./javascript/if.jsp'>if</a></li>
		<li><a href='<%=url %>./javascript/for.jsp'>for</a></li>
		<li><a href='<%=url %>./javascript/while.jsp'>while</a></li>
		<li><a href='<%=url %>./javascript/array.jsp'>배열</a></li>
		<li><a href='<%=url %>./javascript/array2.jsp'>2차원 배열</a></li>
		<li><a href='<%=url %>./javascript/checkbox.jsp'>checkbox</a></li>
		<li><a href='<%=url %>./javascript/emp_insert.jsp'>emp(css수정)</a></li>
		<li><a href='<%=url %>./javascript/function.jsp'>function</a></li>
		<li><a href='<%=url %>./javascript/radio.jsp'>radio</a></li>
		<li><a href='<%=url %>./javascript/radio2.jsp'>radio2</a></li>
		<li><a href='<%=url %>./javascript/radio3.jsp'>radio3</a></li>
		<li><a href='<%=url %>./javascript/select.jsp'>select</a></li>
		<li><a href='<%=url %>./javascript/select2.jsp'>select2</a></li>
		<li><a href='<%=url %>./javascript/select3.jsp'>select3</a></li>
		<li><a href='<%=url %>./canvas/strokeRect.jsp'>strokeRect</a></li>
		<li><a href='<%=url %>./canvas/arc.jsp'>arc</a></li>

		<li><a href='<%=url %>./webstorage/storage.jsp'>strorage</a></li>
		<li><a href='<%=url %>./webstorage/storage2.jsp'>strorage(Object)</a></li>

		<li><a href='<%=url %>./geolocation/geolocation.jsp'>map</a></li>

	</ol>
</div>
</body>
</html>