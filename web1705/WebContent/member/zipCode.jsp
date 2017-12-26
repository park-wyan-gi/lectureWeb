<%@page import="java.net.URLEncoder"%>
<%@page import="javax.print.URIException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" autoFlush="true"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
request.setCharacterEncoding("utf-8"); 
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>zipCode.jsp</title>
<style>
#result{
	width:350px;
	margin-top:3px;
	font-size:12px;
	overflow-x: scroll;
}
</style> 
<script>
var xhr;
function zipFind(){
	var frm = document.frm_zip;
	var road = frm.road.value;

	var ip = './zip2.jsp?srchwrd=' + encodeURIComponent(road);

	xhr = new XMLHttpRequest();
	xhr.open('get', ip);
 	xhr.send();
	xhr.onreadystatechange = function(){
		if(this.status==200 && this.readyState == 4){
			var rs = document.getElementById('result');
			rs.length=0;
			var doc = this.responseText;
			//메모리공간의 document에 저장
			var newDoc = document.implementation.createHTMLDocument("");
			newDoc.open();
			newDoc.write(doc);
			
			var nodeList = newDoc.getElementsByTagName("newAddressListAreaCd");
			
			if(nodeList.length==0){
				var op = new Option("찾는 자료가 없습니다.");
				rs.options[rs.length] = op;
			}
			
			for(i=0 ; i<nodeList.length ; i++){
				var node = nodeList.item(i);
				var zipNo = node.getElementsByTagName('zipNo')
								.item(0).firstChild.nodeValue;
				var rnAdres = node.getElementsByTagName('rnAdres')
								.item(0).firstChild.nodeValue;
				var lnmAdres = node.getElementsByTagName('lnmAdres')
								.item(0).firstChild.nodeValue;
				
				var op = new Option('[ ' + zipNo + ' ] '+rnAdres, zipNo);
				rs.options[rs.length] = op;
			}
		}		
	}
	
	frm.result.ondblclick = function(){
		var idx = frm.result.selectedIndex; //선택된 항목
		var zipCode = frm.result[idx].value;
		var tempAddr = frm.result[idx].text.split('] ');
		
		var pFrm = opener.document.frm_insert;
		if(pFrm == null){
			pFrm = opener.document.frm_modify;
		}
		
		pFrm.post.value = zipCode;
		pFrm.address1.value = tempAddr[1];
		self.close();
	}
	
}


</script>

</head>
<body>

<div id='zipCode'>
	<h3>우편번호 검색</h3>
	<form name='frm_zip' method='post'>
		<input type='text' name='road' value='세종로 17'/>
		<input type='button' id='btnZipFind' onclick='zipFind()' 
		       value='검색' /><br/>
		<select size='20' name='result' id='result'></select>
	</form>
</div>
</body>
</html>
