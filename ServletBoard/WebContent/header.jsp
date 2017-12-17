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
   width:120px;
   background-color: rgba(255,255,0, 0.7);
   padding:4px;
   box-sizing:border-box;
   font-weight:bold;
}
#menu{
   position:relative;
   top:110px;
   left:750px;
}
</style>
</head>
<body>
<div id='tri_header'>
   <span>My Home Page...</span>
	<div id='menu'>
         <a href='index.jsp' >Home</a> 
         <a href='list.do' >게시판(Servlet)</a> 
	</div>
</div>
</body>
</html>



