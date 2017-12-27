<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, user-scalable=no">
<title>func1_1</title>
<script>
//---------------------------
// 1) eval
//---------------------------
var str = '2*4+10-5';
var r = eval(str);
document.write("<li>", r);

//----------------------------
//2) parseInt, parseFloat
//----------------------------
var kor = '123';
var eng = '14.5';
var r=0;
kor = parseInt(kor);
eng = parseFloat(eng);
r= kor + eng;
document.write("<li>",r);
//----------------------------
//3) parseInt(v, redix)
//----------------------------
var temp = '123';
var octal = parseInt(temp, 8);
document.write('<li>', octal)
//----------------------------
//4) isFinite isNaN
//----------------------------
var age='18';
var b = isNaN(age);
if(b) document.write('<li> 문자임');
else  document.write('<li> 숫자임');



</script>

</head>
<body>

</body>
</html>