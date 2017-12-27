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
		$.ajax({
			type    : 'get',
			url     : 'dataJson.jsp',
			success : function(data){
				var list = $.parseJSON(data);
				$('#before').text(data);
				
				var str = '<table border="1">';
				for(i=0 ; i<list.length ; i++){
					str += "<tr>"
					    + "<td>" + list[i].mid + "</td>"
					    + "<td>" + list[i].irum + "</td></tr>";
				}
				
				str += "</table>";
				
				$('#after').html(str);
				
				
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
<input type='button' value='loadJson' id='btnLoadJson'><p/>

<h4>before:</h4>
<div id='before'></div>

<h4>after:</h4>
<div id='after'></div>
</body>
</html>