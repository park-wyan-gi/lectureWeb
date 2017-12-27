<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, user-scalable=no">
<title>menu</title>
<style>
#menu{
	border:2px solid #dddddd;
	border-radius:10px;
	box-shadow:2px 3px #eeeeee;
	box-sizing:border-box;
	padding:10px;
	width:250px;
}
a:link{
  text-decoration: none;
}
a:hover{
  text-decoration: underline;
}

</style>
</head>
<body>
<nav id='menu'>
	<div>
		<h5>HTML</h5>	
		<ol>
			<li><a href='./begin/test.jsp'>연습</a></li>
			<li><a href='./html/body.jsp'>body 태그</a></li>
			<li><a href='./html/body2.jsp'>body background image</a></li>
			<li><a href='./html/font.jsp'>font</a></li>
			<li><a href='./html/font-style.jsp'>font style</a></li>
			<li><a href='./html/headline.jsp'>head line</a></li>
			<li><a href='./html/paragraph.jsp'>문단 태그</a></li>					
			<li><a href='./html/anchor.jsp'>앵커 태그</a></li>
			<li><a href='./html/fieldset.jsp'>fieldset 태그</a></li>
			<li><a href='./html/images.jsp'>image 태그</a></li>
			<li><a href='./html/list_tag.jsp'>list 태그</a></li>
			<li><a href='./html/material_input.jsp'>제품코드 입력폼</a></li>
			<li><a href='./html/radioAndCheckbox.jsp'>radio and checkbox 태그</a></li>
			<li><a href='./html/form.jsp'>form 태그</a></li>
			<li><a href='./html/form2.jsp'>form 태그(II)</a></li>
			<li><a href='./html/table.jsp'>table 태그</a></li>
			<li><a href='./html/table2.jsp'>table 태그(II)</a></li>
			<li><a href='./html/multimedia.jsp'>multimedia 태그</a></li>
			<li><a href='./html/marquee.jsp'>marquee 태그</a></li>
		</ol>
	</div>
	
	<div>
		<h5>Multi Media</h5>
		<ol>
			<li><a href='./multimedia/multimedia.jsp'>audio and video</a></li>
		</ol>
	</div>

	<div>
		<h5>Canvas</h5>
		<ol>
			<li><a href='./canvas/drawRect.jsp'>drawRect</a></li>
			<li><a href='./canvas/drawBarGraph.jsp'>drawBarGraph</a></li>
			<li><a href='./canvas/arc.jsp'>arc</a></li>
			<li><a href='./canvas/gradient.jsp'>gradient</a></li>
			<li><a href='./canvas/lineDash.jsp'>lineDash</a></li>
			<li><a href='./canvas/drawImage.jsp'>drawImage</a></li>
		</ol>
	</div>

	<div>
		<h5>GeoLocation</h5>
		<ol>
			<li><a href='./geolocation/myhome.jsp'>my home</a></li>
		</ol>
	</div>
	<div>
		<h5>Web Storage</h5>
		<ol>
			<li><a href='./storage/localStorage.jsp'>local storage</a></li>
			<li><a href='./storage/objectLocalStorage.jsp'>storage(Obejct저장)</a></li>
		</ol>
	</div>
	<div>
		<h5>Web Worker</h5>
		<ol>
			<li><a href='./worker/nonWorker.jsp'>nonWorker</a></li>
			<li><a href='./worker/worker.jsp'>worker</a></li>
		</ol>
	</div>

</nav>
</body>
</html>