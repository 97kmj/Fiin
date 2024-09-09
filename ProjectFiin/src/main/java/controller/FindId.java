package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.AdvertiserService;
import service.AdvertiserServiceImpl;
import service.InfluencerService;
import service.InfluencerServiceImpl;

/**
 * Servlet implementation class FindId
 */
@WebServlet("/findId")
public class FindId extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindId() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/login/findid.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String name = request.getParameter("name");
		String mobileNumber = request.getParameter("mobileNumber");
		String type = request.getParameter("type");
		
		try {
			InfluencerService iService = new InfluencerServiceImpl();
			AdvertiserService aService = new AdvertiserServiceImpl();
			
			if (type.equals("influencer")) {
				String userEmail = iService.influencerEmail(name, mobileNumber);
				request.setAttribute("userEmail", userEmail);
				response.getWriter().write(userEmail);
			} else {
				
			}
		} catch (Exception e) {
			e.printStackTrace();
			response.getWriter().write(String.valueOf(false));
		}
	}
}
