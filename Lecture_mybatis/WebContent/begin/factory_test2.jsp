<%@page import="begin.BeginFactory2"%>
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
// Factory 생성 테스트

SqlSession sqlSession = null;

try{
   sqlSession = BeginFactory2.getFactory().openSession();
   
   if(sqlSession == null){
      out.print("SqlSession 생성중 오류 발생...");
   }else{
      out.print("SqlSession이 정상적으로 생성되었습니다...");
   }
   sqlSession.close();
}catch(Exception ex){
   out.print(ex.toString());
}finally{
   
}
%>
</body>
</html>