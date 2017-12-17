<%@page import="bean.BoardVo"%>
<%@page import="bean.BoardDao"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="bean.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>board_modify</title>
<script>
function start(){
	attfileAppend();
   var ff = document.frm_board;
   var url = "";
   
   document.getElementById("btnView").onclick = function(){
      //history.back();
      url = "view.do";
      ff.action = url;
      ff.submit();
   }
   document.getElementById("btnList").onclick = function(){
	   ff.enctype="";
      url = "list.do";
      ff.action = url;
      ff.submit();
    }


}

//첨부파일이 추가된 경우
var cnt=0;
function attfileAppend(ev){
	var tags = document.getElementsByClassName('fileName');
	var yn=true;
	for(var t=0 ; t<tags.length-1 ; t++){//첨부파일 태그에 선택된 파일이 없으면 삭제
		if(tags[t].value == ''){
			var beforeBr = tags[t].nextElementSibling;
			beforeBr.parentNode.removeChild(beforeBr);
			tags[t].parentNode.removeChild(tags[t]);
			yn=false;
		}
	}
	
	if(yn){
		cnt++;
   	var div = document.getElementById('attfile');
   	var br = document.createElement('br');
   	var file = document.createElement('input');
   	file.setAttribute('type','file');
   	file.setAttribute('class', 'fileName');
   	file.setAttribute('name', 'fileName' + cnt);
   	file.addEventListener('change',attfileAppend, true);
   	div.appendChild(file);
   	div.appendChild(br);
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
      <fieldset>
         <legend>첨부된 파일</legend>
         <c:forEach var='file' items='${obj.attfile }'> 
            <div>
               <label><input type='checkbox' value='${file }' name='deleteFile'>
                  <img src='../../upload/${file }'  width='50px'>${file } (삭제)
               </label>
            </div>
         </c:forEach>
      </fieldset>
      <br/>
      
      <label>첨부파일 추가</label><p/>
         <span id='attfile'></span>
         <p/>
      <label> </label>
      
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