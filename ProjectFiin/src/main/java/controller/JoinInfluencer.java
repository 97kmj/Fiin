package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.Influencer;
import service.InfluencerService;
import service.InfluencerServiceImpl;

/**
 * Servlet implementation class JoinInfluencer
 */
@WebServlet("/joinInfluencer")
public class JoinInfluencer extends HttpServlet {

  private static final long serialVersionUID = 1L;

  /**
   * @see HttpServlet#HttpServlet()
   */
  public JoinInfluencer() {
    super();
    // TODO Auto-generated constructor stub
  }

  /**
   * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
   */
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    request.getRequestDispatcher("/join/join_influencer.jsp").forward(request, response);
  }

  /**
   * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
   */
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	 request.setCharacterEncoding("utf-8");
	 Influencer influencer = new Influencer();
	 influencer.setUserEmail(request.getParameter("userEmail"));
	 influencer.setPassword(request.getParameter("password"));
	 influencer.setName(request.getParameter("name"));
	 influencer.setNickname(request.getParameter("nickname"));
	 influencer.setMobileNumber(request.getParameter("mobileNumber"));
	 String address = request.getParameter("address") + " " + request.getParameter("addressDetail");
	 influencer.setAddress(address);

	 try {
		 InfluencerService service = new InfluencerServiceImpl();
		 service.join(influencer);
		 response.sendRedirect("login");
	 } catch (Exception e) {
		 e.printStackTrace();
		 request.setAttribute("err", e.getMessage());
		 request.getRequestDispatcher("err.jsp").forward(request, response);
	 }
  }
}
