<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>tri_header</title>
<style>
#tri_header{
   background-image:url(../../images/back5.png);
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
   display:inline-block;
   background-color: rgba(255,255,0, 0.7);
   padding:5px;
   box-sizing:border-box;
   font-weight:bold;
}
#menu{
   position:relative;
   top:110px;
   left:650px;
}
</style>
</head>
<body>
<div id='tri_header'>
   <span>My Home Page...</span>
	<div id='menu'>
         <a href='tri_index.jsp' >Home</a> 
         <a href='tri_index.jsp?page=tri_sub_page1.jsp' >트랜스포머</a> 
         <a href='tri_index.jsp?page=tri_sub_page2.jsp' >인셉션</a> 
         <a href='tri_index.jsp?page=tri_sub_page3.jsp' >아이언 스카이</a> 
	</div>
</div>
</body>
</html>



