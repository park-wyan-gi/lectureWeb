<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>jsonLoad2</title>
<script>
var xhr;
function jsonLoad(){
	xhr = new XMLHttpRequest();
	xhr.open('get','./jsonData2.jsp', true);
	xhr.send();
	xhr.onreadystatechange = function(){
		if(xhr.status==200 && xhr.readyState==4){
			var txt = xhr.responseText;
			var rs = document.getElementById('result');
			
			//메모리에 새로운 document생성
			var doc = document.implementation.createHTMLDocument('title');
			doc.write(txt);
			var data = doc.getElementById('data');
			
			//데이터를 json유형으로 파싱
			var lastData = JSON.parse(data.innerHTML);
			var str = "<table border='1' width='700px'>";
			for(i=0 ; i<lastData.length-1 ; i++){
				str += "<tr>";
				str += "<td>" + lastData[i].serial + "</td>";
				str += "<td>" + lastData[i].worker + "</td>";
				str += "<td>" + lastData[i].subject + "</td>";
				str += "<td>" + lastData[i].mdate + "</td>";
				str += "<td>" + lastData[i].hit + "</td>";
				str += "</tr>";
			}
			
			str += "</table>";
			
			rs.innerHTML = str;
		}
	}
}
</script>
</head>
<body>
<h2>JSON형식의 데이터 읽기</h2>
<input type='button' value='JSON LOAD' onclick='jsonLoad()'/>
<div id='result'></div>
</body>
</html>