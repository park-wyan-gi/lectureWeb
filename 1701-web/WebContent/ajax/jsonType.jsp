<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>json data 구조형식</h2>
<script>
//1) key:value 형식
var type1 = {'apple':'사과', 'banana':'바나나', 'melon':'메론'};
document.write('<li>' + type1.apple);//사과
document.write('<li>' + type1['banana']); //바나나

//2) 배열 형식
var mnt = ['백두산','지리산','한라산','설악산'];
document.write('<li>' + mnt[0]);//백두산
document.write('<li>' + mnt[3]);//설악산

//3) key:value형식안에 배열 사용
var mntF = {
		'apple':'사과','banana':'바나나',
		'mnt': ['백두산','지리산','한라산', '설악산']
};

document.write("<hr/>");
document.write('<li>' + mntF.apple); // 사과
document.write('<li>' + mntF.mnt[1]);// 지리산
document.write('<li>' + mntF.mnt);//배열의 모든값 출력

//4) 2차원 배열
var river =[
	[1,2,3], //1행
	[4,5,6], //2행
	[7,8,9]	 //3행
];

document.write('<hr/>');
document.write('<li>' + river[0][0]);//1
document.write('<li>' + river[2][2]);//9

//5) 2차원 배열(map)
var riverF =[
	{'apple':'사과', 'banana':'바나나'},
	{'han':'한강','du':'두만강'}	
];

document.write('<hr/>');
document.write('<li>' + riverF[0].banana);//바나나
document.write('<li>' + riverF[1].du);//두만강

//6)응용1

var score1 ={
		'irum1':'홍길동', 'kor1':'90', 'mat1':'70',
		'irum2':'일지매', 'kor2':'70', 'mat2':'60',
		'irum3':'성춘향', 'kor3':'60', 'mat3':'60',
		'irum4':'향단',   'kor4':'90', 'mat4':'90'
}

document.write('<hr/>');
document.write('<li>' + score1.irum1)//홍길동
document.write('<li>' + score1.kor1)//홍길동의 국어 90


//응용2
var score2 = [
	['홍길동',90,70],
	['일지매',70,60],
	['성춘향',60,60],
	['향단',90,90]
]

document.write('<hr/>');
document.write('<li>' + score2[2][0]);//춘향
document.write('<li>' + score2[2][1]);//춘향의 국어
document.write('<li>' + score2[2][2]);//춘향의 수학

//응용3
var score3 =[
	{'irum':'홍길동', 'kor':'90', 'mat':'70'},
	{'irum':'일지매', 'kor':'70', 'mat':'60'},
	{'irum':'성춘향', 'kor':'60', 'mat':'60'},
	{'irum':'향   단', 'kor':'90', 'mat':'90'}
]
document.write('<hr/>');
document.write('<li>' + score3[3].irum);//향단
document.write('<li>' + score3[3].kor);//향단의 국어
document.write('<li>' + score3[3].mat);//향단의 수학

</script>
</body>
</html>








