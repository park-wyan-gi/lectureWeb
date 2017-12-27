<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
/* 공통 css */
#n_main>div{
   border:0px solid #aaaaaa;
   box-sizing:border-box;
}
#content > div{
   display: inline-block;
   float:left;
   height:140px;
   border:0px solid #aaaaaa;
}

#n_top{
   height:150px;
   background-color: #eeeeee;
   box-shadow:0px 3px 5px #aaaaaa;
}
#n_left{
   background-color: #ffaaaa;
}
#n_center{
   background-color: #aaffaa;
}
#n_aside{
   background-color: #aaaaff;
}
#n_footer{
   height:150px;
   background-color: #eeeeee;
   box-shadow:0px 3px 5px #aaaaaa;
   clear:both;
}

/* 반응형 */

@media screen and (max-width:600px){
	#content > div{
	  width:100%;
	  
	}
}

@media screen and (min-width:600px) and (max-width:800px){
   #n_left{
      width:50%;
   }
   #n_center{
      width:50%;
   }
   #n_aside{
      width:100%;
   }
   
}
@media screen and (min-width:800px) {
   #n_left{
      width:30%;
   }
   #n_center{
      width:40%;
   }
   #n_aside{
      width:30%;
   }
}

</style>
</head>
<body>
<div id='n_main'>
   <div id='n_top'><%@include file="n_top.jsp" %></div>
   <div id='content'>
         <div id='n_left'><%@include file="n_left.jsp" %></div>
         <div id='n_center'><%@include file="n_center.jsp" %></div>
         <div id='n_aside'><%@include file="n_aside.jsp" %></div>
   </div>
   <div id='n_footer'><%@include file="n_footer.jsp" %></div>
</div>
</body>
</html>




