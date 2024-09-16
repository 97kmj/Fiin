package controller;

import java.io.IOException;
import java.util.List;

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
 * Servlet implementation class MypageBookmarkAd
 */
@WebServlet("/mypageBookmarkAdvertiser")
public class MypageBookmarkAdvertiser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MypageBookmarkAdvertiser() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		
		try {
			InfluencerService service = new InfluencerServiceImpl();
			
			
			Advertiser advertiser = (Advertiser)request.getSession().getAttribute("advertiser");
			Integer advertiserNum = advertiser.getAdvertiserNum();
			
			System.out.println(advertiserNum);
			List<Influencer> ibookmarkList = service.influencerBookmarkForMypage(advertiserNum);
			
			System.out.println("Bookmark List Size: " + ibookmarkList.size());

			request.setAttribute("ibookmarkList", ibookmarkList);
			request.getRequestDispatcher("mypage/mypage_bookmark_advertiser.jsp").forward(request, response);			
		} catch(Exception e) {
			e.printStackTrace();
			request.setAttribute("err", "북마크 목록을 불러오는데 실패했습니다");
			request.getRequestDispatcher("err.jsp").forward(request, response);
		}
	}

}
