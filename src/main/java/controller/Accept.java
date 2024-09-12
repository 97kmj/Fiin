package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.ReceiveCampaignService;
import service.ReceiveCampaignServiceImpl;

/**
 * Servlet implementation class Accept
 */
@WebServlet("/accept")
public class Accept extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Accept() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		Integer applyNum =Integer.parseInt(request.getParameter("applyNum"));
		
		try {
			ReceiveCampaignService rservice = new ReceiveCampaignServiceImpl();
			rservice.acceptInfluencer(applyNum);
			response.setCharacterEncoding("utf-8");
			response.getWriter().write("업데이트 성공");
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("err", e.getMessage());
			request.getRequestDispatcher("err.jsp").forward(request, response);
		}
		
	}

}
