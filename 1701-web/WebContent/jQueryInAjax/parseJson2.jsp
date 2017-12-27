<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src = '../jq_lib/jquery-3.2.1.min.js'></script>
<script>
$(document).ready(function(){
	$('#btnLoadJson').click(function(){
		var findStr = $('#findStr').val();
		$.ajax({
			type    : 'get',
			url     : 'memberJson.jsp?findStr=' + findStr,
			success : function(data){
				var list = $.parseJSON(data);
				var str = '<table border="1" width="300px" cellpadding="3px">';
				str += "<tr><th>아이디</th><th>성명</th></tr>";
				for(i=0 ; i<list.length ; i++){
					str += "<tr>"
					    + "<td>" + list[i].userid + "</td>"
					    + "<td>" + list[i].userpwd + "</td></tr>";
				}
				str += "</table>";
				$('#result').html(str);
			},
			error   : function(xhr, status, error){
				alert(error);
			}
		});
	});
});

</script>
</head>
<body>
<h2>parseJson()</h2>
<input type='text' value='a' id='findStr'>
<input type='button' value='loadJson' id='btnLoadJson'><p/>

<h4>result:</h4>
<div id='result'></div>
</body>
</html>