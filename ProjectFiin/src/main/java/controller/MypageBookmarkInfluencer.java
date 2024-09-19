package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.Campaign;
import dto.Influencer;
import service.CampaignService;
import service.CampaignServiceImpl;

/**
 * Servlet implementation class MypageBookmarkInfluencer
 */
@WebServlet("/mypageBookmarkInfluencer")
public class MypageBookmarkInfluencer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MypageBookmarkInfluencer() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		
		try {
			CampaignService service = new CampaignServiceImpl();
			
			Influencer influencer = (Influencer)request.getSession().getAttribute("influencer");
			Integer influencerNum = influencer.getInfluencerNum();
			System.out.println(influencerNum);
			
			List<Campaign> cbookmarkList = service.campaignBookmarkForMypage(influencerNum);
			System.out.println("bookmarkSize:"+cbookmarkList.size());
			
			request.setAttribute("cbookmarkList",cbookmarkList);
			request.getRequestDispatcher("mypage/mypage_bookmark_influencer.jsp").forward(request, response);
			
		} catch(Exception e) {
			e.printStackTrace();
			request.setAttribute("err", "북마크 목록을 불러오는데 실패했습니다");
			request.getRequestDispatcher("err.jsp").forward(request, response);
		}
		
		}

}
