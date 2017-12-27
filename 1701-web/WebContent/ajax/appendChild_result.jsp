<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>AppendChild Result</h2>
<%
request.setCharacterEncoding("utf-8");
String q = request.getParameter("q");
String an_type = request.getParameter("answer_type");
String[] answer = request.getParameterValues("answer");

String type="radio";
if(an_type.equals("many")) type="checkbox";



out.print("질문:" + q + "<br/>");
out.print("정답유형:" + an_type);
out.print("<ol>");
for(int i=0 ; i<answer.length ; i++){ %>
	<li>
		<label>
			<input name='answer' type=<%=type%>>
					<%=answer[i]%>
		</label>
	</li>
<%
}
out.print("</ol>");
%>
</body>
</html>