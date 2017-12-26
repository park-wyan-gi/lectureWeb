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
<div id='modify_result'>
<jsp:useBean id="vo" class="member.MemberVo" />
<jsp:setProperty property="*" name="vo"/>
<h3>회원 수정 결과</h3>

<%
String mid = request.getParameter("mid");

MemberDao dao = new MemberDao();
boolean b = dao.update(vo);

if(b){
	out.print("정상처리됨.");
}else{
	out.print("수정중 오류 발생");
	
}
%>
<p/>
	<form name='frm_modify_result' method='post'>
		<input type='button' value='메인으로' name='btnMain' />
		<input type='button' value='목록으로' name='btnList' />
		<input type='hidden' name='findStr' value='${param.findStr}' />
	</form>
</div>
<script>initModifyResult()</script>
</body>
</html>