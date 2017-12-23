<%@page import="bean.TableCreation"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id=''>
	<h3>Table Creation</h3>
	<div> 아래의 테이블명을 선택하면 시퀀스는 자동으로 초기화되어 생성됩니다.</div>
	<form name='frm_tc' method='post' >
		<fieldset>
			<legend>테이블명</legend>
				<label><input type='checkbox' name='tName' value='board'>자료실</label>
				<label><input type='checkbox' name='tName' value='board_att'>자료실 첨부 테이블</label>
				<label><input type='checkbox' name='tName' value='member'>회원관리</label>
				<label><input type='checkbox' name='tName' value='guestbook'>방명록</label>
		</fieldset>
		<p/>
		<input type='submit' value='생 성' id='btnCreate' name='btnCreate'/>
	</form>
	
	<%
		if(!request.getMethod().equals("POST")) return;
		String msg = "";
		TableCreation tc = new TableCreation();
		String[] tNames = request.getParameterValues("tName");
		for(String tName : tNames){
			if(tName.equals("board")){
				msg += "<li>" + tc.createBoard(tName);
			}
			else if(tName.equals("board_att")){
				msg += "<li>" + tc.createBoardAtt(tName);
			}
			else if(tName.equals("member")){
				msg += "<li>" + tc.createMember(tName);
			}
			else if(tName.equals("guestbook")){
				msg += "<li>" + tc.createGuestbook(tName);
			}
		}
		
		
	%>
	
	<%=msg %>
</div>
</body>
</html>