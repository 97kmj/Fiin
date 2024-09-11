package util;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import dto.Campaign;

public class MailUtil {
	
	/*
	 * public static void main(String[] args) {
	 * sendMail("kmj0376@naver.com,junyung0721@naver.com");
	 * System.out.println("success"); }
	 */
	
	private static final String HOST = "smtp.gmail.com";
	private static final String PORT = "465";
	private static final String MAIL_ID = "kmj0376@gmail.com";
	private static final String MAIL_PW = "igvtjwjegvkghuvv";
	
	
	
	public static void sendMail(String receiveEmail,Campaign campaign) {
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
			sb.append("<table align=\"center\" border=\"0\" cellpadding=\"20px\" cellspacing=\"20px\" width=\"600\" style=\"border-collapse: collapse;vertical-align: middle;\">\r\n"
					+ "    <tr>\r\n"
					/*
					 * + "     <td style=\"text-align: center;\" >\r\n" + "       <img src=""> +
					 * "     </td>\r\n"
					 */
					+ "    </tr>\r\n"
					+ "    <tr>\r\n"
					+ "        <td style=\"text-align: center;font-weight:700; font-size:large;padding-top: 10px;padding-bottom: 10px;font-family: '나눔고딕',NanumGothic,'맑은고딕',Malgun Gothic,'돋움',Dotum,Helvetica,'Apple SD Gothic Neo',Sans-serif;\">\r\n"
					+ "           안녕하세요, 인플루언서 회원님의 활동 채널과 카테고리에 맞는 캠페인을 추천드려요.\r\n"
					+ "        </td>\r\n"
					+ "    </tr>\r\n"
					+ "    <tr>\r\n"
					+ "        <td style=\"font-weight: 700;\">캠페인 제목</td>\r\n"
					+ "    </tr>\r\n"
					+ "    <tr>\r\n"
					+ "        <td style=\"padding-left: 20px;\">"+campaign.getCampaignTitle()+"</td>\r\n"
					
					+ "    </tr>\r\n"
					+ "\r\n"
					+ "    <tr>\r\n"
					+ "        <td style=\"font-weight: 700;\">상품명</td>\r\n"
					+ "    </tr>\r\n"
					+ "    <tr>\r\n"
					+ "        <td style=\"padding-left: 20px;\">"+campaign.getProductName()+"</td>\r\n"
					+ "    </tr>\r\n"
					+ "    <tr>\r\n"
					+ "        <td style=\"font-weight: 700;\">요구사항</td>\r\n"
					+ "    </tr>\r\n"
					+ "    <tr>\r\n"
					+ "        <td style=\"padding-left: 20px;\">"+campaign.getRequirement()+"</td>\r\n"
					+ "    </tr>\r\n"
					+ "   </table>");
			String body = sb.toString();
			
			Message mimeMessage = new MimeMessage(mailSession);
            mimeMessage.setFrom(new InternetAddress(MAIL_ID,"Fiin"));
            mimeMessage.setRecipients(Message.RecipientType.TO, InternetAddress.parse(receiveEmail,false));

            mimeMessage.setSubject("파인 맞춤 캠페인 알림");
            
            mimeMessage.setContent(body, "text/html; charset=UTF-8");

            Transport.send(mimeMessage);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
}
