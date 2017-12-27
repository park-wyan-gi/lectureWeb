<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>첨부파일 삭제</h2>
<%
String uploadPath = "c:/workspace/1701-web/WebContent/upload/";
String temp = request.getParameter("file");
File file = new File(uploadPath + temp);
if(file.exists()){
	file.delete();
	out.print("파일이 삭제됨");
	out.print("<script>opener.location.reload();self.close();</script>");
	
}else{
	out.print("삭제중 오류 발생");
}
%>

</body>
</html>