package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.Campaign;
import service.CampaignService;
import service.CampaignServiceImpl;
import service.InfluencerService;
import service.InfluencerServiceImpl;
import util.MailUtil;

/**
 * Servlet implementation class SendEmail
 */
@WebServlet("/sendEmail")
public class SendEmail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SendEmail() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		Integer campaignNum = Integer.parseInt(request.getParameter("campaignNum"))	;
		try {
			CampaignService cService = new CampaignServiceImpl();
			InfluencerService iService = new InfluencerServiceImpl();
			Campaign campaign = cService.detail(campaignNum);
			List<String> receiveEmailList = iService.getEmaliListByCampaign(campaign);
			System.out.println(receiveEmailList);
			String receiveEmails = "";
			for(String receiveEmail : receiveEmailList) {
				receiveEmails += receiveEmail+",";
			}
			MailUtil.sendMail(receiveEmails, campaign);
				
			response.setCharacterEncoding("utf-8");
			response.getWriter().write("메일 보내기 완료");
		} catch (Exception e) {
			e.printStackTrace();
			
		}
	}

}
