<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name='viewport' content = 'width=device-width'>
<title>우편 번호 검색</title>
<style>
#title{
   border:0px solid #4444ff;
   width:300px;
   padding:10px;
   box-sizing:border-box;
   margin-bottom:20px;
   box-shadow:3px 3px 5px #aaaaaa;
   border-radius:5px;
   background:linear-gradient(to right, #999999, #ffffff);
}
#find{
   width:246px;
}
#sel{
   width:300px;
}
</style>
<script>
function DataVo(a, z){
	this.address = a;
	this.zip = z;
	this.toString= function(){
		var str = this.address+ "-" + this.zip;
		return str;
	}
}
function start(){
	//data setting
	ary = new Array();
   ary.push(new DataVo('종로1', '11-111'));
   ary.push(new DataVo('종로2', '11-112'));
   ary.push(new DataVo('종로3', '11-113'));
   ary.push(new DataVo('서초1', '11-114'));
   ary.push(new DataVo('서초2', '11-115'));
   ary.push(new DataVo('동작1', '11-116'));
   ary.push(new DataVo('동작2', '11-117'));
   ary.push(new DataVo('동작3', '11-118'));
   ary.push(new DataVo('동작4', '11-119'));
   ary.push(new DataVo('작전5', '11-120'));
	
	var ff = document.frm;
	
	//검색 버튼
	ff.btnFind.onclick = function(){
		ff.sel.length=0;
		var cnt=0;
		 var v = ff.find.value;
		 for(i=0 ; i<ary.length ; i++){
			 var d = ary[i];
			   if(d.address.indexOf(v) >=0){
				   ff.sel.options[cnt] = new Option(d.toString());
				   cnt++;
			   }			 
		 }// end for
	}
	
	//select 
	ff.sel.ondblclick=function(){
		
		var zip = ff.sel.value.split('-');
		var parent = window.opener.document.frm;
		parent.zip1.value = zip[1];
		parent.zip2.value = zip[2];
		parent.address1.value = zip[0];
		self.close();
	}
	
}
</script>

</head>
<body>
<div id='title'>동 이름을 입력해 주세요.</div>
<form name='frm' method='post'>
   <input type='text' name='find'  id='find' value='종로' >
   <input type='button' name='btnFind' value='검색'>
   <p/>
   <select name='sel' id='sel' size='10'></select>
</form>
<script>start()</script>
</body>
</html>