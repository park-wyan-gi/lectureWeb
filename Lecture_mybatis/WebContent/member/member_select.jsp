<%@page import="java.util.ArrayList"%>
<%@page import="uiux.MemberMybatis"%>
<%@page import="java.util.List"%>
<%@page import="uiux.MemberVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
.list>li{
	display:inline-block;
	
}
</style>
<title>member_select</title>
 
</head>
<body>
<jsp:useBean id='vo' class='uiux.MemberVo'/>
<jsp:setProperty name='vo' property='*'/>
<h3>회원조회</h3>
<form name='ms_select_frm' method='post' action='member_select.jsp'>
	<label>회원조회</label> 
	<input type='text' name='findStr' id='findStr' value="<%=vo.getFindStr() %>"
		placeholder='아이디 또는 성명'>
	<input type='submit' value='전송'>
</form>

<hr/>
<%
	MemberMybatis member = new MemberMybatis();
	member.setMemberVo(vo);
	ArrayList<MemberVo> list = member.select();
	out.print("Size : " + list.size());
	
	for(int i=0 ; i<list.size() ; i++){
		MemberVo memberVo = list.get(i);
		if(memberVo == null) continue;
			String url="member_view.jsp?mid="+memberVo.getMid();
%>		
		<ul class='list'>		
			<li><a href='<%=url%>'><%=memberVo.getMid()%></a></li>
			<li>irum : <%=memberVo.getIrum()%></li>
			<li>address : <%=memberVo.getAddress()%></li>
			<li>gender : <%=memberVo.getGender()%></li>
			<li>phone : <%=memberVo.getPhone()%></li>
		</ul>
	<%}
%>
</body>
</html>





