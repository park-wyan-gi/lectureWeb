<%@page import="java.util.ArrayList"%>
<%@page import="bean.BoardVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>scope3.jsp</title>
<style>
#title{
   background: linear-gradient(to right, #aaaaaa, #fefefe);
   padding: 9px;
   box-sizing:border-box;
   border-radius:5px;
}

#list_zone{
   background-color: #cccccc;
   margin-bottom:5px;
}
#list_zone > span{
   display: inline-block;
   padding:3px;
   box-sizing:border-box;
   width:100px;
}
.list > span{
   display: inline-block;
   padding:3px;
   box-sizing:border-box;
   width:100px;
}
</style>
</head>
<body>
<div id='title'>
  request 영역에 다양한 형식의 값을 저장
</div>
<%
// 배열형을 request 영역에 저장
String[] ids ={"aaaa","bbbb","cccc"};
request.setAttribute("ids",ids);
%>
<ol>
   <li>${ids[0] }</li>
   <li>${ids[1] }</li>
   <li>${ids[2] }</li>
</ol>
<hr/>
<%
// object 타입의 자료를 request 영역에 저장
BoardVo vo = new BoardVo();
vo.setWorker("hi pwg");
vo.setSubject("object 형 저장 ");
vo.setContent("잘 해 봅시다~~~^^");

request.setAttribute("vo",vo);
%>
<ol>
   <li>${vo.worker }</li>
   <li>${vo.subject }</li>
   <li>${vo.content }</li>
</ol>
<hr/>
<%
// Collection을 request에 저장
ArrayList<String> list = new ArrayList<String>();
list.add("백두산");
list.add("금강산");
list.add("설악산");
list.add("지리산");

request.setAttribute("list",list);
%>
<ul type="square">
   <li>${list[0] }</li>
   <li>${list[1] }</li>
   <li>${list[2] }</li>
   <li>${list[3] }</li>

</ul>
<hr/>
<%
// object를 collection에 추가한 후 request에 저장
ArrayList<BoardVo> list2 = new ArrayList<BoardVo>();
BoardVo v = new BoardVo(1, "2017-04-25","aaaa","hi....1","content....1",1000);
list2.add(v);

v = new BoardVo(2, "2017-04-26","bbbbb","hi....2","content....2",3000);
list2.add(v);

v = new BoardVo(3, "2017-04-27","cccc","hi....3","content....3",500);
list2.add(v);

request.setAttribute("list2", list2);
%>
<div id='list_zone'>
   <span>순번</span>
   <span>작성일</span>
   <span>작성자</span>
   <span>제목</span>
   <span>내용</span>
   <span>조회수</span>
</div>
<div class='list'>
   <span>${list2[0].serial }</span>
   <span>${list2[0].mDate }</span>
   <span>${list2[0].worker }</span>
   <span>${list2[0].subject }</span>
   <span>${list2[0].content }</span>
   <span>${list2[0].hit }</span>
</div>
<div class='list'>
   <span>${list2[1].serial }</span>
   <span>${list2[1].mDate }</span>
   <span>${list2[1].worker }</span>
   <span>${list2[1].subject }</span>
   <span>${list2[1].content }</span>
   <span>${list2[1].hit }</span>
</div>
<div class='list'>
   <span>${list2[2].serial }</span>
   <span>${list2[2].mDate }</span>
   <span>${list2[2].worker }</span>
   <span>${list2[2].subject }</span>
   <span>${list2[2].content }</span>
   <span>${list2[2].hit }</span>
</div>




</body>
</html>











