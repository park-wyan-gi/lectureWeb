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
<title>radio2</title>
<style>
.dcode{
	display:inline-block;
	width:180px;
}
</style>
<script>
function chkeckDept(dCode){
	var frm = document.frm;
	var len = frm.dCode.length;
	for(i=0 ; i<len ; i++){
		if(frm.dCode[i].value == dCode){
			frm.dCode[i].checked=true;
			break;
		}
	}
}
</script>
</head>
<body>
<%
String eId = "";
if(request.getMethod().equals("POST")){
	eId = request.getParameter("eId");
}

%>

<form name='frm' method='post' >
	<label>사번</label>
	<input type='text' name='eId'  size='7' value='<%=eId%>'>
	<input type='submit' value='검색' />
	
	<%
	// Connection 생성
	Connection conn = new DBConn().getConn();
	PreparedStatement ps = null;
	ResultSet rs = null;
	String sql = "";
	int dCode = 0;
	
	sql = "select * from emp where employee_id=?";
	ps = conn.prepareStatement(sql);
	ps.setString(1, eId);
	rs = ps.executeQuery();
	if(rs.next()){
		dCode = rs.getInt("department_id");
		out.print("<p>부서코드:" + rs.getInt("department_id") + "<br/>" );
		out.print("성명 : " + rs.getString("first_name"));
		out.print("</p>");
	}
	
	//Sql 문장
	sql = "select * from departments order by department_name asc ";
	ps = conn.prepareStatement(sql);
	rs = ps.executeQuery();
	//실행결과 표시
	StringBuilder sb = new StringBuilder();
	while(rs.next()){
		String temp = 
				String.format("<span class='dcode'>" 
		                                   + "<label><input type='radio' name='dCode' value='%d'>%s</label>"
															  + "</span>",
					rs.getInt("department_id"), rs.getString("department_name") );
			sb.append(temp);
	}
	out.print("<h3>부서명를 선택하세요</h3>");
	out.print(sb.toString());
	%>
</form>
<script>
	chkeckDept('<%=dCode%>');
</script>
</body>
</html>







