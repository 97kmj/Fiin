package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

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
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		String paramPage = request.getParameter("page");
		String[] channels = request.getParameterValues("channel");
		Integer category = 0;
		if (request.getParameter("category") != null) {
			category = Integer.parseInt(request.getParameter("category"));
		}

		Integer page = 1;
		if (paramPage != null) {
			page = Integer.parseInt(paramPage);
		}
		
		
		try {
			CampaignService service = new CampaignServiceImpl();
			PageInfo pageInfo = new PageInfo();
			pageInfo.setCurPage(page);
			List<Campaign> campaignList;
			String[] nchannel = new String[1];
			if (channels==null) {
				nchannel[0] = "";
				campaignList = service.campaignList(nchannel[0], category, pageInfo);
			} else {
				campaignList = service.campaignList(channels[0], category, pageInfo);
			}
			
			request.setAttribute("campaignList", campaignList);
			request.setAttribute("pageInfo", pageInfo);
			request.setAttribute("category", category);
			request.setAttribute("channel", channels == null? Arrays.asList(nchannel):Arrays.asList(channels));
			request.getRequestDispatcher("campaign/campaign_list.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("err", e.getMessage());
			request.getRequestDispatcher("err.jsp").forward(request, response);
		}
	}
	/*
	 * } protected void doPost(HttpServletRequest request, HttpServletResponse
	 * response) throws ServletException, IOException {
	 * response.setCharacterEncoding("utf-8"); String param =
	 * request.getParameter("param"); System.out.println(param);
	 * 
	 * List<String> channels = new ArrayList<>(); String category = null; Long page
	 * = null;
	 * 
	 * try { JSONParser parser = new JSONParser(); JSONObject jsonObj =
	 * (JSONObject)parser.parse(param); JSONArray chennelArr =
	 * (JSONArray)jsonObj.get("channels");
	 * 
	 * for (int i= 0; i<chennelArr.size(); i++) {
	 * channels.add((String)chennelArr.get(i)); } category =
	 * (String)jsonObj.get("category"); page = (Long)jsonObj.get("page");
	 * 
	 * CampaignService service = new CampaignServiceImpl();
	 * 
	 * List<Campaign> CampaignList = service.campaignList(channels, category, page);
	 * }
	 * 
	 * }
	 */
}
