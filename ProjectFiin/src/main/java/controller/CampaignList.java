package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.Campaign;
import service.CampaignService;
import service.CampaignServiceImpl;
import util.PageInfo;

/**
 * Servlet implementation class CampaignList
 */
@WebServlet("/campaignList")
public class CampaignList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CampaignList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String paramPage = request.getParameter("page");
		Integer page = 1;
		if(paramPage != null) {
			page = Integer.parseInt(paramPage);
		}
		try {
			CampaignService service = new CampaignServiceImpl();
			PageInfo pageInfo = new PageInfo();
			pageInfo.setCurPage(page);
			List<Campaign> campaignList = service.campaignList(pageInfo);
			System.out.println(campaignList);
			System.out.println(pageInfo);
			request.setAttribute("campaignList", campaignList);
			request.setAttribute("pageInfo", pageInfo);
			request.getRequestDispatcher("campaign/campaign_list.jsp").forward(request, response);
		}catch(Exception e) {
			e.printStackTrace();
			request.setAttribute("err", e.getMessage());
			request.getRequestDispatcher("err.jsp").forward(request, response);
		}

		
		
	}

}
