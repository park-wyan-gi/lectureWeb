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
int dan = Integer.parseInt(request.getParameter("dan"));
StringBuilder sb = new StringBuilder();
sb.append("단수:" + dan + "<br/>");

for(int i=1 ; i<10 ; i++){
	sb.append(dan + " * " + i + " = " + (dan*i) + "<br/>");
}
out.print(sb.toString());
%>
</body>
</html>


