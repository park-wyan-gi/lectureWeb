<%@page import="java.sql.PreparedStatement"%>
<%@page import="db.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>emp_modify</title>
</head>
<body>
<h1>사원 정보 수정</h1>
<%
request.setCharacterEncoding("utf-8");
		
String empId = request.getParameter("empId");
String fn = request.getParameter("first_name");
String ln = request.getParameter("last_name");
String email = request.getParameter("email");
String pn = request.getParameter("phone_number");
String hd = request.getParameter("hire_date");
String jId = request.getParameter("job_id");
String salary = request.getParameter("salary");
String pct = request.getParameter("commission_pct");
String mId = request.getParameter("manager_id");
String dId = request.getParameter("department_id");

Connection conn = new DBConn().getConn();
PreparedStatement ps = null;
String sql = "update emp set "
									+ " first_name = ? ,  last_name = ? , "
									+ " email = ? ,  phone_number = ? , "
									+ " hire_date = ?, job_id = ? , "
									+ " salary = ?, commission_pct = ?, "
									+ " manager_id = ?, department_id = ? "
									+ " where employee_id = ? ";

ps = conn.prepareStatement(sql);
ps.setString(1, fn);
ps.setString(2, ln);
ps.setString(3, email);
ps.setString(4, pn);
ps.setString(5, hd);
ps.setString(6, jId);
ps.setString(7, salary);
ps.setString(8, pct);
ps.setString(9, mId);
ps.setString(10, dId);
ps.setString(11, empId);

int yn = ps.executeUpdate();
if(yn > 0){
	out.print("<b>" + empId);
	out.print("(" + fn + ") </b> 님의 <font color='#0000ff'>정보가 수정되었습니다.</font>");
}else{
	out.print("<font color='#ff0000'>수정작업중 오류 발생</font>");
}


%>
<p/>
<a href = "emp_view.jsp?empId=<%=empId %>">상세보기</a> | 
<a href="emp_list.jsp">사원목록</a>







</body>
</html>