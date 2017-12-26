<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>img_tag</title>
</head>
<body>
<h1>img tag</h1>
<h2>절대 경로를 사용한 이미지 경로 설정</h2>
<div> src='/web1705/img1.png'</div>
<img src='/web1705/img1.png' alt='img1' />

<div>src='/web1705/chapter2/img2.png'</div>
<img src ='/web1705/chapter2/img2.png'/>

<div>src='/web1705/imgs/img3.png'</div>
<img src='/web1705/imgs/img3.png' />

<h2>상대 경로를 사용한 이미지 경로 설정</h2>
<div> 현재 경로와 같이 있는 이미지 <br/>
src = 'img2.png'  or src = './img2.png'        
</div>
<img src = 'img2.png' />

<div> 현재 경로보다 한 단계 상위에 있는 이미지 경로<br/>
src = '../img1.png'
</div>
<img src = '../img1.png' />

<div> 한 단계 상위에 있는 경로중 하위 경로에 있는 이미지<br/>
src = '../imgs/img3.png'
</div>
<img src='../imgs/img3.png' />

</body>
</html>








