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

<div id='insert_result'>
	<h3>회원가입 결과</h3>
	<%
	MemberDao dao = new MemberDao();
	boolean b = dao.insert(vo);
	if(b){
		out.print(vo.getMid() + " 님의 가입에 감사 드립니다.");
	}else{
		out.print("데이터 저장중 오류 발생");
	}
	%>
	
	
	<form name='frm_insert_result' method='post'>
		<input type='button' value='메인으로' name='btnMain' />
		<input type='button' value='목록으로' name='btnList' />
	</form>
	<script>initInsertResult()</script>
</div>
</body>
</html>