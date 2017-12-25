<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>board_repl</title>


<script>

//첨부파일이 추가된 경우
var cnt=0;
function attfileAppend(ev){
   var fn = '';
   var tags = document.getElementsByClassName('fileName');
   var yn=true;

   for(var t=0 ; t<tags.length-1 ; t++){//첨부파일 태그에 선택된 파일이 없으면 삭제
      if(tags[t].value == ''){
//       var beforeBr = tags[t].previousElementSibling;
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

function attfileAppend2(){ //파일추가  Ver 2.0
	var att = document.getElementById('attfile');
	
	var div = document.createElement("div");
	var input = document.createElement("input");
	input.setAttribute('type','file');
	input.setAttribute('name', 'fileName' + cnt);
	input.onclick = function(){
		if(input.value ==''){
			attfileAppend2();
		}
	}
	
	var button = document.createElement("input");
	button.setAttribute('type', 'button');
	button.setAttribute('value', 'x');
	
	button.onclick = function(ev){// 삭제
		if(att.childNodes.length <=1) return;
		var ele = ev.srcElement;
		var p = ele.parentNode;
		att.removeChild(p);
	}
	
	div.appendChild(input);
	div.appendChild(button);
	att.appendChild(div);
	cnt++;
	
}

</script>

</head>
<body>
<div id='board'>
   <h2>게시판 댓글 입력(Servlet)</h2>
   <form name='frm_board' method='post'  action='replR.do' enctype='multipart/form-data'>
               
      <label>작성자</label>
      <input type='text' name='worker' value='${sessionScope.id}'><br/>
      <label>제목</label>
      <input type='text' name='subject' value='답변)hi.....' size='70'><br/>
      <label></label>
      <textarea rows="15" cols="72" name='content'>답변)수고하세요~~</textarea>
      <br/>
      <label>첨부파일</label><br/>
      <span id='attfile'></span>
      <p/>
      
      <label></label>
      <input type='submit' value='댓글 작성'>
      <input type='text' name='findStr'      value="${param.findStr }"/>
      <input type='text' name='nowPage'      value="${param.nowPage }"/>
      <input type='text' name='serial'       value="${param.serial }"/>
      <input type='text' name='grp'          value="${param.grp }"/>
      <input type='text' name='deep'         value="${param.deep }"/>
      
</form>
<script>attfileAppend2()</script>
</body>
</html>