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
import dto.RequestCampaign;
import service.CampaignService;
import service.CampaignServiceImpl;
import service.RequestCampaignService;
import service.RequestCampaignServiceImpl;

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

		try {
			
			CampaignService service = new CampaignServiceImpl();
			List<Category> categoryList;
			
			categoryList = service.categoryList();
			Campaign campaign = service.detail(campaignNum);
			
			Influencer influencer = (Influencer)request.getSession().getAttribute("influencer");
			Integer infulencerNum = service.checkBookmark(influencer.getInfluencerNum(),campaignNum);
			
			RequestCampaignService reservice= new RequestCampaignServiceImpl();
			boolean requestCampaign = reservice.requestCampaign( infulencerNum,campaignNum);
			
			
			request.setAttribute("requestCampaign", requestCampaign);
			request.setAttribute("categoryList", categoryList);
			request.setAttribute("campaign", campaign);

			if(influencer!=null) {//로그인 되었을 경우에만 좋아요 조회

				request.setAttribute("bookmarkCampaign", String.valueOf(infulencerNum!=null));
			}
			
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
