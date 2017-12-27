<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>scope2.jsp</title>
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
  page, request, session, application에 저장된 값의 유지 여부 체크
</div>

<ul>
   <li>PageContext value : ${pc_irum } </li>
   <li>Request : ${req_irum }</li>
   <li>Session : ${ses_irum }</li>
   <li>Application : ${ap_irum }</li>
</ul>

</body>
</html>