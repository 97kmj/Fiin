package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.Advertiser;
import dto.Influencer;
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
		System.out.println(influencerNum );
		try {
			
			InfluencerService service = new InfluencerServiceImpl();
			Influencer influencer = service.influencerDetail(influencerNum);
			Advertiser advertiser = (Advertiser)request.getSession().getAttribute("advertiser");
			Integer advertiserNum = service.checkBookmarkInfluencer(advertiser.getAdvertiserNum(), influencerNum);
			
			
			request.setAttribute("influencerdetail", influencer);
			
			if(advertiser != null) {
				request.setAttribute("BookmarkInfluencer", String.valueOf(advertiserNum!=null));
				
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
