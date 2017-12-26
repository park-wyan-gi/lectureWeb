<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
function EmpVo(eId, fn){
	this.eId = eId;
	this.fn = fn;
	
	//setter
	this.setEId=function(eId){ this.eId = eId ;}
	this.setFn = function(fn){ this.fn = fn ;}
	
	//getter
	this.getEId = function(){return this.eId ;}
	this.getFn = function(){ return this.fn; }
	
	this.toString = function(){
		var str = '<li>ID : ' + this.eId ;
		str += '<li>Name : ' + this.fn;
		return str;
	}
}

function DeptVo(dCode, dName){
	this.dCode = dCode;
	this.dName = dName;
	
	this.setDCode = function(dCode){ this.dCode = dCode; }
	this.setDName = function(dName){ this.dName = dName; }
	
	this.getDCode =function() { return this.dCode; }
	this.getDName = function() { return this.dName ; }
}

function EmpDao(){
	var e1 = new EmpVo(100, 'park');
	document.write(e1.toString());
	
	var e2 = new EmpVo();
	e2.setEId(200);
	e2.setFn('kim');
	document.write(e2.toString());
	
	var e3 = new EmpVo(300, 'hong');
	document.write('<li>' + e3.getEId());
	document.write('<li>' + e3.getFn());
	
	document.write("<hr/>");
	var emps = [e1, e2, e3]; //객체를 배열로 저장
	for(i=0 ; i<emps.length ; i++){
		document.write(emps[i].toString());
	}
}

var dao = new EmpDao();

</script>
</body>
</html>