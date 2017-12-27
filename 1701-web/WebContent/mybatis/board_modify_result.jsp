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
<h2>myBatis 게시판 수정</h2>
<%request.setCharacterEncoding("utf-8"); %>
<h2>myBatis로 만든 게시판 수정</h2>

<jsp:useBean id="vo" class="bean.BoardVo" scope="page"/>
<jsp:setProperty property="*" name="vo"/>
<%
SqlSession s = BoardFactory.getFactory().openSession();
int r = s.update("member.brd_modify", vo);
s.commit();
if(r>0) out.print("정상적으로 수정됨");
else    out.print("수정 중 오류 발생");
s.close();
%>
<p/>
<a href='board_list.jsp'>목록으로 이동</a>
</body>
</html>







