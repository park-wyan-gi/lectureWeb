<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>array</title>
</head>
<body>
<script>
function numberSort(a, b){
	var x = Number(a);
	var y = Number(b);
	return x-y;
}

//초기값 5개를 사용하여 배열을 선언하여 그 결과를 출력
var array1 = new Array(10,30,50,70,90);
document.write(array1);
document.write('<br/> join : ' + array1.join('------'));
document.write('<br/> reverse : ' + array1.reverse());

var array2 = new Array(23,423,52,35,2346,2,51,234,4,2,5,24,2,1,32462345,41,34,13,4);
var sortArray = array2.sort();
document.write('<br/> 문자형 정렬 : ' + sortArray.join('<br/>'));

//배열의 값을 숫자형으로 정렬
var numSort = array2.sort(numberSort);
document.write('<br/>숫자형 정렬 : ' + numSort.join('<br/>'));
document.write('<br/>숫자형 내림차순 : ' + numSort.reverse().join('<br/>'));
</script>


</body>
</html>