package controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.ReceiveCampaignService;
import service.ReceiveCampaignServiceImpl;

/**
 * Servlet implementation class ReceiveList
 */
@WebServlet("/receiveList")
public class ReceiveList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReceiveList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		Integer campaignNum = Integer.parseInt(request.getParameter("campaignNum"));
		
		try {
			ReceiveCampaignService service = new ReceiveCampaignServiceImpl();
			List<Map<String,Object>> receiveList = service.getReceiveList(campaignNum);
			request.setAttribute("receiveList", receiveList);
			String result ="";
			for(Map<String,Object> receive : receiveList) {
				String row = "<tr>";
				if(receive.get("profile_image")==null) {
					row += "<td OnClick=\"location.href ='influencerDetail?num=" +receive.get("influencer_num")+"'\"><div class=\"imgbox\"><img src=\"https://img.icons8.com/?size=100&id=43942&format=png&color=ffffff\" ></div> "+receive.get("nickname")+"</td>";
				} else {
					row += "<td OnClick=\"location.href ='influencerDetail?num=" +receive.get("influencer_num")+"'\"><div class=\"imgbox\"><img src=\"image?file="+receive.get("profile_image")+"\" ></div> "+receive.get("nickname")+"</td>";
				}
				row += "<td>"+receive.get("category_name")+"</td>";
				row+="<td>";
				
				if(receive.get("youtube")!=null && (boolean)receive.get("youtube")==true) {
					row += " <img src=\"https://img.icons8.com/?size=40&id=19318&format=png&color=000000\" onClick=\"window.open('"+receive.get("youtube_url")+"')\"/> ";
				}
				if(receive.get("instagram")!=null && (boolean)receive.get("instagram")==true) {
					row += " <img src=\"https://img.icons8.com/?size=40&id=Xy10Jcu1L2Su&format=png&color=000000\" onClick=\"window.open('"+receive.get("instagram_url")+"')\"/> ";
				}
				if(receive.get("blog")!=null && (boolean)receive.get("blog")==true) {
					row += " <img src=\"image/naver.png\"\r\n"
							+ "				 * style=\"width: 40px; height: 40px;\" onClick=\"window.open('"+receive.get("blog_url")+"')\"/> ";
				}
				row+="</td>";
				System.out.println(receive);
				if((boolean)receive.get("accept") ==false) {
					 row+="<td><button name=\"accept\" class=\"accept\" value=\"" + receive.get("apply_num")+"\">수락하기</button></td>";
				} else {
					 row+="<td><button name=\"checked\" class=\"checked\" value=\"" + receive.get("apply_num")+"\">수락완료</button></td>";
				}

				result+=row;
			}
			
			response.setCharacterEncoding("utf-8");
			response.getWriter().write(result);
		} catch (Exception e) {
			e.printStackTrace();
			
		}
	}

}
