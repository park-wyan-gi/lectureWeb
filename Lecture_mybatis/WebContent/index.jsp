<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>index.jsp</title>
<style>
html{overflow: scroll;}

#main{
	width:1200px;
	margin:auto;
	border:0px solid #aaaaaa;
}

#center {
	overflow: hidden;
}
#center > div {
	float:left;
	display: inline-block;
	vertical-align:top;
}

#center #left{
	width:200px;
}
#center #contents{
	width:750px;
}
#center #right{
	width:250px;
}


#footer{
	margin-top:10px;
	width:100%;
	height:150px;
	border:0px solid #cccccc;
	/* background-image: url(./images/back7.png); */
	
	
}

</style>
<script src = './js/board.js'></script>
<script>
var param = new Object();


</script>

</head>
<body>
<%
request.setCharacterEncoding("utf-8");

String inc_left = "board_list.do";
String inc_right = "nonpage.jsp";
String inc = "nonpage.jsp";
String temp = null;
String part = null;
String nonpage = "nonpage.jsp";


//------------------------------------------------
// 왼쪽
//------------------------------------------------
if(request.getParameter("inc_left") != null){// 1) 서브content가 링크된 경우 
	inc_left = request.getParameter("inc_left");
}

//------------------------------------------------
//오른쪽 광고(aside)
//------------------------------------------------
if(request.getParameter("inc_right") != null){// 1) 서브content가 링크된 경우 
	inc_right = request.getParameter("inc_right");
}

//------------------------------------------------
// 컨텐츠내용(content)
// ------------------------------------------------
if(request.getParameter("inc") != null){// 1) 서브content가 링크된 경우 
	inc = request.getParameter("inc");
}
%>


<div id='main'>
	<div id='header'>
		<%@include file='top.jsp'%>
	</div>
	<div id='center'>
		<div id='left'>
			<jsp:include page="/board"  flush="true">
				<jsp:param value="board_list.do" name="inc"/>
			</jsp:include>			
		</div>
		
		<div id='contents'>
			<jsp:include page="/board"  flush="true">
				<jsp:param value="list.do" name="inc"/>
			</jsp:include>			
		
		</div>
		<div id='right'>
			<jsp:include page="/board" flush="true">
				<jsp:param value="aside.do" name="inc"/>
			</jsp:include>
		</div>
	</div>
	<div id='footer'>
		<%@include file='bottom.jsp'%>
	</div>
</div>

</body>
</html>







