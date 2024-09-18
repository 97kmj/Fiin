package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.Advertiser;
import service.RequestCampaignService;
import service.RequestCampaignServiceImpl;

/**
 * Servlet implementation class RequestCampaign
 */
@WebServlet("/requestCampaign")
public class RequestCampaign extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RequestCampaign() {
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
		response.setCharacterEncoding("utf-8");
		Advertiser advertiser = (Advertiser)request.getSession().getAttribute("advertiser");
		Integer advertiserNum = advertiser.getAdvertiserNum();
		Integer requestCampaignNum = Integer.parseInt(request.getParameter("campaignNum"));
		Integer requestInfluencerNum = Integer.parseInt(request.getParameter("influencerNum"));
		
		try {
			RequestCampaignService service = new RequestCampaignServiceImpl();
			boolean requestCampaign = service.requestCampaign(requestInfluencerNum, requestCampaignNum);
			
			request.setAttribute("requestCampaign", requestCampaign);
			request.setAttribute("influencerNum", requestInfluencerNum);
			request.setAttribute("advertiserNum", advertiserNum);
			request.setAttribute("campaignNum", requestCampaignNum);

			if(requestCampaign == true) {
				response.getWriter().write("캠페인 요청이 성공적으로 처리되었습니다.");
				response.getWriter().flush();
			} else {
				response.getWriter().write("이미 제안한 캠페인입니다.");
				response.getWriter().flush();
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

}
