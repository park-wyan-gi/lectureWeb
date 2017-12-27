<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>choose_result</title>
</head>
<body>
<%
//jsp에서 폼의 파라메터를 가져오는 방법
String kor = request.getParameter("kor");
String eng = request.getParameter("eng");
%>
<!--  el을 사용하여 파라메터를 가져오는 방법 -->
<li>KOR = ${param.kor }</li>
<li>ENG = ${param.eng }</li>

<!-- jstl에서 파라메터 사용하기 -->
<c:set var="kor" value="${param.kor }"/>
<c:set var="eng" value="${param.eng }"/>
<c:set var="tot" value ="${(kor + eng)/2.0 }"/>

<c:choose>
   <c:when test="${tot>=90 }">
      <c:set var="grade" value="A"/>
   </c:when>
   <c:when test="${tot>=80 }">
      <c:set var="grade" value="B"/>
   </c:when>
   <c:when test="${tot>=70 }">
      <c:set var="grade" value="C"/>
   </c:when>
   <c:when test="${tot>=60 }">
      <c:set var="grade" value="D"/>
   </c:when>
   <c:when test="${tot<60 }">
      <c:set var="grade" value="F"/>
   </c:when>
</c:choose>

Grade = ${grade } <br/>
<c:out value="${grade }"/>


</body>
</html>






