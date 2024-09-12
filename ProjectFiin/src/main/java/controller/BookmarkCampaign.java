package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.Influencer;
import service.CampaignService;
import service.CampaignServiceImpl;

/**
 * Servlet implementation class BookmarkCampaign
 */
@WebServlet("/bookmarkCampaign")
public class BookmarkCampaign extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookmarkCampaign() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		Integer campaignNum = Integer.parseInt(request.getParameter("campaignNum"));
		System.out.println(campaignNum);
		Influencer influencer = (Influencer)request.getSession().getAttribute("influencer");
		Integer influencerNum = influencer.getInfluencerNum();
		System.out.println(influencerNum);
		try {
			CampaignService service = new CampaignServiceImpl();
			boolean bookchecked = service.toggleCampaign(influencerNum,campaignNum);
			System.out.println(bookchecked);
			response.getWriter().write(String.valueOf(bookchecked));
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
