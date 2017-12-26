<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>select</title>
<script>
window.onload = function(){
	var frm = document.frm;
	
	//버튼이 클릭되면
	frm.btnWhite.onclick = function(){
		frm.doc.style.backgroundColor = '#eeffff';	
	}
	
	//select의 선택이 변경되면
	frm.sel.onchange = function(){
		var str = '';
		var index = frm.sel.selectedIndex;
		if(index >0){
			str = 'index : ' + index + '\n';
			str += 'value : ' + frm.sel[index].value + '\n';
			str += 'text : '    + frm.sel[index].text;
			frm.doc.value = str;
			
			frm.doc.style.backgroundColor = frm.sel[index].value;
			
			if(index == 1 || index==2 || index==4){
				frm.doc.style.color = '#ffff00';
			}else{
				frm.doc.style.color = '#000000';
			}
		}
		
	}
}


</script>
</head>
<body>
	<h1>select</h1>
	<p>select 에 의해서 선택된 색상을 text의 바탕색으로 지정</p>
	<form name='frm' method='post'>
		<textarea  name='doc'  cols='40' rows='10'></textarea><br/>
		<select name='sel'>
			<option value=''>바탕색을 선택</option>
			<option value='#000000'>검정색</option>
			<option value='#ff0000'>빨간색</option>
			<option value='#00ff00'>녹색</option>
			<option value='#0000ff'>파란색</option>
			<option value='#ffff00'>노란색</option>
		</select>
		<input type='button' value='흰색' name='btnWhite' />
	</form>
	
</body>
</html>