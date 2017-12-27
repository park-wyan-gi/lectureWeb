<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name='viewport' content='width=device-width'>
<title>object 생성 방법들</title>
<style>
.item{
   border:1px solid #aaaaaa;
   padding:10px;
   box-shadow:3px 3px 5px #aaaaaa;
   width:200px;
   margin-bottom:10px;
}
</style>

<script>
/* 1)리터럴을 사용하여 객체를 정의.
       필드와 메서드는 동적으로 생성됨.
*/
var o1 = {};
o1.x=100;
o1.y=200;
o1.sum = function(){
	var r = this.x + this.y;
	return r;
}

document.write(o1.sum());

/* function 을 사용하여 객체 정의.
 * 재사용 가능.
 */
function MemberVo(n, a, p){
	this.name = n;
	this.address = a;
	this.phone = p;
	this.toString=function(){
		var str = "<div class='item'>";
	      str += "<div> Name : "    + this.name + "</div>";
	      str += "<div> Address : " + this.address + "</div>";
	      str += "<div> Phone : "    + this.phone + "</div>";
	      str += '</div>';
	      return str;
	}
	
	this.output = function(){
		return 'output';
	}
}

MemberVo.sum = function(){
	return 100;
}

var m1 = new MemberVo('park', 'seoul', '111-1111');
var m2 = new MemberVo('kim',' busan', '222-2222');
var m3 = new MemberVo('lee', 'jeju', '333-3333');

document.write(m1.toString());
document.write(m2.toString());
document.write(m3.toString());

//document.write(MemberVo.output());
document.write(MemberVo.sum());


</script>
</head>
<body>

</body>
</html>