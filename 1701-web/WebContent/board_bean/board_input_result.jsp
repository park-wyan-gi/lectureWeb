<%@page import="bean.BoardDao"%>
<%@page import="bean.BoardVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang='ko'>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name='viewport' content='width=device-width'>
<title>board_input_result.jsp</title>
</head>
<body>
<h3>bean을 사용한 게시판 저장</h3>
<jsp:useBean id="vo" class="bean.BoardVo" scope="page"/>
<jsp:setProperty property="*" name="vo"/>
<%

BoardDao dao = new BoardDao();
int rs = dao.insert(vo);

if(rs>0){
	   out.print("내용이 정상적으로 입력되었습니다.");
	}else{
	   out.print("<font color='red'>저장중 오류 발생</font>");
	}
%>
<p/>
<a href='tri_index.jsp?inc=../../board_bean/board_list.jsp'>조회화면으로</a>

</body>
</html>