<%@page import="db.EmpVo"%>
<%@page import="db.DeptVo"%>
<%@page import="java.util.Vector"%>
<%@page import="db.EmpDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>select3</title>
<style>
#select3{
	width:415px;
}
#zone{
	overflow: hidden;
}
#zone > div{
	float:left;
}
#zone > div:first-child{
	margin-right:15px;
}
#find{
	text-align: right;
	margin-right:0px;
}
#depart, #emp{
	width:200px;
}
h1, h2{
	text-align: center;
}

#select3 > h2{
	background-color: #eeeeee;
	padding:12px;
	box-sizing:border-box;
}
</style>
<script>
window.onload = function(){
	var frm = document.frm;
	frm.btnFind.onclick = function(){
		frm.index.value = frm.depart.selectedIndex;
		frm.submit();
	}
	
	frm.depart.ondblclick = function(){
		frm.index.value = frm.depart.selectedIndex;
		frm.submit();
	}
	
}
</script>

</head>
<body>
<%
request.setCharacterEncoding("utf-8");
String dName = "";
int depart = -1;
int index = -1;
EmpDao dao = new EmpDao();
Vector<DeptVo> depts = null;
Vector<EmpVo> emps = null;

if(request.getMethod().equals("POST") ){
	dName = request.getParameter("dName");
	index = Integer.parseInt(request.getParameter("index"));
	if(request.getParameter("depart") != null){
		depart = Integer.parseInt(request.getParameter("depart"));
		emps = dao.getEmps(depart);
	}

	depts = dao.getDepts(dName);
}
%>

<div id='select3'>
<h1>부서별 직원조회</h1>
<form name='frm' method='post' >
	<input type='hidden' name='index' value='-1' />
	<div id='find'>
		<input type='text' name='dName' placeholder="부서명을 입력하세요." 
				value='<%=dName %>' />
		<input type='button' value='검색' name='btnFind' /><br/>
	</div>
	<div id='zone'>
		<div >
			<label>부서명</label><br/>
			<select size='10' name='depart' id='depart' >
			<%
			if(depts != null){
				for(int i=0 ; i<depts.size() ; i++){
					String sel = "";
					if(index == i) sel="selected";
					DeptVo v = depts.get(i);
					String str = String.format("<option value='%d'  %s>%s</option>",
								v.getdCode() , sel, v.getdName()  );
					out.print(str);
				}
			}
			
			%>
			</select>
		</div>
		
		<div>
			<label>직원명</label><br/>
			<select size='10' name='emp' id='emp'>
			<%
			for(int i=0 ; emps != null && i<emps.size() ; i++){
				EmpVo v = emps.get(i);
				String temp = String.format("<option>%s</option>", v.getFn());
				out.print(temp);
			}
			
			dao.dbClose();
			%>
			</select>
		</div>
	</div>

</form>
<h2>(주)JHTA1705</h2>
</div>
</body>
</html>