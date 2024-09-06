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
 * Servlet implementation class JoinAdvertiser
 */
@WebServlet("/joinAdvertiser")
public class JoinAdvertiser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JoinAdvertiser() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/join/join_advertiser.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 request.setCharacterEncoding("utf-8");
		 Advertiser advertiser = new Advertiser();
		 advertiser.setUserEmail(request.getParameter("userEmail"));
		 advertiser.setPassword(request.getParameter("password"));
		 advertiser.setName(request.getParameter("name"));
		 advertiser.setCompanyName(request.getParameter("companyName"));
		 advertiser.setMobileNumber(request.getParameter("mobileNumber"));
		 String address = request.getParameter("address") + " " + request.getParameter("addressDetail");
		 advertiser.setAddress(address);
		 System.out.println(advertiser);
		 try {
			 AdvertiserService service = new AdvertiserServiceImpl();
			 service.join(advertiser);
			 response.sendRedirect("login");
		 } catch (Exception e) {
			 e.printStackTrace();
			 request.setAttribute("err", e.getMessage());
			 request.getRequestDispatcher("err.jsp").forward(request, response);
		 }
	}

}
