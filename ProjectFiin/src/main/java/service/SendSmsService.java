package service;

import java.io.IOException;
import java.util.HashMap;

import org.json.simple.JSONObject;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

public class SendSmsService {
	// SMS 요청을 CoolSMS API에 보내는 메서드
    public String sendSmsRequest(String mobileNumber) throws IOException {
    	String API_KEY = System.getenv("API_KEY");
        String API_SECRET = System.getenv("API_SECRET");
        Message coolsms = new Message(API_KEY, API_SECRET);
        String verificationCode = generateVerificationCode();
        
        HashMap<String, String> messageData = new HashMap<>();
        messageData.put("to", mobileNumber);	// 수신자 번호
        messageData.put("from", "01022029308"); // 발신자 번호
        messageData.put("text", "요청하신 파인 서비스 인증코드는 [" + verificationCode + "]입니다.");
        messageData.put("type", "SMS");
		
		try {
            JSONObject obj = (JSONObject) coolsms.send(messageData);
            return verificationCode;
        } catch (CoolsmsException e) {
            System.out.println(e.getMessage());
            //System.out.println(e.getCode());
            return e.getMessage();
        }
    }

    // 인증번호 6자리 생성
    public String generateVerificationCode() {
        return String.valueOf((int) ((Math.random() * 900000) + 100000));
    }
}
