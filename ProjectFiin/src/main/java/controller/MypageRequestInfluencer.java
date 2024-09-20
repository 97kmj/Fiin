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
import dto.Category;
import service.CampaignService;
import service.CampaignServiceImpl;
import service.RequestCampaignService;
import service.RequestCampaignServiceImpl;

@WebServlet("/requestInfluencer")
public class MypageRequestInfluencer extends HttpServlet {

  private static final long serialVersionUID = 1L;


	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		Advertiser advertiser = (Advertiser) req.getSession().getAttribute("advertiser");
		Integer advertiserNum = advertiser.getAdvertiserNum();
		List<Category> categoryList;
		try {
			RequestCampaignService rService = new RequestCampaignServiceImpl();	
			CampaignService cService = new CampaignServiceImpl();
			
			categoryList = cService.categoryList();
			
			
			List<Map<String,Object>> requestList = rService.getRequestInfluencerList(advertiserNum);
			System.out.println(requestList);
			req.setAttribute("requestList", requestList);
			req.setAttribute("categoryList", categoryList);
			req.getRequestDispatcher("/mypage/mypage_advertiser_requestedInfluencer.jsp").forward(req, resp);
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("err", e.getMessage());
			req.getRequestDispatcher("err.jsp").forward(req, resp);
		}
	}

  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
  }
}
