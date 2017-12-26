<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"     uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>parse</title>
</head>
<body>
<h2>parseNumber | formatDate</h2>

<h4>parseNumber</h4>
<c:set var='score' value='80' />
<fmt:parseNumber  var='nSu' value='${score }'/>

<h4>formatDate</h4>
<%
Date now = new Date();
request.setAttribute("now", now);
%>
<fmt:formatDate value="${now }" pattern="yyyy-MM-dd(E) hh:mm:ss"/>

</body>
</html>









