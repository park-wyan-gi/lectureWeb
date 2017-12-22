<%@page import="bean.BoardDao"%>
<%@page import="bean.BoardVo"%>
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
<title>Insert title here</title>
<style>
#title{
   background:linear-gradient(to right, #aaaaaa, #fefefe);
   padding:10px;
   box-sizing:border-box;
   border-radius:7px 7px;
   margin-top:10px;
   margin-bottom:10px;
}

#content{
   border:2px solid #aaaaaa;
   padding:10px;
   box-sizing:border-box;
   width:100%;
   margin-top:10px;
   margin-bottom:10px;
   box-shadow:4px 4px 8px #aaaaaa;
   border-radius:4px;
}
.label{
   display: inline-block;
   width:90px;
   
}
</style>
<script>
function start(){
	var ff = document.frm_board;
	var url = '';
	document.getElementById("btnDelete").onclick = function(){
		var yn = confirm("정말???");
		if(yn){
			url = "delete.do";
			ff.action = url;
			ff.submit();
		}else{
			return false;
		}
		
	}
	
   document.getElementById("btnModify").onclick = function(){
	      url = "selectOne.do";
	      ff.action = url;
	      ff.submit();
   }

   document.getElementById("btnRepl").onclick = function(){
	      url = "repl.do";
	      ff.action = url;
	      ff.submit();
   }

   document.getElementById("btnList").onclick = function(){
	      url = "list.do";
	      ff.action = url;
	      ff.submit();
   }
}
</script>
</head>
<body>
<div id='view'>
   <h2 id='title'>게시판 상세보기</h2>
   <div><span class='label'>문서번호 </span> ${obj.serial}</div>
   <div><span class='label'>작성자 </span> <strong>${obj.worker }</strong> 
   	<span> <a href='#' >${obj.email }</a></span>
      <span>[ ${obj.mDate }</li> ]</span>
      <span>  /조회수 : ${obj.hit }</span>
   </div>
   <div><span class='label'>제목 </span> ${obj.subject }</div>
   <div id='content'>${obj.content }</div>
	<div>
	<p >
      <c:forEach var="item"  items="${obj.attfile }">
         <c:if test="${ item != 'null'}">
            <span style='display:inline-block;margin-bottom:20px'>
               <img src='./upload/${item }' width="220px" /><br/>
               ${item }
            </span>
         </c:if>
      </c:forEach>
	</p>
   <p/>
	<input type='button' value='삭제'  id='btnDelete'>
	<input type='button' value='수정'  id='btnModify'>
	<input type='button' value='댓글'  id='btnRepl'>
	<input type='button' value='목록'  id='btnList'>
</div>

<!-- 각 페이지로 이동할때 전달할 기본 정보 -->
<form name='frm_board' method='post'>
   <input type='hidden' name='serial'       value ="${obj.serial }"/>
   <input type='hidden' name='nowPage'      value ="${obj.nowPage }"/>
   <input type='hidden' name='findStr'      value ="${obj.findStr }"/>
   <input type='hidden' name='grp'          value ="${obj.grp }"/>
   <input type='hidden' name='deep'         value ="${obj.deep }"/>
   
</form>

<script>start()</script>
</body>
</html>