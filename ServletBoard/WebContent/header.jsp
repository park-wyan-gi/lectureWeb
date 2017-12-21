<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>tri_header</title>
<style>
#tri_header{
   background-image:url(./images/back6.png);
   background-repeat:no-repeat;
   background-size: 100% 100%;
   
   border:1px solid #bbbbbb;
   box-shadow:4px 4px 6px #bbbbbb;
   width:1000px;
   height: 150px;
   overflow: hidden;
   position: relative;
}
#tri_header > span{
   font-size:24pt;
   color:#ffff00;
   float:right;
   padding-top:30px;
}

a{ text-decoration: none;}
#tri_header > #menu >a{
   display:table-cell;
   width:150px;
   background-color: rgba(255,255,0, 0.7);
   padding:7px;
   box-sizing:border-box;
   font-weight:bold;
}
#tri_header > #menu >a:hover{
	background-color: rgb(255,255,99);
}

#tri_header #menu{
	position: absolute;
   top:110px;
   right:10px;
}
</style>
</head>
<body>
<div id='tri_header'>
   <span>My Home Page...</span>
	<div id='menu'>
         <a href='index.jsp?inc=intro.jsp' >Home</a> 
         <a href='list.do' >게시판(Servlet)</a> 
	</div>
</div>
</body>
</html>



