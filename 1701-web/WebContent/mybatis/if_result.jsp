<%@page import="java.util.List"%>
<%@page import="bean.DynamicVo"%>
<%@page import="myba.BoardFactory"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="vo" class="bean.DynamicVo"/>
<jsp:setProperty property="*" name="vo"/>

<ul>
	<li>Month : <%=vo.getMonth() %></li>
	<li>Worker : <%=vo.getWorker() %></li>
</ul>
<hr/>

<h2>RESULT</h2>

<%
SqlSession s = BoardFactory.getFactory().openSession();
if(s!= null) out.print("<div>session ok....</div>");
List<DynamicVo> v = s.selectList("dynamic.choose", vo);

//List<DynamicVo> v = s.selectList("dynamic.if", vo);


 for(int i=0; i<v.size() ; i++){
	DynamicVo t = v.get(i);
	out.print(t.getWorker() + "---" + t.getMonth() + "<br/>");
} 

%>
<hr/>

</body>
</html>