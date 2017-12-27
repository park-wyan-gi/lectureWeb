<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>member_input_result.jsp</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="m" class="bean.Member" scope="page"/>
<jsp:setProperty property="*" name="m"/>


<ul>
   <li>아이디 : <%=m.getMid() %> </li>
   <li>성명 : <%=m.getIrum() %> </li>
   <li>암호 : <%=m.getPwd() %> </li>
   <li>성별 : <%=m.getGender()%> </li>
   <li>연락처 : <%=m.getPh1() %>-<%=m.getPh2() %>-<%=m.getPh3() %> </li>
   <li>이메일 : <%=m.getE1() %>@<%=m.getE2() %>.<%=m.getMid() %> </li>
   <li>관심사 : <%=Arrays.toString(m.getInter()) %> </li>
   <li>기타내용:<%=m.getEtc()%></li>
</ul>

</body>
</html>