<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"     uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>formatNumber</title>
</head>
<body>
<h2>formatNumber</h2>
<c:set var='price' value='123456789.1234'/>
<li> price = ${price }
<li>원단위 : 
	<fmt:formatNumber  value='${price }' type='currency' currencySymbol='won'/>
<li>퍼센트 :
	<fmt:formatNumber value='${price }' type='percent'/>	
<li>천단위 :
	<fmt:formatNumber  value='${price }' pattern='###,###,###,###.##'/>	
</body>
</html>



