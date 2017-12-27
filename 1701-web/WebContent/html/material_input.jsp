<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>material_input</title>

<style>
form > label { width:70px; display:inline-block; text-align:right;}
</style>

</head>
<body>
<h3>제품코드입력<hr/></h3>

<form name='frm' method='post'>
	<label>코드</label>
	<input type='text' name='code'>
	<br/>
	<label>코드명</label>
	<input type='text' name='codeName'>	
	
	<br/>
	<label>규격</label>
	<input type='text' name='spec'>	
	
	<br/>
	<label>컬러</label>
	<input type='text' name='color'>	

	<br/>
	<label>브랜드</label>
	<input type='text' name='brand'>	

	<br/>
	<label>가격</label>
	<input type='text' name='price' value='0'>	
	<p/>
	<input type='submit' value='추가'/>
</form>

<h3>Result<hr/></h3>
<%
request.setCharacterEncoding("utf-8");
if(request.getMethod().equals("get")) return;
String code = request.getParameter("code");
String codeName = request.getParameter("codeName");

String spec = request.getParameter("spec");
String color = request.getParameter("color");
String brand = request.getParameter("brand");

String pri = request.getParameter("price");
DecimalFormat df = new DecimalFormat("#,###");
int price = 0;

try{
	price = Integer.parseInt(pri);
	pri = df.format(price);
}catch(Exception ex){
	pri = "0";
}


%>
<div>Code : <%=code %> </div>
<div>Code Name : <%=codeName %></div>
<div>Spec : <%=spec %></div>
<div>Color : <%=color %></div>
<div>Brand : <%=brand %></div>
<div>Price : <%=pri %></div>
</body>
</html>









