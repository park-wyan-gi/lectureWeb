<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>index_html</title>
<link rel='stylesheet' type='text/css' href='./css/index_html.css' />
</head>
<body>
<%
String url = "index.jsp?inc=./index_html.jsp&subInc=";
%>
<h3>html Example</h3>
<div  id='index_html'>
	<ol type='A'>
		<li><a href='<%=url %>./chapter2/anchor.jsp'>anchor</a>
		<li><a href='<%=url %>./chapter2/choice_tag.jsp'>choice</a>
		<li><a href='<%=url %>./chapter2/font_style.jsp'>font style</a>
		<li><a href='<%=url %>./chapter2/font_tag.jsp'>font tag</a>
		<li><a href='<%=url %>./chapter2/form_tag.jsp'>form tag</a>
		<li><a href='<%=url %>./chapter2/img_tag.jsp'>image tag</a>
		<li><a href='<%=url %>./chapter2/list_tag.jsp'>list</a>
		<li><a href='<%=url %>./chapter2/list_tag2.jsp'>list(II)</a>
		<li><a href='<%=url %>./chapter2/table_tag.jsp'>table</a>
		<li><a href='<%=url %>./chapter2/textarea_tag.jsp'>textarea</a>
		<li><a href='<%=url %>./chapter2/button_tag.jsp'>button</a>
		<li><a href='<%=url %>./chapter2/html5add_tag.jsp'>html5 add tag</a>
	</ol>
</div>

</body>
</html>