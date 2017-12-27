<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>images</title>
</head>
<body>
<h3>image example<hr/></h3>
<div> 보통이미지로</div>
<img src='../images/poster1.png'>

<div>화면 사이즈 축소</div>
<img src='../images/poster1.png' width='100px'/>

<div>외각선을 지정</div>
<img src='../images/poster2.png' border='30px' width='250px'/>

<p>이미지와 텍스트(기본)</p>
<div>
	<img src='../images/poster3.png' width='200px'/>
	가끔씩 흥미로운 설문조사를 하는 롤링스톤지에서
	21세기 최고의 SF 영화들을 선정했습니다. SF 영화광들에게
	설문을 돌려서 집계를 한 모양인데 재미있는 결과들이 나온
	것 같습니다. 제가 본 영화들도 있고 못 본 영화들도 있고 
	봤지만 왜 리스트에 있는지 납득이 잘 안 되는 영화도 있고
	이 영화가 왜 SF 영화야? 하는 영화도 있고 반가운 영화도 
	있습니다. 여러분들도 한번 확인해 보시고 혹시 놓치신 
	영화들이 있다면 기회가 될 때 한번 찾아보는 것도 좋을 것 같습니다.
</div>

<p>이미지를 텍스트의 왼쪽 배치</p>
<div>
	<img src='../images/poster3.png' width='200px' align='left'/>
	가끔씩 흥미로운 설문조사를 하는 롤링스톤지에서
	21세기 최고의 SF 영화들을 선정했습니다. SF 영화광들에게
	설문을 돌려서 집계를 한 모양인데 재미있는 결과들이 나온
	것 같습니다. 제가 본 영화들도 있고 못 본 영화들도 있고 
	봤지만 왜 리스트에 있는지 납득이 잘 안 되는 영화도 있고
	이 영화가 왜 SF 영화야? 하는 영화도 있고 반가운 영화도 
	있습니다. 여러분들도 한번 확인해 보시고 혹시 놓치신 
	영화들이 있다면 기회가 될 때 한번 찾아보는 것도 좋을 것 같습니다.
</div>

<p>이미지를 텍스트의 오른쪽 배치</p>
<div>
	<img src='../images/poster3.png' width='200px' align='right'/>
	가끔씩 흥미로운 설문조사를 하는 롤링스톤지에서
	21세기 최고의 SF 영화들을 선정했습니다. SF 영화광들에게
	설문을 돌려서 집계를 한 모양인데 재미있는 결과들이 나온
	것 같습니다. 제가 본 영화들도 있고 못 본 영화들도 있고 
	봤지만 왜 리스트에 있는지 납득이 잘 안 되는 영화도 있고
	이 영화가 왜 SF 영화야? 하는 영화도 있고 반가운 영화도 
	있습니다. 여러분들도 한번 확인해 보시고 혹시 놓치신 
	영화들이 있다면 기회가 될 때 한번 찾아보는 것도 좋을 것 같습니다.
</div>

<p>이미지의 상하좌우 여백</p>
<div>
	<img src='../images/poster4.png' width='120px' align='left' 
	     vspace='0px' hspace='10px'/>
	가끔씩 흥미로운 설문조사를 하는 롤링스톤지에서
	21세기 최고의 SF 영화들을 선정했습니다. SF 영화광들에게
	설문을 돌려서 집계를 한 모양인데 재미있는 결과들이 나온
	것 같습니다. 제가 본 영화들도 있고 못 본 영화들도 있고 
	봤지만 왜 리스트에 있는지 납득이 잘 안 되는 영화도 있고
	이 영화가 왜 SF 영화야? 하는 영화도 있고 반가운 영화도 
	있습니다. 여러분들도 한번 확인해 보시고 혹시 놓치신 
	영화들이 있다면 기회가 될 때 한번 찾아보는 것도 좋을 것 같습니다.
</div>

<hr/>
<p>usemap 사용하기</p>
<div>
  <img src='../images/poster4.png' usemap='#mymap'/>
  <map name='mymap'>
  		<area shape='rect'   coords='10,10,200,200'   
  		      href='usemap_doc1.txt' target='frm'/>
  		      
  		<area shape='circle'   coords=350,300,100'   
  		      href='usemap_doc2.txt' target='frm'/>
  		      
  		<area shape='poly'  coords=40,340,240,500,10,510'   
  		      href='usemap_doc3.txt' target='frm'/>
  </map>
  
</div>

<iframe name='frm' width='300px' height='200px'></iframe>


</body>
</html>