<%@page import="uiux.MemberMybatis"%>
<%@page import="java.util.List"%>
<%@page import="uiux.MemberVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>member view</title>
</script>
</head>
<body>
<jsp:useBean id='vo' class='uiux.MemberVo' scope='page'/>
<jsp:setProperty name='vo' property='*'/>
<%
String mid = vo.getMid();
MemberMybatis member = new MemberMybatis();
member.setMemberVo(vo);
MemberVo memberVo = member.view();

%>
<h3>회원 상세 보기</h3>

<ul>		
	<li>mid : <%=memberVo.getMid()%></li>
	<li>irum : <%=memberVo.getIrum()%></li>
	<li>address : <%=memberVo.getAddress()%></li>
	<li>gender : <%=memberVo.getGender()%></li>
	<li>phone : <%=memberVo.getPhone()%></li>
</ul>

</body>
</html>





