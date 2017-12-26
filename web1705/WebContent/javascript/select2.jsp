<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>select2</title>
<style>
select[name=sel] {
	width: 180px;
	margin-top: 10px;
	margin-bottom: 10px;
}
</style>
<script>
	window.onload = function() {
		var frm = document.frm;
		var sel = frm.sel;

		frm.btnInsert.onclick = function() {
			var v = frm.eId.value;
			var op = new Option(v, v);
			sel.options[sel.length] = op;
		}

		frm.btnDelete.onclick = function() {
			var yn = confirm("선택된 항목 모두를 삭제하시겠습니까??");
			if (!yn) return;

			for (var i = sel.length-1 ;  i>= 0 ; i--) {
				if (sel[i].selected) {
					sel.remove(i);
				}
			}
		}

		frm.btnModify.onclick = function() {
			var index = sel.selectedIndex;
			if (index < 0) return;
			var text = prompt("수정할 값을 입력하세요", "");//comment, default value
			sel[index].value = text;
			sel[index].text = text;
		}

		frm.btnDeleteAll.onclick = function() {
			var yn = confirm("정말 모두 삭제하시겠습니까??");
			if (yn) 	sel.length = 0;
		}
	}
</script>
</head>
<body>
	<h1>입력된 값을 select에 추가하거나 삭제, 수정하도록</h1>
	<form name='frm'>
		<label>아이디</label> 
		<input type='text' size='7' name='eId' /> 
		<input type='button' name='btnInsert' value='추가' /><br /> 
		<select name='sel' multiple="multiple" size='10'></select> <br /> 
		<input type='button' value='수정' name='btnModify' /> 
		<input type='button' 	value='삭제' name='btnDelete' /> 
		<input type='button' value='모두 삭제' name='btnDeleteAll' />
	</form>
</body>
</html>