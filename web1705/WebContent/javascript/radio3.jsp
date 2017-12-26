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
<title>radio3</title>
<style>
.chk {
	display:inline-block;
	width:120px;
	color:#888888;
}

.btn:checked+span {
	background: #ffff00;
	color:#ff0000;
}
</style>
<script>
function checkManage(mId){
	var frm = document.frm;
	var len = frm.chk.length;
	//class가 fn모든 태그 가져옴.
	var e = document.querySelectorAll('.chk');
	for(i=0 ; i<len ; i++){
		if(frm.chk[i].value == mId){
			e[i].style.backgroundColor='#aaaaff';
			frm.chk[i].checked=true;
		}
	}
	frm.eId.focus();
	frm.eId.select();
}
</script>

</head>
<body>
<%
String eId = "";
String mId=""; //매니져 아이디
String fn = "";
request.setCharacterEncoding("utf-8");
if(request.getMethod().equals("POST")){
	eId = request.getParameter("eId");
}

%>
<h1>매니져 변경</h1>
<form name='frm' method='post' >
	<input type='text' size='7' name='eId' value='<%=eId %>' />
	<input type='submit' value='검색' />
	<%
		Connection conn = new DBConn().getConn();
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = null;
		
		sql = "select * from employees where employee_id=?";
		ps = conn.prepareStatement(sql);
		ps.setString(1, eId);
		rs = ps.executeQuery();
		if(rs.next()){
			fn = rs.getString("first_name");
			mId = rs.getInt("manager_id") + "";
		}
		
		out.print("성명 : " + fn);
		out.print(" , 매니져 아이디 : " + mId);
		out.print("<hr/>");
		
		//매니져 목록 ----------------------------------
		sql = "select employee_id, first_name from employees order by first_name ";
		ps = conn.prepareStatement(sql);
		rs = ps.executeQuery();
		
		while(rs.next()){ 
			 int tId = rs.getInt("employee_id");
			 String tFn = rs.getString("first_name");
		%>
			<label class='chk'>
				<input type='radio' name='chk' value='<%=tId%>' class='btn'>
						<span><%=tFn %></span>
			</label>
		<%}
	%>

</form>
<script> checkManage('<%=mId%>')</script>
</body>
</html>




