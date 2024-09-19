package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.Campaign;
import dto.Category;
import dto.Influencer;
import service.CampaignService;
import service.CampaignServiceImpl;
import util.PageInfo;

/**
 * Servlet implementation class MypageCampaignInfluencer
 */
@WebServlet("/mypageCampaignInfluencer")
public class MypageCampaignInfluencer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MypageCampaignInfluencer() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//인플루언서 no 가져오기
		Influencer influencer = (Influencer)request.getSession().getAttribute("influencer");
		Integer influencerNum = influencer.getInfluencerNum();
		

		//신청한 캠페인 번호 받아오기
		try {
			CampaignService service = new CampaignServiceImpl();
			
			List<Campaign> receiveCampaignList;
			List<Category> categoryList;
			categoryList = service.categoryList();
			
			receiveCampaignList = service.getReceiveCampaignList(influencerNum);
			request.setAttribute("campaignListReceive", receiveCampaignList);
			request.setAttribute("categoryList", categoryList);
			request.getRequestDispatcher("mypage/mypage_campaign_influencer.jsp").forward(request, response);
		}catch(Exception e) {
			e.printStackTrace();
			request.setAttribute("err", e.getMessage());
			request.getRequestDispatcher("err.jsp").forward(request, response);
		}
		
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
