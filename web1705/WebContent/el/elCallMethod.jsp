<%@page import="member.MemberVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>elCallMethod</title>
</head>
<body>
<%
MemberVo vo = new MemberVo();
vo.setMid("park");
vo.setPwd("1111");
vo.setNicName("java");

request.setAttribute("vo",vo);
%>

<h2>표현식</h2>
<ul>
	<li>id : <%=vo.getMid() %> </li>
	<li>pwd : <%=vo.getPwd() %> </li>
	<li>Nic : <%=vo.getNicName() %> </li>
</ul>

<h2>el</h2>
<ul>
	<li>id : ${vo.mid } </li>
	<li>pwd : ${vo.pwd } </li>
	<li>Nic : ${vo.nicName } </li>
</ul>

<h2>el을 사용한 값설정(setter)</h2>
${vo.setMid("kim") }
${vo.setPwd("3333") }
${vo.setNicName("jsp")}

<h2>el(after)</h2>
<ul>
	<li>id : ${vo.mid } </li>
	<li>pwd : ${vo.pwd } </li>
	<li>Nic : ${vo.nicName } </li>
</ul>






</body>
</html>