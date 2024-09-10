package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import dto.Campaign;
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
		String[] channelsArray = request.getParameterValues("channel");
		List<String> channels = channelsArray != null? Arrays.asList(channelsArray): new ArrayList<>();
		
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
			campaignList = service.campaignList(channels, category, pageInfo);
			request.setAttribute("campaignList", campaignList);
			request.setAttribute("pageInfo", pageInfo);
			request.setAttribute("category", category);
			request.setAttribute("channel", channels);
			request.getRequestDispatcher("campaign/campaign_list.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("err", e.getMessage());
			request.getRequestDispatcher("err.jsp").forward(request, response);
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		 * response.setCharacterEncoding("utf-8"); String param =
		 * request.getParameter("param"); System.out.println(param);
		 * 
		 * List<String> channels = new ArrayList<>(); Integer category = null; Long page
		 * = null;
		 * 
		 * try { JSONParser parser = new JSONParser(); JSONObject jsonObj =
		 * (JSONObject)parser.parse(param); JSONArray channelArr =
		 * (JSONArray)jsonObj.get("channels");
		 * 
		 * for (int i=0; i<channelArr.size();i++) {
		 * channels.add((String)channelArr.get(i)); } category =
		 * (Integer)jsonObj.get("category"); page = (Long)jsonObj.get("page");
		 * 
		 * CampaignService service = new CampaignServiceImpl();
		 * 
		 * List<Campaign> cam = service.getCampaignList(channels, category,
		 * page.intValue()); Integer maxPage = service.getCampaignMaxPage(channels,
		 * category);
		 * 
		 * JSONObject resJson = new JSONObject(); resJson.put("page", page);
		 * resJson.put("maxPage", maxPage); JSONArray jsonCams = new JSONArray();
		 * for(Campaign campaign : cam) { JSONObject jsonCam = new JSONObject();
		 * jsonCam.put("campaignNum", campaign.getCampaignNum());
		 * jsonCam.put("campaignTitle", campaign.getCampaignTitle());
		 * jsonCams.add(jsonCams); } resJson.put("cam", jsonCams);
		 * response.getWriter().write(resJson.toJSONString());
		 * 
		 * 
		 * }catch(Exception e) { e.printStackTrace(); request.setAttribute("err",
		 * e.getMessage()); request.getRequestDispatcher("err.jsp").forward(request,
		 * response); }
		 */
		
	}	
}
