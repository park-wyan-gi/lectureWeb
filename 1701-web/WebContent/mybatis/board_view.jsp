<%@page import="bean.BoardVo"%>
<%@page import="myba.BoardFactory"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
function init(){
	var ff = document.frm;
	document.getElementById('btnModify').onclick=function(){
		ff.action='board_modify_result.jsp';
		ff.submit();
	}
	document.getElementById('btnDelete').onclick=function(){
		var yn = confirm("정말 삭제하시겠습니까 ???");
		if(yn){
			ff.action ='board_delete_result.jsp';
			ff.submit();
		}
	}
	document.getElementById('btnRepl').onclick=function(){
		ff.action='board_repl.jsp';
		ff.submit();
	}
	
}
</script>
</head>
<body>
<%request.setCharacterEncoding("utf-8"); %>
<h2>myBatis로 만든 게시판 상세보기 및 수정</h2>

<jsp:useBean id="vo" class="bean.BoardVo" scope="page"/>
<jsp:setProperty property="*" name="vo"/>
<%
SqlSession s = BoardFactory.getFactory().openSession();
BoardVo v = (BoardVo)s.selectOne("member.brd_view", vo);
s.close();
%>

<form name='frm' method='post' action='board_modify_result.jsp'>
	<label>작성자</label>
	<input type='text' name='worker' readonly value='<%=v.getWorker()%>'>
	<br/>
	<label>제목</label>
	<input type='text' size='70' name='subject' value='<%=v.getSubject()%>'>
	<br/>
	<textarea rows="10" cols="68" name='content'><%=v.getContent() %></textarea>
	
	<input type='hidden' name='serial' value='<%=v.getSerial()%>'>
	<input type='hidden' name='grp'    value='<%=v.getGrp()%>'>
	<input type='hidden' name='deep'   value='<%=v.getDeep()%>'>
	
	<p/>
	<input type='button' value='수정' id='btnModify'>
	<input type='button' value='삭제' id='btnDelete'>
	<input type='button' value='댓글' id='btnRepl'>
</form>

<script>init();</script>
</body>
</html>