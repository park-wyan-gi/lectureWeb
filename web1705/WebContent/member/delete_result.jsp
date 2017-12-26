<%@page import="member.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="vo" class="member.MemberVo" />
<jsp:setProperty property="*" name="vo"/>
<%
MemberDao dao = new MemberDao();
boolean b = dao.delete(vo);

if(b) {
	out.print("정상적으로 삭제되었음,.");
}else{
	out.print("삭제중 오류 발생");
}
%>


<div id='delete_result'>
	<h3>회원 삭제 결과</h3>
	<form name='frm_delete_result' method='post'>
		<input type='button' value='메인으로' name='btnMain' />
		<input type='button' value='목록으로' name='btnList' />
		<input type='hidden' name='findStr' value='${param.findStr }'/>
	</form>
</div>
<script>initDeleteResult()</script>
</body>
</html>