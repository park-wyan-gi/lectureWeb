<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang='ko'>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name='viewport' content='width=device-width'>
<title>board_input.jsp</title>
<style>
#board{
   line-height: 190%;
}
#board>h2{
   background:linear-gradient(to right, #aaaaaa, #fefefe);
   padding:13px;
   box-sizing:border-box;
   border-radius:7px 7px;
}

#board label{
   display:inline-block;
   width:70px;
   text-align: right;
}

#attfile{
   display: inline-block;
   vertical-align: top;
   
}
</style>

<script>
//첨부파일이 추가된 경우
var cnt=0;
function attfileAppend(ev){//파일 추가  ver 1.0
	var tags = document.getElementsByClassName('fileName');
	var yn=true;
	//첨부파일 태그에 선택된 파일이 없으면 삭제
	for(var t=0 ; t<tags.length-1 ; t++){
		if(tags[t].value == ''){
//			var beforeBr = tags[t].previousElementSibling;
			var beforeBr = tags[t].nextElementSibling;
			beforeBr.parentNode.removeChild(beforeBr);
			tags[t].parentNode.removeChild(tags[t]);
			yn=false;
		}
	}

	if(yn){
		// file태그의  이름뒤에 번호를 붙여주기 위한 카운터
		cnt++;
		
		// file태그를 추가하기 우한 영역
   	var div = document.getElementById('attfile');
		
		// file 태그와 br 태그 생성
   	var file = document.createElement('input');
   	var br = document.createElement('br');
   	
   	// file 태그의 속성 및 이벤트 지정
   	file.setAttribute('type','file');
   	file.setAttribute('class', 'fileName');
   	file.setAttribute('name', 'fileName' + cnt);
   	file.addEventListener('change',attfileAppend, true);
   	
   	// file태그와 br 태그 추가
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
   <h2>게시판 입력(Servlet)</h2>
	<form name='frm_board_input' method='post' action='insert.do'  
	           enctype='multipart/form-data'>
	           
         <label>작성자</label>
         <input type='text' name='worker' value='kim'><br/>
         
         <label>제목</label>
         <input type='text' name='subject' value='hi.....' size='70'><br/>
         
         <label></label>
         <textarea rows="15" cols="72" name='content'>수고하세요~~</textarea>
         <br/>
         
         <label>첨부파일</label>
         <span id='attfile'></span>
         <p/>
         <label> </label>
         <input type='submit' value='작성'>
	</form>
</div>

<script>attfileAppend2()</script>
</body>
</html>