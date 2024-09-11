package util;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class MailUtil {
	
	public static void main(String[] args) {
		sendMail("kmj0376@naver.com,junyung0721@naver.com");
		System.out.println("success");
	}
	
	private static final String HOST = "smtp.gmail.com";
	private static final String PORT = "465";
	private static final String MAIL_ID = "kmj0376@gmail.com";
	private static final String MAIL_PW = "igvtjwjegvkghuvv";
	
	
	
	public static void sendMail(String receiveEmail) {
		Properties props = new Properties();
		props.put("mail.transport.protocol","smtp");
		props.put("mail.smtp.host", HOST);
		props.put("mail.smtp.port", PORT);
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.ssl.trust", HOST);
        props.put("mail.smtp.ssl.enable", "true");
        props.put("mail.smtp.ssl.protocols", "TLSv1.2");
		
	    try {
			// 메일 서버 인증 계정 설정
			Authenticator auth = new Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(MAIL_ID, MAIL_PW);
				}
			};

			// 메일 세션 생성
			Session mailSession = Session.getInstance(props, auth);
			
			//메일에 출력할 텍스트
			StringBuffer sb = new StringBuffer();
			sb.append("<h2>메일 테스트입니다</h2>\n");
			sb.append("<h3>메일 테스트입니다</h3>");
			String body = sb.toString();
			
			Message mimeMessage = new MimeMessage(mailSession);
            mimeMessage.setFrom(new InternetAddress(MAIL_ID,"Fiin"));
            mimeMessage.setRecipients(Message.RecipientType.TO, InternetAddress.parse(receiveEmail,false));

            mimeMessage.setSubject("메일 테스트");
            
            mimeMessage.setContent(body, "text/html; charset=UTF-8");

            Transport.send(mimeMessage);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
