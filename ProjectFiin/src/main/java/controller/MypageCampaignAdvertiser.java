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
import service.ReceiveCampaignService;
import service.ReceiveCampaignServiceImpl;
import util.PageInfo;

/**
 * Servlet implementation class MypageCampaignAdvertiser
 */
@WebServlet("/mypageCampaignAdvertiser")
public class MypageCampaignAdvertiser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MypageCampaignAdvertiser() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String paramPage = request.getParameter("page");
		
		Integer page =1;
		if (paramPage != null) {
			page = Integer.parseInt(paramPage);
		}
		
		Advertiser advertiser = (Advertiser)request.getSession().getAttribute("advertiser");
		Integer advertiserNum = advertiser.getAdvertiserNum();
		try {
			//페이지 수
			PageInfo pageInfo = new PageInfo();
			pageInfo.setCurPage(page);
			
			
			//캠페인 리스트
			CampaignService service = new CampaignServiceImpl();
			List<Campaign> campaignList = service.campaignListForAdvertiser(advertiserNum);
			System.out.println(campaignList);
			request.setAttribute("pageInfo", pageInfo);
			request.setAttribute("campaignList", campaignList);
			
			request.getRequestDispatcher("/mypage/mypage_campaign_advertiser.jsp").forward(request, response);

		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("err", e.getMessage());
			request.getRequestDispatcher("err.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	}

}
