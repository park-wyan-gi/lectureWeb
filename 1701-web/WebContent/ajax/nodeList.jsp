<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
function start(){
	var rs  = document.getElementById('result');
	var btn = document.getElementById('id_btn');
	btn.onclick = function(){
		var input = document.getElementsByTagName('input')
		rs.innerHTML = "Length:" + input.length;
		
		for(i=0 ; i<input.length ; i++){
			var ele = input[i];
			rs.innerHTML += "<li> name : " + ele.name;
			rs.innerHTML += "<li> type : " + ele.type;
			rs.innerHTML += "<li> value : " + ele.value;
			rs.innerHTML += "<li> id : " + ele.id;
			rs.innerHTML += "<li> class : " + ele.className;
			rs.innerHTML += "<hr/>";
			
		}
	}
}
</script>
</head>
<body>
<h2>NodeList Example<hr/></h2>
<form name='frm'>
	<input type='text'     name='irum'   value='abc'  id='id_irum'   class='cl_irum'/>
	<input type='radio'    name='gender' value='f'    id='id_gender' class='cl_gender'/>
	<input type='checkbox' name='hobby'  value='축구' id='id_hobby'  class='cl_hobby'/>
	<input type='button'   name='btn'    value='확인' id='id_btn'    class='cl_btn'/>
</form>
<h2>Result</h2>
<div id='result'></div>

<script>start()</script>
</body>
</html>