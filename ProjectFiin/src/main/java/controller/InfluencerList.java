package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import service.InfluencerService;
import service.InfluencerServiceImpl;
import util.PageInfo;

/**
 * Servlet implementation class InfluencerList
 */
@WebServlet("/influencerList")
public class InfluencerList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public InfluencerList() {
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

		String paramPage = request.getParameter("page");
		String[] channels = request.getParameterValues("channel");
		String keyword = request.getParameter("keyword");

		List<String> channelList = new ArrayList<>();

		
		if( channels != null) {
			for(String channel : channels) {
				channelList.add(channel);
			}
		}
		
		Integer category = 0;
		if (request.getParameter("category") != null) {
			category = Integer.parseInt(request.getParameter("category"));
		}
		System.out.println(request.getParameter("category"));
		
		Integer page = 1;
		if (paramPage != null) {
			page = Integer.parseInt(paramPage);
		}
		System.out.println(page);
		if (keyword != null) {
			category = 0;
			channels = null;
		}
		System.out.println(keyword);
		try {
			InfluencerService service = new InfluencerServiceImpl();
			PageInfo pageInfo = new PageInfo();
			pageInfo.setCurPage(page);
			
			List<Map<String, Object>> influencerList;


			influencerList = service.getInfluencerList(channelList, keyword, category, pageInfo);

			
			request.setAttribute("influencerList", influencerList);
			request.setAttribute("pageInfo", pageInfo);
			request.setAttribute("category", category);
			request.setAttribute("channels", channelList);

			request.getRequestDispatcher("influencer/influencer_list.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("err", e.getMessage());
			request.getRequestDispatcher("err.jsp").forward(request, response);
		}
	}

}
