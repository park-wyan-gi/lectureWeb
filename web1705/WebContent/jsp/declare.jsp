<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>declare</title>
</head>
<body>
<h2>declare(선언문)</h2>
<%
	int a=10;
	int b=20;
	out.print(a+b);
	out.print(sum());
%>
<%!//전역형 변수와 메서드선언
	int x=11;
	int y=22;

	public int sum(){
		int r = x+ y;
		return r;
	}
%>

</body>
</html>




