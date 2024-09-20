package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.Influencer;
import service.ReceiveCampaignService;
import service.ReceiveCampaignServiceImpl;

/**
 * Servlet implementation class Requestcampaign
 */
@WebServlet("/receiveCampaign")
public class ReceiveCampaign extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReceiveCampaign() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		Integer campaignNum = Integer.parseInt(request.getParameter("campaignNum"));
		Influencer influencer = (Influencer)request.getSession().getAttribute("influencer");
		Integer influencerNum = influencer.getInfluencerNum();
		try {
			ReceiveCampaignService service = new ReceiveCampaignServiceImpl();
			service.receiveCampaign(influencerNum, campaignNum);
			boolean receiveStatus = service.receiveStatus(influencerNum, campaignNum);
			response.getWriter().write(String.valueOf(receiveStatus));
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
