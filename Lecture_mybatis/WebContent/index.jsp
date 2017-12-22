<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index.jsp</title>
<style>
html{overflow: scroll;}

#main{
	width:1200px;
	margin:auto;
	border:0px solid #aaaaaa;
}
#bottom{
	margin-top:10px;
	width:100%;
	height:250px;
	border:0px solid #cccccc;
	/* background-image: url(./images/back7.png); */
	
	
}
#left{
	vertical-align:top;
	width:250px;
	margin:0px;
	display:inline-block;
}
#contents{
	vertical-align:top;
	width:748px;
	margin:0px;
	display:inline-block;
}
#right{
	vertical-align:top;
	width:190px;
	margin:0px;
	display:inline-block;
}
</style>
<script>
var param = new Object();


</script>

</head>
<body>
<%
request.setCharacterEncoding("utf-8");

String inc_left = "nonpage.jsp";
String inc_right = "nonpage.jsp";
String inc_content = "nonpage.jsp";
String temp = null;
String part = null;
String nonpage = "nonpage.jsp";
//------------------------------------------------
//왼쪽 메뉴
// ------------------------------------------------
if(request.getParameter("inc_left") != null){// 1) 서브content가 링크된 경우 
	inc_left = request.getParameter("inc_left");
}

//------------------------------------------------
// 오른쪽 광고(aside)
// ------------------------------------------------
if(request.getParameter("inc_right") != null){// 1) 서브content가 링크된 경우 
	inc_right = request.getParameter("inc_right");
}

//------------------------------------------------
// 컨텐츠내용(content)
// ------------------------------------------------
if(request.getParameter("inc_content") != null){// 1) 서브content가 링크된 경우 
	inc_content = request.getParameter("inc_content");
}
%>


<div id='main'>
	<div id='top'>
		<%@include file='top.jsp'%>
	</div>
	<div id='center'>
		<div id='left'>
			<%@include file='./board_myba/board_list.jsp' %>
		</div>
		
		<div id='contents'>
			<jsp:include page="<%=inc_content%>"/>
		</div>
		<div id='right'>
			<jsp:include page="<%=inc_right%>"/>
		
		</div>
	</div>
	<div id='bottom'>
		<%@include file='bottom.jsp'%>
	</div>
</div>

</body>
</html>







