<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>tri_index.jsp</title>
<style>
#main{
   width:1000px;
   margin:auto;
}

</style>
</head>
<body>
<%
String inc = request.getParameter("page");
if(inc == null) inc="tri_main.jsp";

%>

<div id='main'>
  <div><%@include file="tri_login.jsp" %></div>
   <div>
      <%@include file="tri_header.jsp" %>
   </div>
   <div><jsp:include page="<%=inc %>"/></div>
   <div>
      <%@include file="tri_footer.jsp" %>
   </div>
</div>
</body>
</html>