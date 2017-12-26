<%@page import="guestbook.GuestBookDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="vo" class="guestbook.GuestBookVo"/>
<jsp:setProperty name="vo" property="*"/>

<div id='guestbook'>
	<h3> 방명록 작성결과111</h3>
	<%
		GuestBookDao dao = new GuestBookDao();
		boolean b = dao.insert(vo);
		String url = "index.jsp?inc=./guestbook/main.jsp&subInc=./guestbook/list.jsp";

		if(b){
			out.print("정상 처리됨.");
		}else{
			out.print("저장중 오류 발생");
		}
	%>
	 <p/>
	<a href="<%=url %>">목록으로</a>
	
</div>
</body>
</html>