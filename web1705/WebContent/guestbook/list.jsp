<%@page import="guestbook.GuestBookVo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="guestbook.GuestBookDao"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"     uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel='stylesheet' type='text/css' href='./css/guestbook.css?ver=<%=System.nanoTime()%>' />
<script src='./js/guestbook.js?ver=<%=System.nanoTime() %>'></script>
</head>
<body>
<%
String findStr = "";
int nowPage = 1;
if(request.getParameter("findStr") != null){
	findStr = request.getParameter("findStr");
}

if(request.getParameter("nowPage") != null){
	nowPage = Integer.parseInt(request.getParameter("nowPage"));
}

GuestBookDao dao = new GuestBookDao();
ArrayList<GuestBookVo> data = dao.select(findStr, nowPage);
request.setAttribute("dao", dao);
request.setAttribute("data", data);
%>

<div id='gb_list'>
	<h3>방명록</h3>
	<c:set var='idx' value="0"/>
	<c:forEach var='i'  items="${data }">
		<form name='frm${idx }' method='post'>
			<input type='hidden' name='sid' value='${i.sid }'/>
			<div class='items'>
				<div class='cont'>
				<span>작성자명 : ${i.mid }</span>
				<span class='rdate'>[${i.rdate }] </span><br/>
				<textarea name='content' rows="5" cols="80" readonly>${i.content}</textarea>
				<br/>
				<c:if test = '${sessionScope.sId == i.mid }'>
					<label>암호</label>
					<input type='password' name='pwd' size='5'/>
				</c:if>
				</div>
				<div class='btns'>
					<c:if test = '${sessionScope.sId == i.mid }'>
						<img src='./imgs/btnModify.png'   
									 onclick='gbModify(${idx},  this)'><br/>
						<input type='image' src='./imgs/btnDel.png' value='삭제' 
									name='btnDelete' onclick='return gbDelete(this.form)'>
					</c:if>
				</div>
			</div>
		</form>
		<c:set var='idx' value ="${idx+1 }"/>
		<hr />
	</c:forEach>
	<form name='frm_page' method='post'>
		<input type='hidden' name='nowPage' value='${dao.nowPage }'/>
		<div id='page'>
			<c:if test="${dao.nowBlock>1 }">
				<input type='button' value='|←' name='btnFirst'  onclick = 'movePage(1)'>
				<input type='button' value='←'  name='btnPrev'  onclick = 'movePage(${dao.startPage-1})'>
			</c:if>

			<c:forEach var='i' begin="${dao.startPage }" end="${dao.endPage }">
				<input type='button' value='${i }'    name='btn1'    ${(i==dao.nowPage) ? "disabled" :"" }    
								onclick = 'movePage(${i})'>
			</c:forEach>
			
			<c:if test = "${dao.nowBlock < dao.totBlock }">			
				<input type='button' value='→'  name='btnNext'  onclick = 'movePage(${dao.endPage+1})'>
				<input type='button' value='→|' name='btnLast'   onclick = 'movePage(${dao.totPage})'>
			</c:if>
		</div>
	</form>
</div>	
</body>
</html>