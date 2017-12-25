<%@page import="java.util.List"%>
<%@page import="bean.BoardDao"%>
<%@page import="bean.BoardVo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="bean.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>board_jsp/board_list.jsp</title>
<style>
#items{
   background-color: #cccccc;
   padding:3px;
   box-sizing:border-box;
   box-shadow:2px 2px 4px #aaaaaa;
   font-weight:bold;
   margin-bottom:10px;
}
#items > span,  .list > span{
   display: inline-block;
}
.serial{ width: 40px; text-align: right; margin-right:20px;}
.mdate{ width: 90px; text-align: center;}
.worker{ width: 120px; text-align: center;}
.subject{ width:550px; text-align:left;}
.hit{ width:60px; text-align:right;}

.list{
   padding:3px;
}
.list:hover{ background-color: #eeeeee;}
#board form{
   margin-bottom:5px;
}
form>#find{
   display: inline-block;
   float:right;
}

#page{
   margin-top:20px;
   text-align: center;
}
</style>
<script>
function start(){
   var ff = document.frm_board;
   ff.btnInsert.onclick = function(){
	   ff.action="insert.do";
      ff.submit();
   }
   ff.btnFind.onclick=function(){
	   ff.action="list.do";
      ff.submit();
   }
}

function view(serial){
    var url = 'view.do';
    var ff = document.frm_board;
    ff.action = url;
    ff.serial.value = serial;
    ff.submit();
}
function goPage(nowPage){
    var url = 'list.do';
    var ff = document.frm_board;
    ff.action = url;
	 ff.nowPage.value = nowPage;
    ff.submit();
}


 
</script>
</head>
<body>
<div id='board'>
	<h2>게시판 조회(Servlet)</h2>
	<form name='frm_board' method='post'>
	   <input type='button' name='btnInsert' value='입력'/>
	   <div id='find'>
	      <input type='text' size='30' name='findStr' value="${param.findStr}">
	      <input type='button' name='btnFind' value='검색'>
	      <input type='hidden' name='serial' />
	      <input type='hidden' name='nowPage' value="${dao.nowPage }"/>
	   </div>
	</form>
	
	<div id='items'>
	   <span class='serial'>순번</span>
	   <span class='subject'>제목</span>
	   <span class='mdate'>작성일</span>
	   <span class='worker'>작성자</span>
	    <span class='hit'>조회수</span>
	</div>
	
	<c:forEach var="obj" items="${list }">
	   <div class='list'>
	      <span class='serial'>${obj.serial }</span>
	      <span class='subject'>
	         <a href='#' onclick="view('${obj.serial}')">${obj.subject }(${obj.cnt })</a>
	      </span>
	      <span class='mdate'>${obj.mDate }</span>
	      <span class='worker'>${obj.worker }</span>
	      <span class='hit'>${obj.hit }</span>      
	   </div>
	</c:forEach>
	<div id="page">
	   <c:if test="${page.startPage > 1 }">
	      <input type='button' value="<<" onclick="goPage(1)">
	      <input type='button' value="<"  onclick="goPage(${page.startPage-1 })">
	   </c:if>
	   
	   <c:forEach var='p' begin="${page.startPage }" end="${page.endPage }">
	      <input type='button' value='${p }' onclick="goPage(${p})">
	   </c:forEach>
	
	   <c:if test="${page.totPage > page.endPage }" >   
	      <input type='button' value=">" onclick="goPage(${page.endPage+1 })">
	      <input type='button' value=">>" onclick="goPage(${page.totPage })">
	   </c:if>
	   
	</div>
</div>

<script>start()</script>
</body>
</html>









