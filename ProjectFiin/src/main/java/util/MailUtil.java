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
	private static final String MAIL_ID = System.getenv("MAIL_ID");
	private static final String MAIL_PW = System.getenv("MAIL_PW");
	
	
	
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
			sb.append("<center><table align=\"center\" border=\"0\" cellpadding=\"40px\" cellspacing=\"40px\" width=\"800\" style=\"border-collapse: collapse;vertical-align: middle;border-spacing: 10px;\">\r\n"
					+ "    <tr>\r\n"
					+ "        <td style=\"text-align: center;font-weight:700; font-size:x-large;padding-top: 10px;padding-bottom: 10px;background-color:#4849e8;color:#ffffff;\">\r\n"
					+ "           Fiin "
					+ "        </td>\r\n"
					+ "    </tr>\r\n"
					+ "    <tr>\r\n"
					+ "        <td style=\"text-align:center;font-weight:700; font-size:large; padding-top: 10px;padding-bottom: 10px;\">\r\n"
					+ "           광고주님께서 인플루언서 회원님의 활동 채널과 카테고리에 맞는 캠페인을 \n 추천드려요.\r\n"
					+ "        </td>\r\n"
					+ "    </tr>\r\n"
					+ "    <tr>\r\n"
					+ "        <td style=\"text-align:center;padding-left: 20px;font-size:large;\"><img src=\"http://localhost:8080/fiin/image?file="+campaign.getImage()+"\"></td>\r\n"
					+ "    </tr>\r\n"
					+ "    <tr>\r\n"
					+ "    </tr>\r\n"
					+ "    <tr>\r\n"
					+ "        <td style=\"font-weight: 700;font-size:large;\">캠페인 제목</td>\r\n"
					+ "    </tr>\r\n"
					+ "    <tr>\r\n"
					+ "        <td style=\"padding-left: 20px;\">"+campaign.getCampaignTitle()+"</td>\r\n"
					+ "    </tr>\r\n"
					+ "    <tr>\r\n"
					+ "    </tr>\r\n"
					+ "    <tr>\r\n"
					+ "        <td style=\"font-weight: 700;font-size:large;\">업체명</td>\r\n"
					+ "    </tr>\r\n"
					+ "    <tr>\r\n"
					+ "        <td style=\"padding-left: 20px;\">"+campaign.getCompanyName()+"</td>\r\n"
					+ "    </tr>\r\n"
					+ "    <tr>\r\n"
					+ "    </tr>\r\n"
					+ "    <tr>\r\n"
					+ "        <td style=\"font-weight: 700;font-size:large;\">상품명</td>\r\n"
					+ "    </tr>\r\n"
					+ "    <tr>\r\n"
					+ "        <td style=\"padding-left: 20px;\">"+campaign.getProductName()+"</td>\r\n"
					+ "    </tr>\r\n"
					+ "    <tr>\r\n"
					+ "    </tr>\r\n"
					+ "    <tr>\r\n"
					+ "        <td style=\"font-weight: 700;font-size:large;\">요구사항</td>\r\n"
					+ "    </tr>\r\n"
					+ "    <tr>\r\n"
					+ "        <td style=\"padding-left: 20px;font-size:large;\">"+campaign.getRequirement()+"</td>\r\n"
					+ "    </tr>\r\n"
					+ "   </table></center>");
			String body = sb.toString();
			
			Message mimeMessage = new MimeMessage(mailSession);
            mimeMessage.setFrom(new InternetAddress(MAIL_ID,"Fiin"));
            mimeMessage.setRecipients(Message.RecipientType.TO, InternetAddress.parse(receiveEmail,false));

            mimeMessage.setSubject("파인 맞춤 캠페인 "+campaign.getCampaignTitle());
            
            mimeMessage.setContent(body, "text/html; charset=UTF-8");

            Transport.send(mimeMessage);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
}
