<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>

function start(){
	var str = '';
	var str2='';
	var main = document.getElementById('main');
	var child = main.childNodes;
	for(i=0 ; i<child.length; i++){
		var node = child.item(i);
		
		//element node가 아니라면
		if(node.nodeType != 1){
			str2 += node.nodeValue;			
			continue;
		}
		
		var sectionChild = node.childNodes;
		
		for(j=0 ; j<sectionChild.length ; j++){
			var c = sectionChild.item(j);
			if(c.nodeType != 1) continue;
			str += "name : " + c.nodeName + "\n";
			str += "value : " + c.firstChild.nodeValue + "\n\n";
		}
	}
	alert(str + "---" + str2);
}

</script>
</head>
<body>
<h2>NodeList(II)</h2>
<div id='main'>
	aaa
	<section>
		<h2>타이틀1</h2>
		<p>문단1</p>
	</section>
	bbb
	<section>
		<h2>타이틀2</h2>
		<p>문단3</p>
	</section>
	ccc
</div>

<script>start()</script>
</body>
</html>


