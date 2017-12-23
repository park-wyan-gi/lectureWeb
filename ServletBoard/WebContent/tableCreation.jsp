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
		if(tNames == null) return;
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

<script>
var frm = document.frm_tc;
var items = ['${paramValues.tName[0]}', '${paramValues.tName[1]}', 
			 '${paramValues.tName[2]}', '${paramValues.tName[3]}'];
for(i=0 ; i<4 ; i++){
	if(items[i] == 'board')    { frm.tName[0].checked=true; }
	if(items[i] == 'board_att'){ frm.tName[1].checked=true; }
	if(items[i] == 'member')   { frm.tName[2].checked=true; }
	if(items[i] == 'guestbook'){ frm.tName[3].checked=true; }
}
</script>


</body>
</html>