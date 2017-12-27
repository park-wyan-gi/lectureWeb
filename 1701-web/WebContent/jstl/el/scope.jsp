<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>scope.jsp</title>
<style>
#title{
   background: linear-gradient(to right, #aaaaaa, #fefefe);
   padding: 9px;
   box-sizing:border-box;
   border-radius:5px;
}
</style>
</head>
<body>
<div id='title'>
  page, request, session, application에 파라메터를 저장 한 후 el 을
  사용하여 화면에 표시.
</div>
<%
pageContext.setAttribute("pc_irum", "pageConext value");
request.setAttribute("req_irum", "request value");
session.setAttribute("ses_irum", "session value");
application.setAttribute("ap_irum","application value");
%>
<ul>
   <li>PageContext value : ${pc_irum } </li>
   <li>Request : ${req_irum }</li>
   <li>Session : ${ses_irum }</li>
   <li>Application : ${ap_irum }</li>

</ul>
<a href='scope2.jsp'>각 영역의 값 유지여부 체크</a>
</body>
</html>