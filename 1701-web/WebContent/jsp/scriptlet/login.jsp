<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
window.onload=function(){
	var btn = document.getElementById('btnLogout');
	btn.onclick=function(){
		location.href='logout.jsp';
	}
}
</script>
</head>
<body>
<%
String id = (String)session.getAttribute("id");
if(id != null){
%>
  <span>박원기님 방가...방가...</span>
  <input type='button' value='로그이웃' id='btnLogout'>
<%
} else {
%>
<form name='frm' method='post' action='login_result.jsp'>
   <label>ID</label>
   <input type='text' name='id' value='park w.g'><br/>
   
   <label>Pass Word</label>
   <input type='password' name='pwd' value='1111'><p/>

   <input type='submit' value='Send'/>
</form>
<%} %>


</body>
</html>