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
   padding:5px;
   box-sizing:border-box;
   box-shadow:2px 2px 4px #aaaaaa;
   font-weight:bold;
   margin-bottom:10px;
}
#items > span,  .list > span{
   display: inline-block;
}
.serial{ width: 60px; text-align: right;}
.mdate{ width: 220px; text-align: center;}
.worker{ width: 60px; text-align: center;}
.subject{ width:300px; text-align:left;}
.hit{ width:60px; text-align:center;}


form{
   margin-bottom:5px;
}
form>#find{
   display: inline-block;
   float:right;
}
</style>
<script>
function start(){
   var ff = document.frm_board;
   ff.btnInsert.onclick = function(){
      var url = 'tri_index.jsp?inc=../../board_servlet/board_input.jsp';
      location.href = url;
   }
   ff.btnFind.onclick=function(){
	   ff.action="list.do";
      ff.submit();
   }
}

function goPage(serial){
    var url = 'view.do';
    var ff = document.frm_board;
    ff.action = url;
    ff.serial.value = serial;
    ff.submit();
 }
</script>
</head>
<body>
<h2>게시판 조회(Servlet)</h2>
<form name='frm_board' method='post'>
   <input type='button' name='btnInsert' value='입력'/>
   <div id='find'>
      <input type='text' size='30' name='findStr' value="${findStr}">
      <input type='button' name='btnFind' value='검색'>
      <input type='hidden' name='serial' />
      <input type='hidden' name='nowPage' value="${nowPage }"/>
   </div>
</form>

<div id='items'>
   <span class='serial'>순번</span>
   <span class='mdate'>작성일</span>
   <span class='worker'>작성자</span>
   <span class='subject'>제목</span>
    <span class='hit'>조회수</span>
</div>

<c:forEach var="obj" items="${list }">
   <div class='list'>
      <span class='serial'>${obj.serial }</span>
      <span class='mdate'>${obj.mDate }</span>
      <span class='worker'>${obj.worker }</span>
      <span class='subject'>
         <a href='#' onclick="goPage('${obj.serial}')">${obj.subject }</a>
         </span>
      <span class='hit'>${obj.hit }</span>      
   </div>
</c:forEach>

<script>start()</script>
</body>
</html>









