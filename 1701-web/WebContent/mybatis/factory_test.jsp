<%@page import="java.util.List"%>
<%@page import="bean.BoardVo"%>
<%@page import="bean.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="myba.BoardFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
try{
	SqlSession bf = BoardFactory.getFactory().openSession();
	out.print("<li>OK");
	
	int cnt = (int)bf.selectOne("member.count");
	out.print("<li>count=" + cnt);
	
	String pwd = (String)bf.selectOne("member.getPwd", "aaaa" );
	out.print("<li> pwd=" + pwd);
	
	String subject = (String)bf.selectOne("member.getSubject",100);
	out.print("<li>subject=" + subject);
	
	boolean b = (boolean)bf.selectOne("member.worker","kim");
	out.print("<li>kim 씨는 ");
	if(b) out.print("작성한 이력이 있습니다.");
	else  out.print("작성한 이력이 없습니다.");
	
	out.print("<li>홍길동 씨는 ");
	b = (boolean)bf.selectOne("member.worker","홍길동");
	if(b) out.print("작성한 이력이 있습니다.");
	else  out.print("작성한 이력이 없습니다.");
	
	BoardVo v = new BoardVo();
	v.setSerial(563);
	
	BoardVo r = (BoardVo)bf.selectOne("member.board", v);
	out.print("<hr>");
	out.print("<li>serial=" + r.getSerial());
	out.print("<li>subject=" + r.getSubject());
	out.print("<li>worker=" + r.getWorker());
	out.print("<li>content=" + r.getContent());
	
	//검색된 게시판 목록
	String findStr="hi";
	v = new BoardVo();
	v.setFindStr(findStr);
	
	List<BoardVo> data = bf.selectList("member.list", v);
	out.print("<hr/><h4>Board LIST</h4>");
	for(int i=0 ; i<data.size() ; i++){
		
		String temp = 
				String.format("<div><span>%d</span><span>%s</span><span>%s</span></div>",
						data.get(i).getSerial(), data.get(i).getWorker(), 
						data.get(i).getSubject() );
		out.print(temp);
	}
	
	
	
	
	bf.close();
}catch(Exception ex){
	out.print(ex.toString());
}

%>
</body>
</html>