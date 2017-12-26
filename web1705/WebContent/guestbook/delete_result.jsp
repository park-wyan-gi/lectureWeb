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
<jsp:useBean id="vo" class="guestbook.GuestBookVo" />
	<jsp:setProperty name="vo" property="*" />

	<div id='gb_delete_result'>
		<%
			String url = "index.jsp?inc=./guestbook/main.jsp&subInc=./guestbook/list.jsp";

			GuestBookDao dao = new GuestBookDao();
			boolean b = dao.delete(vo);
			if (!b) {
				out.print("삭제 중 오류 발생");
			} else {
				out.print("<script>location.href='" + url + "'</script>");
			}
		%>
	</div>
</body>
</html>