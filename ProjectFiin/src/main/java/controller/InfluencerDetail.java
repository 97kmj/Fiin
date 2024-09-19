package controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

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

/**
 * Servlet implementation class InfluencerDetail
 */
@WebServlet("/influencerDetail")
public class InfluencerDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public InfluencerDetail() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		Integer influencerNum = Integer.parseInt(request.getParameter("num"));
		Integer ibookmarkNum;
		
		
		try {
			
			InfluencerService service = new InfluencerServiceImpl();
			CampaignService cservice = new CampaignServiceImpl();
			Map<String, Object> influencer = service.influencerDetail(influencerNum);
			Advertiser advertiser = (Advertiser)request.getSession().getAttribute("advertiser");
			Integer advertiserNum = advertiser.getAdvertiserNum();
			List<Campaign> campaignRequest = cservice.campaignListForRequest(advertiserNum);
			System.out.println(campaignRequest.toString());
			request.setAttribute("influencerdetail", influencer);
			
			if(advertiser != null) {
				ibookmarkNum = service.checkBookmarkInfluencer(advertiser.getAdvertiserNum(), influencerNum);
				request.setAttribute("bookmarkInfluencer", String.valueOf(ibookmarkNum!=null));
				request.setAttribute("campaignRequest", campaignRequest);
			}
			request.getRequestDispatcher("influencer/influencer_detail.jsp").forward(request, response);
			
		} catch (Exception e) { 
			e.printStackTrace();
			request.setAttribute("err", e.getMessage());
			request.getRequestDispatcher("err.jsp");
		}
	}
 
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
