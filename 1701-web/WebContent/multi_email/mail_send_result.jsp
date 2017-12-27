<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="javax.mail.Address"%>
<%@page import="java.io.File"%>
<%@page import="javax.activation.DataHandler"%>
<%@page import="javax.activation.FileDataSource"%>
<%@page import="javax.mail.internet.MimeBodyPart"%>
<%@page import="javax.mail.internet.MimeMultipart"%>
<%@page import="javax.mail.Multipart"%>
<%@page import="javax.mail.Transport"%>
<%@page import="java.util.Date"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.Message"%>
<%@page import="bean.MyAuth"%>
<%@page import="javax.mail.Session"%>
<%@page import="java.util.Properties"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>메일 전송 결과</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
String uploadPath = "c:/tempMail/";
MultipartRequest multi = null;
int size = 1024 * 1024 * 50;

//메일폼과 관련된 변수
String receiver  = ""; //수신자
String sender    = ""; //발신자
String subject   = ""; //제목
String content  = ""; //내용
List<String> file = new ArrayList<String>(); //첨부 파일명

multi = new MultipartRequest(request, uploadPath, size, "utf-8",
		            new DefaultFileRenamePolicy()		);

//첨부파일
Enumeration files = multi.getFileNames();
while(files.hasMoreElements()){// 첨부파일이 있는 경우에만
	String tag = (String)files.nextElement();
	String f = multi.getFilesystemName(tag);
	if(f == null) continue;
	file.add(f);
}

sender   = multi.getParameter("sender");
receiver = multi.getParameter("receiver");
subject  = multi.getParameter("subject");
content = multi.getParameter("content");

//----------------------------------------
//메일전송 로직
//----------------------------------------
String mailServer = "smtp.naver.com";//메일 전송 서버주소

try{
	// 메일전송과 관련된 속성을 생성 저장
	Properties prop = new Properties();
	prop.put("mail.smtp.starttls.enable", "true");
	prop.put("mail.transport.protocol", "smtp");
	prop.put("mail.smtp.port", "465");
	prop.put("mail.smtp.auth", "true");
	prop.put("mail.smtp.user", sender);
	prop.put("mail.smtp.host", mailServer);
	
	//ssl보안연결 활성화
	prop.put("mail.smtp.ssl.enable", "true");
	
	// 다중 유저 설정
	String[] temp = receiver.split(",");
	Address[] cc = new Address[temp.length];
	for(int i=0 ; i<cc.length ; i++){
		cc[i] = new InternetAddress(temp[i].trim());
	}

	
	// 기본 메시지 설정
	Session mailSession = Session.getInstance(prop, new MyAuth());
	Message msg = new MimeMessage(mailSession);
	msg.setFrom(new InternetAddress(sender));
	msg.setRecipients(Message.RecipientType.TO, cc);
	msg.setSubject(subject);
	msg.setSentDate(new Date());
	//msg.setContent(content, "text/html;charset=utf-8");
	
	Multipart part = new MimeMultipart();//문자와 이미지를 동시에 보내기 위한 객체
	
	//문자 정보를 추가.
	MimeBodyPart text = new MimeBodyPart();
	text.setContent(content, "text/html;charset=utf-8");
	part.addBodyPart(text);

	// 첨부파일 처리
	out.print("<li> size :" + file.size());
	out.print("<li>" + file.get(0));
	for(String f : file){
		out.print("<li>" + f );
		MimeBodyPart img = new MimeBodyPart();
		FileDataSource fds = new FileDataSource(uploadPath + f);
		img.setDataHandler(new DataHandler(fds));
		img.setFileName(fds.getName());
		part.addBodyPart(img);
	}

	msg.setContent(part);
	Transport.send(msg);
	
}catch(Exception ex){
	out.print(ex.toString());
}finally{
	for(String ff : file){
		File f = new File(uploadPath + ff);
		if(f.exists()) f.delete();
	}
}

%>
</body>
</html>