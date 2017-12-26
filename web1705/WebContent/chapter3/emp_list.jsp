<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="db.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>emp_list</title>
<link rel='stylesheet' type='text/css' href='emp_list.css' />
</head>
<body>
<%
String findStr = "";
ResultSet rs = null;
request.setCharacterEncoding("utf-8");
if(request.getMethod().equals("POST")){
	findStr = request.getParameter("findStr");
	
	Connection conn = new DBConn().getConn();
	PreparedStatement ps = null;
	
 	String sql = "select  employee_id, first_name, phone_number, email, hire_date,"
			              + "             to_char(salary, '999,999.99') sal, "
									  + "             d.department_id dCode , d.department_name  dName "
										+ " from   emp e left  join departments d " 
										+ " on        e.department_id = d.department_id "
										+ " where  first_name like ? "
			              + " or         phone_number like ? "
			            	+ " or         email like ? ";
	
	ps = conn.prepareStatement(sql);
	ps.setString(1, "%" + findStr + "%");
	ps.setString(2, "%" + findStr + "%");
	ps.setString(3, "%" + findStr + "%");
	
	rs = ps.executeQuery(); 
}
%>

<h1><center>사원목록</center></h1>
<form method='post'>
	<a href='emp_insert.jsp'>입력</a>
	<input type='text' name='findStr' value='<%=findStr%>'/>
	<input type='submit' value='검색' />
</form>

<div>
	<div id='header'>
		<span class='no'>No</span>
		<span class='eid'>사번</span>
		<span class='fn'>성명</span>
		<span class='ph'>연락처</span>
		<span class='em'>이메일</span>
		<span class='hd'>입사일</span>
		<span class='sal'>급여</span>
		<span class='dc'>부서코드</span>
		<span class='dn'>부서명</span>		
	</div>
	<!-- 검색된 데이터 -->
	<%
	int no = 1;
	while(rs != null && rs.next() ){
		String url = String.format("<a href='emp_view.jsp?empId=%d'>%d</a>",
																rs.getInt("employee_id"),rs.getInt("employee_id") );
		out.print("<div class='list'>");
		out.print("<span class='no'>" + no                                                    + "</span>");
		out.print("<span class='eid'>" + url                                                   + "</span>");
		out.print("<span class='fn'>" + rs.getString("first_name")        + "</span>");
		out.print("<span class='ph'>" + rs.getString("phone_number") + "</span>");
		out.print("<span class='em'>" + rs.getString("email")                  + "</span>");
		out.print("<span class='hd'>" + rs.getDate("hire_date")              + "</span>");
		out.print("<span class='sal'>" + rs.getString("sal")                        + "</span>");
		out.print("<span class='dc'>" + rs.getString("dCode")                 + "</span>");
		out.print("<span class='dn'>" + rs.getString("dName")               + "</span>");
		out.print("</div>");
		no++;
	}
	
	%>
	
</div>

</body>
</html>












