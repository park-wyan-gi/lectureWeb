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
	$('#btnParseXML').click(parse);
});

function parse(){
	$.ajax({
		type     : 'get',
		dataType : 'xml',
		url      : 'xmlData.xml',
		success  : function(data){
			var list = $(data).find('member');
			var str = '';
			$(list).each(function(){
				str += $(this).find('name').text() + " / "
				    +  $(this).find('addr').text() + " ( "
				    +  $(this).find('phone').text() + " )<br/>";
			});
			
			$('#result').html(str);
			
		},
		error    : function(xhr, status, error){
			$('#result').html(error);
		}
	});
}
</script>
</head>
<body>
<h2>parseXML</h2>
<input type='button' value='parseXML' id='btnParseXML'><p/>
<div id='result'></div>
</body>
</html>