<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, user-scalable=no">
<title>trans_layout1</title>
<style>
#content{
   border:1px solid #aaaaaa;
   height:100px;
}
@media screen and (max-width:600px){
	#content{
		background-color:#ff0000;
	}
}

@media screen and (min-width:600px) and (max-width:800px){
	#content{
		background-color: #ccccff;
	}
}
@media screen and (min-width:800px) and (max-width:1200px){
	#content{
		background-color: #00ffff;
	}

}
</style>
</head>
<body>
<h3>반응형 웹페이지</h3>
<div><xmp>
<style/>태그 안에서 @media 속성을 사용.
@media screen and (min-width:크기) [ and (max-width:크기) ]{
  스타일 속성;
}
</xmp></div><hr/>
<div id='content'></div>

</body>
</html>