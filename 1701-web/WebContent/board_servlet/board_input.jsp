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
</style>
<script>
var cnt =0; //file태그의 name값을 구분{fileName1, fileName2, ...)
function attfileAppend(ev){
	// file 태그의 class='fileName'인 요소를 가져옴.
	var tags = document.getElementsByClassName('fileName');
	var yn=true; //file 태그중 값이 비어있는 태그가 없다면 true
	
	//file태그중 값이 비어있는 태그를 삭제
	for(var t=0 ; t<tags.length-1 ; t++){
		if(tags[t].value==''){
			var br = tags[t].nextElementSibling;//file태그 오른쪽에 있는 br 태그
			var img = tags[t].previousElementSibling; // file태그 왼쪽에 있는 img 태그
			
			img.parentNode.removeChild(img);
			br.parentNode.removeChild(br);
			tags[t].parentNode.removeChild(tags[t]);
			yn=false;
		}
	}
	
	//비어있는 file태그를 맨 끝에 추가하는 부분
	if(yn){
		cnt++;
		var img = document.createElement("img");
		var file = document.createElement('input');
		var br = document.createElement('br');
		
		//file태그의 속성 지정
		file.setAttribute('type', 'file');
		file.setAttribute('class', 'fileName');
		file.setAttribute('name', 'fileName'+cnt);
		file.onchange = attfileAppend;
		
		//img 태그의 속성
		img.setAttribute("width", "30px");
		img.setAttribute("align", "center");
		img.setAttribute("id", "fileName"+cnt);
		
		//file태그와 br를 attfile영역에 추가
		var div = document.getElementById('attfile');
		div.appendChild(img);
		div.appendChild(file);
		div.appendChild(br);
		
		//--------------------------------------
		//첨부파일 미리보기
		//--------------------------------------
		var event = ev || window.event;
		if(event == null) return;
		
		var file = event.srcElement; //이벤트가 발생한 요소
		var tagName = file.name; // 이벤트가 발생한 태그의 이름
		var url = file.files[0]; // 파일 태그에 선택된 파일 오브젝트
		
		 var reader = new FileReader();//파일을 로딩하기 위한 자바스크립트 객체
		 
		 reader.onload=function(ev2){
			 var img = new Image();
			 img.src = ev2.target.result; // 로딩된 이미지 경로
			 document.getElementById(tagName).src = img.src;
		 }
		 
		 reader.readAsDataURL(url);

	}
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
         <label>첨부파일</label><br/>
         <label></label>
         <div id='attfile'></div>

         <p/>
         <label></label>
         <input type='submit' value='작성'>
	</form>
</div>
<script>attfileAppend()</script>
</body>
</html>