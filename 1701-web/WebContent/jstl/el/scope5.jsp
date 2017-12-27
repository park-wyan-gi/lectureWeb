<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>scope5</title>
</head>
<body>
<form name='frm' method='post' action='ScopeServlet'>
   <label>작성자</label>
   <input type='text' name='worker' value='pwg'><br/>
   <label>제목</label>
   <input type='text' name='subject' value='hi....'><br/>
   <textarea rows="10" cols="60" name='content'>반가워요~~~~</textarea><p/>
   <input type='submit' value='전송'>
</form>
</body>
</html>