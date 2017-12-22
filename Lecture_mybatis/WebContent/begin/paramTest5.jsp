<%@page import="java.util.ArrayList"%>
<%@page import="begin.BeginVo"%>
<%@page import="begin.BeginDao"%>
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
// 결과값이 collection 형인경우
BeginDao dao = new BeginDao();
BeginVo vo = new BeginVo();
vo.setMid("%a%");

ArrayList<BeginVo> l = (ArrayList)dao.list(vo);

out.print("Result : <ul>");
for(BeginVo v : l){
   out.print("<li>" + v.getIrum());
}

%>
</body>
</html>