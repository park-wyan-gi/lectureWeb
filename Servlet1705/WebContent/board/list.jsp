<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
#brd_list{
	display:inline-block;
	margin:0px auto;
	text-align:left;
	width:100%;
}
#brd_list a{ text-decoration: none;}
#brd_list > #frm_brd {
	overflow: hidden;
}	

#brd_list #btnInsert {
	float:left;
}
#brd_list div{
	float:right;
}

/* list 목록 --------------------*/
#brd_list > #title{
	background-color: #777777;
	color:#ffffff;
	margin-top:4px;
	padding-top:2px;
	padding-bottom:3px;
}

#brd_list .items{
	padding-top:2px;
	padding-bottom:3px;
}

#brd_list span{
	display: inline-block;
	float:left;
}
#brd_list .items:hover{ 
	background-color: #cceeee;
	text-decoration: underline;	
	font-weight: bold;
}

#brd_list .serial { width:50px; padding-right:20px; text-align: right}
#brd_list .subject{ width:530px;}
#brd_list .worker { width:100px;}
#brd_list .mdate  { width:100px; text-align: center;}
#brd_list .hit    { width:90px; text-align:right; padding-right:10px;}
</style>
</head>
<body>
<div id='brd_list'>
	<h3>자료실</h3>
	<form name='frm_brd' method='post' action='' id='frm_brd'>
		<input type='button' value='자료추가' name='btnInsert' 
		       id='btnInsert'/>

		<div>
			<input type='text' size='30' name='findStr' value='${param.findStr }'/>
			<input type='button' value='검색' name='btnFind' id='btnFind'/>
		</div>		       
		<input type='hidden' name='serial' />		
		<input type='hidden' name='nowPage' 
					value='${(param.nowPage==null)? 1 : param.nowPage }'/>       
	</form>
	<div id='title'>
		<span class='serial'>No</span>
		<span class='subject'>제 목</span>
		<span class='worker'>작성자</span>
		<span class='mdate'>작성일</span>
		<span class='hit'>조회수</span>
	</div>
	<div id='list'>
			<c:forEach var="vo" items="${list }">
				<div class='items'>
					<span class='serial'>${vo.serial }</span>
					<span class='subject'>
						<a href='#' onclick='go(${vo.serial})'>${vo.subject } (${vo.cnt})</a>
					</span>
					<span class='worker'>${vo.worker }</span>
					<span class='mdate'>${vo.mdate }</span>
					<span class='hit'>${vo.hit }</span>
				</div>
			</c:forEach>
	</div>
	
	<div id='pageZone'>
		<c:if test="${dao.startPage >1 }">
			<input type='button' value='<<' onclick='goPage(1)'/>
			<input type='button' value='<'  onclick='goPage(${dao.startPage-1 })'/>
		</c:if>
	
		<c:forEach var='p' begin='${dao.startPage }' end='${dao.endPage }'>
			<input type='button' value='${p }' ${(dao.nowPage==p)? 'disabled':'' } 
									onclick='goPage(${p})'/>
		</c:forEach>
	
		<c:if test="${dao.nowBlock < dao.totBlock }">
			<input type='button' value='>'  onclick='goPage(${dao.endPage+1})'/>
			<input type='button' value='>>' onclick='goPage(${dao.totPage })'/>
		</c:if>
	</div>
				
</div>

<script>
var frm = document.frm_brd;
frm.btnInsert.onclick = function(){
	frm.action = 'insert.do';	
	frm.submit();
}

frm.btnFind.onclick = function(){
	frm.action = 'list.do';
	frm.nowPage.value = 1;
	frm.submit();
}


function go(serial){
	frm.serial.value = serial;
	frm.action = "view.do";
	frm.submit();
}
function goPage(nowPage){
	frm.nowPage.value = nowPage;
	frm.action = 'list.do';
	frm.submit();
	
}

</script>	
	
</body>
</html>