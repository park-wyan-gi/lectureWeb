<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
#login{
   text-align:right;
}
</style>
<script>
window.onload=function(){
	var btn = document.getElementById('btnLogout');
	if(btn != null){
		btn.onclick=function(){
			location.href='tri_logout.jsp';
		}
	}
}
</script>
</head>
<body>
<div id='login'>
	<%
	String id = (String)session.getAttribute("id");
	if(id != null){
	%>
	  <span>박원기님 방가...방가...</span>
	  <input type='button' value='로그이웃' id='btnLogout'>
	<%
	} else {
	%>
	<form name='frm' method='post' action='tri_login_result.jsp'>
	   <label>아이디</label>
	   <input type='text' name='id' value='aaa'>   
	   <label>암호</label>
	   <input type='password' name='pwd' value='1111'>
	
	   <input type='submit' value='로그인'/>
	</form>
	<%} %>
</div>
</body>
</html>