package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.Advertiser;
import dto.Campaign;
import service.CampaignService;
import service.CampaignServiceImpl;
import service.InfluencerService;
import service.InfluencerServiceImpl;
import service.PointService;
import service.PointServiceImpl;
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
		Integer campaignNum = Integer.parseInt(request.getParameter("campaignNum"));
		String type = (String)request.getSession().getAttribute("type");
		Advertiser advertiser = (Advertiser)request.getSession().getAttribute("advertiser");
		Integer advertiserNum = advertiser.getAdvertiserNum();
		Integer curPointBalance = advertiser.getPointBalance();
		try {
			CampaignService cService = new CampaignServiceImpl();
			InfluencerService iService = new InfluencerServiceImpl();
			PointService pService = new PointServiceImpl();
			Campaign campaign = cService.campaignDetail(campaignNum);
			List<String> receiveEmailList = iService.getEmaliListByCampaign(campaign);
			System.out.println(receiveEmailList);
			String receiveEmails = "";
			for(String receiveEmail : receiveEmailList) {
				receiveEmails += receiveEmail+",";
			}
			if(curPointBalance >= 300) {
				MailUtil.sendMail(receiveEmails, campaign);
				pService.updatePointBalance(type, advertiserNum, -300);
				pService.insertPointRecord(type, advertiserNum,-300, "이메일 발송");
				Integer pointBalance = pService.getPointBalance(type, advertiserNum);
				advertiser.setPointBalance(pointBalance);
				request.getSession().setAttribute("advertiser", advertiser);
				response.setCharacterEncoding("utf-8");
				response.getWriter().write("success");
			} else {
				response.setCharacterEncoding("utf-8");
				response.getWriter().write("fail");
			}
			
				
		} catch (Exception e) {
			e.printStackTrace();
			
		}
	}

}
