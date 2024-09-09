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
 * Servlet implementation class FindPassword
 */
@WebServlet("/findPassword")
public class FindPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindPassword() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/login/findpassword.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String userEmail = request.getParameter("userEmail");
		String type = request.getParameter("type");
		
		try {
			InfluencerService iService = new InfluencerServiceImpl();
			AdvertiserService aService = new AdvertiserServiceImpl();
			
			if (type.equals("influencer")) {
				String password = iService.influencerFindPassword(userEmail);
				response.getWriter().write(password);
				System.out.println(password);
			} else {
				//String userEmail = aService.advertiserEmail(name, mobileNumber);
				//response.getWriter().write(userEmail);
			}
		} catch (Exception e) {
			e.printStackTrace();
			response.getWriter().write(String.valueOf(false));
		}
	}
}
