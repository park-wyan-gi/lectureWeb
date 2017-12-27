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
	var div_length = $('div[id !="result"]').length;
	var span_length = $('span').length;
	
	var rs = "<li>div length : " + div_length;
	rs += "<li> span length : " + span_length;
	
	$('#result').html(rs);
	
	
	//each를 사용하여 span태그의 색상을 지정
	var bg =["#ff0000","#00ff00","#0000ff","#ffff00","#ff00ff"];
	$('span').each(function(index){
		$(this).css('background-color',bg[index]);
	});
	
	//eq | lt | gt
	var eq = $('div:eq(2)');
	var gt = $('div:gt(2)');
	eq.css('background-color',bg[0]);
	gt.css('background-color',bg[1]);
});
</script>
</head>
<body>
<div id='result'></div>


<div>1</div>
<div>2</div>
<div>3</div>
<div>4</div>
<div>5</div>

<span>6</span>
<span>7</span>
<span>8</span>
<span>9</span>
<span>10</span>



</body>
</html>