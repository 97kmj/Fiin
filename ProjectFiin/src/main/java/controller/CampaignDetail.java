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
import service.ReceiveCampaignService;
import service.ReceiveCampaignServiceImpl;

/**
 * Servlet implementation class CampaignDetail
 */
@WebServlet("/campaignDetail")
public class CampaignDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CampaignDetail() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			Integer campaignNum = Integer.parseInt(request.getParameter("campaignNum"));
			String type = (String)request.getSession().getAttribute("type");
			
			
		try {
			
			CampaignService service = new CampaignServiceImpl();
			ReceiveCampaignService reservice= new ReceiveCampaignServiceImpl();

			List<Category> categoryList;
			categoryList = service.categoryList();
			
			Campaign campaign = service.detail(campaignNum);
			
			
			if(type==null) { //비로그인
			
			} else if (type.equals("influencer")) { //인플루언서 로그인 

				Influencer influencer = (Influencer)request.getSession().getAttribute("influencer");
				Integer influencerNum = influencer.getInfluencerNum();
				Integer cbookmarkNum = service.checkBookmark(influencerNum,campaignNum);

				boolean requestCampaign = reservice.receiveCampaign(influencerNum,campaignNum);
				request.setAttribute("requestCampaign", requestCampaign);
				//북마커
				request.setAttribute("bookmarkCampaign", String.valueOf(cbookmarkNum!=null));
				
				
			} else {  //광고주 로그인
				
			}
			
			

			request.setAttribute("categoryList", categoryList);
			request.setAttribute("campaign", campaign);

			request.getRequestDispatcher("campaign/campaign_detail.jsp").forward(request, response);
			
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
		
		Integer campaignNum = Integer.parseInt(request.getParameter("campaignNum"));
		Integer status = Integer.parseInt(request.getParameter("status"));

		
		try {
			CampaignService service = new CampaignServiceImpl();
			service.campaignIsRecruit(campaignNum,status);
			Campaign campaign = service.detail(campaignNum);
			
			request.setAttribute("campaign", campaign);
			response.setCharacterEncoding("utf-8");
			response.getWriter().write("성공");
		}catch(Exception e){
			e.printStackTrace();
			request.setAttribute("err", e.getMessage());
			request.getRequestDispatcher("err.jsp").forward(request, response);
		}
		
	}

}
