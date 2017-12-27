<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>board_repl</title>
</head>
<body>
<div id='board'>
   <h2>게시판 댓글 입력(Servlet)</h2>
   <form name='frm_board' method='post'  action='repl_result.do' enctype='multipart/form-data'>
               
      <label>작성자</label>
      <input type='text' name='worker' value='repl'><br/>
      <label>제목</label>
      <input type='text' name='subject' value='답변)hi.....' size='70'><br/>
      <label></label>
      <textarea rows="15" cols="72" name='content'>답변)수고하세요~~</textarea>
      <br/>
       <label>첨부파일</label><br/>
       <label></label>
       <input type='file'  name='fileName1'><br/>
         
       <label></label>
       <input type='file'  name='fileName2'>
      
      <label></label>
      <input type='submit' value='댓글 작성'>
      <input type='hidden' name='findStr'     value="${obj.findStr }"/>
      <input type='hidden' name='nowPage'  value="${obj.nowPage }"/>
      <input type='hidden' name='serial'        value="${obj.serial }"/>
      <input type='hidden' name='grp'           value="${obj.grp }"/>
      <input type='hidden' name='deep'         value="${obj.deep }"/>
      
</form>

</body>
</html>