package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.Advertiser;

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
		Advertiser advertiser = (Advertiser)request.getSession().getAttribute("advertiser");
		Integer advertiserNum = advertiser.getAdvertiserNum();
		Integer requestCampaignNum = Integer.parseInt(request.getParameter("campaignNum"));
		Integer requestInfluencerNum = Integer.parseInt(request.getParameter("influencerNum"));
		try {
			request.setAttribute("influencerNum", requestInfluencerNum);
			request.setAttribute("advertiserNum", advertiserNum);
			request.setAttribute("requestCampaignNum", requestCampaignNum);
			System.out.println(requestInfluencerNum);
			System.out.println(advertiserNum);
			System.out.println(requestCampaignNum);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

}
