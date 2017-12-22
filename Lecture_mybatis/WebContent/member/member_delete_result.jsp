<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>member_delete_result</title>
<script>
function init(findStr){
	document.getElementById('mem_listBtn').onclick= function(){
		var url='index.jsp?inpage=./member_myba/member_select.jsp';
		url += '&findStr=' + findStr;
		
		var f = document.createElement("form");
		var txt = document.createElement('input');
		txt.name='findStr';
		txt.value = findStr;
		f.action = url;
		f.method = 'post';
		f.appendChild(txt);
		document.body.appendChild(f);
		f.submit();

	}
}
</script>
</head>
<body>
<jsp:useBean id='dao' class='uiux.MemberVo' scope='page'/>
<jsp:setProperty name='dao' property='*'/>
<jsp:useBean id='m' class='uiux.MemberMybatis' scope='page'/>
<%
%>	

<button id='mem_listBtn'>목록으로 이동</button>
<script>init('<%=dao.getFindStr()%>')</script>
</body>
</html>