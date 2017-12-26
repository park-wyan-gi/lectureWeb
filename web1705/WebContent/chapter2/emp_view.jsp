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
<title>emp_view</title>

<script>
function modifyFunc(ff){
	var yn = confirm("정말 수정하시겠습니까 ???");
	if(yn){
		var url = "emp_modify.jsp";
		ff.action = url;
		ff.submit();
		
	}else{
		alert("작업이 취소 되었습니다.");
	}
	
}

function deleteFunc(ff){
	var empId = ff.empId.value;
	var fn = ff.first_name.value;
	var yn = confirm("[ " + fn + " ]님의 정보를 삭제 하시겠습니까 ?");
	if(yn){
		var url = "emp_delete.jsp?empId=" + empId;
		location.href = url;
	}
}

function removeNull(){
	var ff = document.forms[0];
	var tags = ff.getElementsByTagName('input');
	
	for(i=0 ; i<tags.length ; i++){
		if(tags[i].type == 'text' || tags[i].type=='date'){
			if(tags[i].value == 'null') tags[i].value = '';
		}
	}
}

</script>

</head>
<body>
<h1>사원정보 상세보기</h1>
<%
String empId = request.getParameter("empId");
Connection conn = new DBConn().getConn();
PreparedStatement ps = null;
ResultSet rs = null;
String sql = "select * from emp where employee_id = ? ";
ps = conn.prepareStatement(sql);
ps.setString(1, empId);
rs = ps.executeQuery();

if(rs.next()){ %>
	<form method='post' name='frm'>
		<label>사번</label>
		<input type='text' name='empId'  readonly value='<%=rs.getString("employee_id") %>' /><br/>

		<label>사원명</label>
		<input type='text' name='first_name' value = '<%=rs.getString("first_name") %>' /> -
		<input type='text' name='last_name' value = '<%=rs.getString("last_name") %>' /> <br/>
		
		<label>이메일</label>
		<input type='text' name='email' value = '<%=rs.getString("email") %>'><br/>
		
		<label>연락처</label>
		<input type='text' name='phone_number' value='<%=rs.getString("phone_number") %>' /> <br/>
		
		<label>입사일</label>
		<input type='date' name='hire_date' value= '<%=rs.getDate("hire_date") %>' /><br/>
		
		<label>직무코드</label>
		<input type='text' name='job_id' value= '<%=rs.getString("job_id") %>' /><br/>
		
		<label>급여</label>
		<input type='text' name='salary' value='<%=rs.getDouble("salary") %>' /><br/>

		<label>수수료</label>
		<input type='text' name='commission_pct' value= '<%=rs.getDouble("commission_pct") %>' /><br/>
		
		<label>매니져 아이디</label>
		<input type='text' name='manager_id' value = '<%=rs.getString("manager_id") %>' /> <br/>
		
		<label>부서 코드</label>
		<input type='text' name='department_id' value = '<%=rs.getString("department_id") %>' /><br/>					
	
		<br/>
		<input type='button' value='수정'   onclick = 'modifyFunc(this.form)'/>
		<input type='button' value='삭제'  onclick = 'deleteFunc(this.form)' />
	
	</form>	
	
	
	
	
<% } %>

<a href='emp_list.jsp' >사원 목록</a>
<script>
	removeNull();
</script>
</body>
</html>






