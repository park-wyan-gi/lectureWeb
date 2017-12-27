<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang='ko'>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name='viewport' content='width=device-width'>
<style>
#board{
   line-height: 190%;
}
#board>h2{
   background:linear-gradient(to right, #aaaaaa, #fefefe);
   padding:13px;
   box-sizing:border-box;
   border-radius:7px 7px;
}
#board label{
   display:inline-block;
   width:70px;
   text-align: right;
}
</style>
<title>board_input.jsp</title>
</head>
<body>
<div id='board'>
   <h2>게시판 입력(JSP)</h2>
	<form name='frm_board' method='post' 
	            action='tri_index.jsp?inc=../../board_jsp/board_input_result.jsp'>
	            
	   <label>작성자</label>
	   <input type='text' name='worker' value='kim'><br/>
	   <label>제목</label>
	   <input type='text' name='subject' value='hi.....' size='70'><br/>
	   <label></label>
	   <textarea rows="15" cols="72" name='content'>수고하세요~~</textarea>
	   <br/>
	   <label></label>
	   <input type='submit' value='작성'>
</form>
</div>
</body>
</html>