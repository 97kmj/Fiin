package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.Advertiser;
import service.InfluencerService;
import service.InfluencerServiceImpl;

/**
 * Servlet implementation class BookmarkInfluencer
 */
@WebServlet("/bookmarkInfluencer")
public class BookmarkInfluencer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookmarkInfluencer() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		Integer influencerNum = Integer.parseInt(request.getParameter("influencerNum"));
		Advertiser advertiser = (Advertiser)request.getSession().getAttribute("advertiser");
		Integer advertiserNum = advertiser.getAdvertiserNum();
		
		InfluencerService service = new InfluencerServiceImpl();
		
		try {
			boolean isBookmark = service.toggleBookmarkInfluencer(advertiserNum, influencerNum);
			response.getWriter().write(String.valueOf(isBookmark));
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

}
