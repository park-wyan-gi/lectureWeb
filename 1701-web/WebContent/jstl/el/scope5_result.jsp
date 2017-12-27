<%@page import="bean.BoardVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>scope5_result.jsp</title>
</head>
<body>
<%request.setCharacterEncoding("utf-8"); %>

<h3>parameter</h3>
<ul>
   <li>worker : ${param.worker }</li>
   <li>subject : ${param.subject }</li>
   <li>content : ${param.content }</li>
</ul>

<h3>pageScope</h3>
<ul>
   <li>worker : ${pageScope.vo.worker }</li>
   <li>subject : ${pageScope.vo.subject }</li>
   <li>content : ${pageScope.vo.content }</li>
</ul>

<h3>bean tag value</h3>
<ul>
   <li>worker : ${vo.worker }</li>
   <li>subject : ${vo.subject }</li>
   <li>content : ${vo.content }</li>
</ul>

<h3>request</h3>
<ul>
   <li>worker : ${requestScope.vo.worker }</li>
   <li>subject : ${requestScope.vo.subject }</li>
   <li>content : ${requestScope.vo.content }</li>
</ul>


</body>
</html>










