package bean;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class MyAuth extends Authenticator{
	PasswordAuthentication pa;
	
	protected PasswordAuthentication getPasswordAuthentication(){
		String u = "hipwg@naver.com";
		String p = "hipwg7737";
		pa = new PasswordAuthentication(u, p);
		
		return pa;
	}
}
