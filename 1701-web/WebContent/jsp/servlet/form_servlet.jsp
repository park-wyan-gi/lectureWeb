<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>form_servlet</title>
</head>
<body>

<div id='title'>
   아이디와 암호를 servlet에게 전송
</div>
<form name='frm' method='post' action='FormServlet'>
   <label>아이디</label>
   <input type='text' name='mid' value='park'/><br/>
   <label>암호</label>
   <input type='password' name='pwd' value='1111'><br/>
   <input type='submit' value='전송'/>
</form>

</body>
</html>