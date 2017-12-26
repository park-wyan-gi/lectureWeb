<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>list2</h3>
	<jsp:include page="/board" flush="false">
		<jsp:param value="test.do" name="inc_left"/>
	</jsp:include>
	<h3>list3</h3>
	<jsp:include page="/board" flush="false">
		<jsp:param value="list3.do" name="inc_left"/>
	</jsp:include>
	<h3>list4</h3>
	<jsp:include page="/board" flush="false">
		<jsp:param value="list4.do" name="inc_left"/>
	</jsp:include>

</body>
</html>