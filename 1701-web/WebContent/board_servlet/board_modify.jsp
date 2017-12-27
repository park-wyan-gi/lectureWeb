<%@page import="bean.BoardVo"%>
<%@page import="bean.BoardDao"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="bean.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>board_modify</title>
<script>
function start(){
   var ff = document.frm_board;
   var url = "";
   
   document.getElementById("btnView").onclick = function(){
      //history.back();
      url = "view.do";
      ff.action = url;
      ff.submit();
   }
   document.getElementById("btnList").onclick = function(){
       url = "list.do";
       ff.action = url;
       ff.submit();
    }
   
   //첨부 이미지 개별 삭제
   document.getElementById('btnDel1').onclick=function(){
	      var img = document.getElementById('img1');
	      window.open('../../board_servlet/file_delete.jsp?file=${obj.attfile[0]}', 'win', 
	    		                     'width=300px, height=300px');
   }
   document.getElementById('btnDel2').onclick=function(){
       var img = document.getElementById('img2');
       window.open('../../board_servlet/file_delete.jsp?file=${obj.attfile[1]}', 'win', 
    		                      'width=300px, height=300px');
   }

}
</script>
</head>
<body>
<div id='board'>
   <h2>게시판 수정(Servlet)</h2>
   <form name='frm_board' method='post' action='modify.do' enctype='multipart/form-data'>
      <label>작성자</label>
      <input type='text' name='worker' value='${obj.worker }'  readonly><br/>
      <label>제목</label>
      <input type='text' name='subject' value='${obj.subject }' size='70'><br/>
      <label></label>
      <textarea rows="15" cols="72" name='content'>${obj.content }</textarea>
      <br/>
      <label></label>
      <div>
         <div>
            <img src='../../upload/${obj.attfile[0] }'/  id='img1' >
            <input type='button' value='X' id='btnDel1'>
            <input type='file' name='fileName1'>
         </div>
         <p/>
         <div>
            <img src='../../upload/${obj.attfile[1] }' id='img2'/>
            <input type='button' value='X' id='btnDel2'>
            <input type='file' name='fileName2'>
         </div>
      </div>
      
      <p/>
      <label></label>
      <input type='submit' value='수정'  >
      <input type='button' value='상세보기' id='btnView'>
      <input type='button' value='목록으로' id='btnList'>

      <input type='hidden' name='serial' value='${obj.serial }'/>
      <input type='hidden' name='findStr' value='${obj.findStr }'/>
      <input type='hidden' name='nowPage' value='${obj.nowPage }'/>
   </form>
</div>
<script>start()</script>
</body>
</html>