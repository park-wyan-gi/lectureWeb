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

<table border='1' width="90%" cellpadding='4px' cellspacing='0'>
	<tr>
		<th>No</th>
		<th>사번</th>
		<th>성명</th>
		<th>연락처</th>
		<th>이메일</th>
		<th>입사일</th>
		<th>급여</th>
		<th>부서코드</th>
		<th>부서명</th>		
	</tr>
	<!-- 검색된 데이터 -->
	<%
	int no = 1;
	while(rs != null && rs.next() ){
		String url = String.format("<a href='emp_view.jsp?empId=%d'>%d</a>",
																rs.getInt("employee_id"),rs.getInt("employee_id") );
		out.print("<tr>");
		out.print("<td align='center'>" + no                         + "</td>");
		out.print("<td>" + url                                                   + "</td>");
		out.print("<td>" + rs.getString("first_name")        + "</td>");
		out.print("<td>" + rs.getString("phone_number") + "</td>");
		out.print("<td>" + rs.getString("email")                  + "</td>");
		out.print("<td>" + rs.getDate("hire_date")              + "</td>");
		out.print("<td align='right'>" + rs.getString("sal") + "</td>");
		out.print("<td>" + rs.getString("dCode")                 + "</td>");
		out.print("<td>" + rs.getString("dName")               + "</td>");
		out.print("</tr>");
		no++;
	}
	
	%>
	
</table>

</body>
</html>












