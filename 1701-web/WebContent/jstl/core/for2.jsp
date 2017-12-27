<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>for2</title>
</head>
<body>
<div id='title'>
   collection을 scope에 담아 jstl의 forEach를 사용하여 출력
</div>
<%
ArrayList<String> list = new ArrayList<String>();
list.add("치악산");
list.add("지리산");
list.add("내장산");
list.add("백두산");
list.add("금강산");
list.add("남산");
list.add("치악산");
list.add("한라산");
list.add("소요산");
list.add("수락산");

request.setAttribute("list", list);
%>
<c:forEach var="item"  items="${list }">
   <li>${item }</li>
</c:forEach>
<hr/>
<c:forEach var="item"  items="${list }"  begin='1' end='7'  step='2'>
   <li>${item }</li>
</c:forEach>

</body>
</html>




