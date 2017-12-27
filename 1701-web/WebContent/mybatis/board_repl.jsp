<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>myBatis 게시판 댓글</h2>
<jsp:useBean id="vo" class="bean.BoardVo" scope="page"/>
<jsp:setProperty property="*" name="vo"/>

<form name='frm' method='post' 
      action='board_repl_result.jsp'>
      
	<label>작성자</label>
	<input type='text' name='worker' value='pwg'><br/>

	<label>제목</label>
	<input type='text' name='subject' size='70' value='공지사항'><br/>
	
	<label>내용</label>
	<textarea name='content'rows="10" cols="68">긴급공지입니다.</textarea>	
	<p/>
	
	<input type='hidden' name='serial' value='<%=vo.getSerial()%>'>
	<input type='hidden' name='grp'    value='<%=vo.getGrp()%>'>
	<input type='hidden' name='deep'   value='<%=vo.getDeep()%>'>
	
	<input type='submit' value='댓글달기'/>   
</form>
</body>
</html>