<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>layout</title>
<style>
body{
	width: 960px;
	margin:0 auto;
}
a{
	text-decoration: none;
}
a:hover{
	background-color: #eeeeff;
}
#header{
	text-align: center;
	height:120px;
	background-image: url(../imgs/back.png);
	background-repeat: no-repeat;
	line-height:120px;
	box-shadow:3px 3px 5px #cccccc;
	margin-bottom:2px;
}
/* nav----------------*/
#nav{ 
	text-align:right; 
	overflow: hidden;
	margin-bottom:10px;
}
#nav>span{
	float:right;
	--width:74px;
	height:30px;
	padding:5px;
	text-align: center;
	margin-right:1px;
	background-color: #559955;
	color:#ffffff;
	font-weight:bolder;

	transition-duration:1.6s;
}

#nav>span:hover{
	background-color: #ffffff;
	color:#559955;
	cursor: pointer;

}

#nav>span:first-child{
	border-radius:0 5px  5px 0;
}
#nav>span:last-child{
	border-radius:5px 0 0  5px;
}

#aside{
	width:200px;
	float:left;
}
#section{
	width:760px;
	float:left;
}
#wrap{
	overflow: hidden;
}
#footer{
	text-align:center;
	background-color: #eeeeee;
	box-shadow:3px 3px 7px #cccccc;
	padding:20px;
	height:100px;
	box-sizing : border-box;

}
</style>
</head>
<body>
<div id='header'> <h1>CSS Example</h1></div>
<div id='nav'>
	<span>Project</span>
	<span>Android</span>
	<span>Spring</span>
	<span>myBatis</span>
	<span>jQuery</span>
	<span>aJax</span>
	<span>JavaScript</span>
	<span>CSS</span>
	<span>Html</span>
	<span>Database</span>
	<span>Java</span>
</div>
<div id='wrap'>
	<div id='aside'>
		<ol>
			<li><a href='background-image.jsp'>background image</a></li>
			<li><a href='border.jsp'>border</a></li>
			<li><a href='display_visibility.jsp'>display visibility</a></li>
			<li><a href='position_absolute.jsp'>position absolute</a></li>
			<li><a href='position_absolute2.jsp'>position absolute II</a></li>
			<li><a href='position_relative.jsp'>position relative</a></li>
		</ol>
	</div>
	<div id='section'> Section Documents
	</div>
</div>
<div id='footer'>
	<font size='5'><b>(주) web1705</b></font><br/>
	서울 종로 율곡로10길 105 디아망 빌딩 4층.	(우)110-390
</div>
</body>
</html>