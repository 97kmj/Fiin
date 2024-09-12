package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.Advertiser;
import dto.Influencer;
import service.AdvertiserService;
import service.AdvertiserServiceImpl;
import service.InfluencerService;
import service.InfluencerServiceImpl;

/**
 * Servlet implementation class Login
 */
@WebServlet("/login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/login/login.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String userEmail = request.getParameter("userEmail");
		String password = request.getParameter("password");
		String type = request.getParameter("type");
		
		try {
			InfluencerService iService = new InfluencerServiceImpl();
			AdvertiserService aService = new AdvertiserServiceImpl();
			
			if (type.equals("influencer")) {
				Influencer influencer =  iService.login(userEmail, password);
				request.getSession().setAttribute("influencer", influencer);
				request.getSession().setAttribute("type", type);
				response.sendRedirect("main");
			} else if(type.equals("advertiser")) {
				Advertiser advertiser = aService.login(userEmail, password);
				request.getSession().setAttribute("type", type);
				request.getSession().setAttribute("advertiser", advertiser);
				response.sendRedirect("main");		
			} 
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("err", e.getMessage());
			response.getWriter().write(String.valueOf(false));
		}
	}

}
