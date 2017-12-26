<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="member.MemberVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>set</title>
</head>
<body>
<h2>set</h2>
<p>
	<ul>
		<li>&lt c:set var='변수명' valus='값' [scope=''] </li>
		<li>&lt c:set var='변수명' [scope=''] >값 &lt /set></li>
	</ul>
	<hr/>
</p>
<h4>type 1</h4>
<c:set var = 'a' value='10' />
<li>a=${a }

<h4>type 2</h4>
<c:set var='b' >100</c:set>
<li>b=${b }

<h4>type 3</h4>
<c:set var='c' value='${a+10 }' />
<li>c=${c }

<h4>type 4</h4>
<c:set var='d'> ${b*100 }</c:set>
<li>d=${d }

<h4>type 5</h4>
<div>자바객체 사용</div>
<%
MemberVo vo = new MemberVo();
request.setAttribute("v", vo);
%>
<c:set target='${v }' property="mid" value="kim.C" />
<c:set target='${v }' property="pwd" value="1234" />
<c:set target='${v }' property="nicName" value='김씨' />

<li>id = ${v.mid }
<li>pwd = ${v.pwd }
<li>nic = ${v.nicName }


<h4> type 6(Map)</h4>
<%
Map<String, String> map = new HashMap<String, String>();
request.setAttribute("m", map);
%>
<c:set target='${m }' property="id"       value="park C" />
<c:set target='${m }' property="name" value='박씨' />

<li>id = ${m.get("id") }
<li>name = ${m.get("name") }


</body>
</html>























