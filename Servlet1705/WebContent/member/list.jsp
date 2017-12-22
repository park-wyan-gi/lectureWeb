<%@page import="member.MemberVo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="member.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"     uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel='stylesheet' type='text/css' href='./css/member.css' />

<script src = './js/member.js'></script>
</head>
<body>
<%
MemberDao dao = new MemberDao();

String findStr = "";
int nowPage = 1;
if(request.getParameter("findStr") != null){
	findStr = request.getParameter("findStr");
}
if(request.getParameter("nowPage") != null){
	nowPage = Integer.parseInt(request.getParameter("nowPage"));
}

ArrayList<MemberVo> list = dao.select(findStr, nowPage);
request.setAttribute("list",list);
request.setAttribute("dao",dao);
%>
<div id='list'>
	<h3>회원목록</h3>
	<form name='frm_member' method='post'>
		<div id='find_zone'>
			<div id='left'>
				<input type='button' value='회원추가' id='btnInsert'/>
			</div>
			<div id='right'>
				<input type='text' name='findStr' size='15' value='${param.findStr }'/>
				<input type='button' value='검색' name='btnFind' />
				
				<input type='hidden' name='mid' />
				<input type='hidden' name='nowPage' value="<%=nowPage%>"/>
			</div>
			
		</div>
		<div id='list'>
			<div id='title'>
				<span class='no'>NO</span>
				<span class='mid'>아이디</span>
				<span class='irum'>성명</span>
				<span class='phone'>연락처</span>
				<span class='address'>주소</span>
			</div>
			<c:set var='cnt' value="${dao.startNo }"/>
			<c:forEach var="v" items = "${list }">
			
				<div class='items'>
					<span class='no'>${cnt }</span>
					<span class='mid'>
						<a href='#' onclick='return  listModify(this)'>${v.mid }</a>
					</span>
					<span class='irum'>${v.irum }</span>
					<span class='phone'>${v.phone }</span>
					<span class='address'>${v.address1 }</span>
				</div>
				<c:set var="cnt" value = '${cnt+1 }' />
			</c:forEach>
		</div>
		<div id='page'>
			<c:if test="${dao.nowBlock>1 }">
				<input type='button' value='|←' name='btnFirst'  onclick = 'movePage(1)'>
				<input type='button' value='←'  name='btnPrev'  onclick = 'movePage(${dao.startPage-1})'>
			</c:if>

			<c:forEach var='i' begin="${dao.startPage }" end="${dao.endPage }">
				<input type='button' value='${i }'    name='btn1'        onclick = 'movePage(${i})'
						${(i==dao.nowPage) ? "disabled" :"" } >
			</c:forEach>
			
			<c:if test = "${dao.nowBlock < dao.totBlock }">			
				<input type='button' value='→'  name='btnNext'  onclick = 'movePage(${dao.endPage+1})'>
				<input type='button' value='→|' name='btnLast'   onclick = 'movePage(${dao.totPage})'>
			</c:if>
		</div>
		
	</form>
</div>
<script>initList()</script>
</body>
</html>