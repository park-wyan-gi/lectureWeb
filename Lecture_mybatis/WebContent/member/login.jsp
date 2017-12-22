<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>sessionTest.jsp</title>
<style>
#login_back{
	background-image:url(./images/login.png);
	height:100px;
	background-repeat:no-repeat;
}
.login_btn{width:136px;height:40px;}
.logout_btn{width:136px;height:40px;margin-top:5px;}
.login_lbl{display:inline-block; width:40px; text-align:right;}
#login_message{margin-left:-20px;}
#login_mid{position:relative;border-width:0px;
	top:3px;left:50px;background-color:rgba(255,255,255,0);
}
#login_pwd{position:relative;border-width:0px;
	top:16px;left:50px;background-color:rgba(255,255,255,0);
}#login_btn{position:relative;border-width:0px;
	top:20px;left:0px;
}
</style>
</head>
<body>
<%
	// 세션정보를 가져오기
	String mid = (String)session.getAttribute("mid");
	if(mid==null || mid.equals("")){//로그인전 화면
%>
<!-- 
	<form name='login_form' method='post'
		  action='./member/login_result.jsp'>
		  <label class='login_lbl'>I&nbsp;D</label>
		  <input type='text' name='mid' value='park' size='10'><br/>
		  <label class='login_lbl'>암 호</label>
		  <input type='password' name='pwd' value='1111' size='10'><br/>
		  <input type='submit' value='로그인' class='login_btn'>
	</form>
 -->
 	<div id='login_back'>
	<form name='login_form' method='post'
			action='./member/login_result.jsp'>
		<input type='text' name='mid' value='park' size='11' id='login_mid'>
		<input type='password' name='pwd' value='1111' size='11' id='login_pwd'>
		<input type='image' src='./images/login_btn.png' id='login_btn'>	
	</form>
	</div>
<%	}else{//로그인 후 화면 %>
	<%=mid %> 님 방가..<hr/>
	<div id='login_message'>
		<ul>
			<li>메시지 : 5통
			<li>이메일 :10통
		</ul>
	</div>
	<input type='button' value='로그아웃' class='logout_btn'
		onclick="location.href='./member/logout_result.jsp'">	
<%	} %>
</body>
</html>








