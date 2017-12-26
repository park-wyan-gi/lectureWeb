<%@page import="java.sql.PreparedStatement"%>
<%@page import="db.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>emp_insert_result</title>
</head>
<body>
<h1>사원 입력 결과</h1>
<%
request.setCharacterEncoding("utf-8");
String empId = request.getParameter("employee_id");
String fn = request.getParameter("first_name");
String email = request.getParameter("email");
String hDate = request.getParameter("hire_date");
String salary = request.getParameter("salary");
String dCode = request.getParameter("dCode");

int eId = Integer.parseInt(empId);
double sal = Double.parseDouble(salary);

%>

<h2>요청 정보 확인</h2>
<ul>
	<li><b>사번 : </b><font color='#0000ff'> <%=empId %></font> </li>
	<li><b>성명 : </b> <%=fn %> </li>
	<li><b>이메일 :  </b><%=email %> </li>
	<li><b>입사일 :  </b><%=hDate %> </li>
	<li><b>급여 : </b> <font color='#ff0000'><%=salary %> </font></li>
</ul>
<%
Connection conn = new DBConn().getConn();
PreparedStatement ps = null;
String sql = "insert into emp(employee_id, first_name, email, " 
									+ " hire_date, salary, department_id) "
									+ " values(?,?,?,?,?, ?) ";
ps = conn.prepareStatement(sql);

ps.setInt(1, eId);
ps.setString(2, fn);
ps.setString(3, email);
ps.setString(4, hDate);
ps.setDouble(5, sal);
ps.setString(6, dCode);

int r = ps.executeUpdate();
if(r >0){
	out.print("데이터가 정상적으로 입력되었습니다.");
}else{
	out.print("데이터 입력중 오류 발생....");
}
%>
<p/>
| <a href='emp_insert.jsp'>사원 입력</a> | 
<a href='find_emp.jsp'>사원 조회</a> |
<a href='emp_list.jsp' >사원 목록</a> |

</body>
</html>











