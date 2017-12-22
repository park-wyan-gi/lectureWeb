<%@page import="uiux.MemberMybatis"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>member_insert_result</title>
</head>
<body>
<h3>회원가입결과</h3>
<jsp:useBean id='dao' class='uiux.MemberVo' scope='page'/>
<jsp:setProperty property="*" name="dao"/>
<%
MemberMybatis m = new MemberMybatis();//useBean과 100% 동일.

%>
<p/>
<a href='index.jsp?inpage=./member_myba/member_insert.jsp'>
	추가입력
</a>
	

</body>
</html>