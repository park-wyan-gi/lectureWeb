<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>param</title>
<script>
function paramInit(city){
	var frm = document.frm_param;
	//선택된 라이오버튼의 선택유지
	var cityIndex = -1;
	switch(city){
	case '서울': cityIndex = 0;break;
	case '대구': cityIndex = 1;break;
	case '부산': cityIndex = 2;break;
	case '강릉': cityIndex = 3;break;
	case '제주': cityIndex = 4;break;
	}
	frm.city[cityIndex].checked=true;
	
}

</script>
</head>
<body>
<%request.setCharacterEncoding("utf-8"); %>
<h2>param</h2>
<p>
	&#36{param.XXX}형식으로 post 또는 get 형태의 파라메터를
	가져올 수 있음. 
</p>

<form name='frm_param' method='post'>
	<label>아이디</label>
	<input type='text' name='mid' value='${param.mid }' /><br/>
	<label>당신의 관심사는 ?</label>
	<select name='sel' size='1' >
		<option value='정치' ${(param.sel=='정치') ? 'selected':'' }>정치</option>
		<option value='경제' ${(param.sel=='경제') ? 'selected':'' }>경제</option>
		<option value='사회' ${(param.sel=='사회') ? 'selected':'' }>사회</option>
		<option value='문화' ${(param.sel=='문화') ? 'selected':'' }>문화</option>
		<option value='세계' ${(param.sel=='세계') ? 'selected':'' }>세계</option>
	</select>
	<br/>
	<label>취미는?</label>
	<label><input type='checkbox' name='hobby' value='축구'>축구</label>
	<label><input type='checkbox' name='hobby' value='야구'>야구</label>
	<label><input type='checkbox' name='hobby' value='농구'>농구</label>
	<label><input type='checkbox' name='hobby' value='배구'>배구</label>
	<label><input type='checkbox' name='hobby' value='발야구'>발야구</label>
	<br/>
	<label>가보고 싶은 도시는 ?</label>
	<label><input type='radio' name='city' value='서울'>서울</label>
	<label><input type='radio' name='city' value='대구'>대구</label>
	<label><input type='radio' name='city' value='부산'>부산</label>
	<label><input type='radio' name='city' value='강릉'>강릉</label>
	<label><input type='radio' name='city' value='제주'>제주</label>
	<p/>
	<input type='submit' value='EL Test' />
</form>

<h3>result</h3>
<ul>
	<li>ID : ${param.mid }</li>
	<li>관심사 : ${param.sel }</li>
	<li>도시 : ${param.city}</li>
	<li>취미</li>
		<ul>
			<li>${paramValues.hobby[0] }</li>
			<li>${paramValues.hobby[1] }</li>
			<li>${paramValues.hobby[2] }</li>
			<li>${paramValues.hobby[3] }</li>
			<li>${paramValues.hobby[4] }</li>
		</ul>
</ul>



<script>
	paramInit('${param.city}');
</script>
</body>
</html>