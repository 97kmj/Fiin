package controller;

import java.io.IOException;
import java.io.PrintWriter;

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
 * Servlet implementation class JoinInfluencer
 */
@WebServlet("/join")
public class Join extends HttpServlet {

  private static final long serialVersionUID = 1L;

  /**
   * @see HttpServlet#HttpServlet()
   */
  public Join() {
    super();
    // TODO Auto-generated constructor stub
  }

  /**
   * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
   */
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    request.getSession().setAttribute("type", request.getParameter("type"));
    request.getRequestDispatcher("/join/join.jsp").forward(request, response);
  } 

  /**
   * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
   */
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	 request.setCharacterEncoding("utf-8");
	 String type = (String)request.getSession().getAttribute("type");
	 
	 if (type.equals("influencer")) {
		 Influencer influencer = new Influencer();
		 influencer.setUserEmail(request.getParameter("userEmail"));
		 influencer.setPassword(request.getParameter("password"));
		 influencer.setName(request.getParameter("name"));
		 influencer.setNickname(request.getParameter("nickname"));
		 influencer.setMobileNumber(request.getParameter("mobileNumber"));
		 influencer.setAddress(request.getParameter("address"));
		 influencer.setAddressDetail(request.getParameter("addressDetail"));
		 
		 try {
			 InfluencerService service = new InfluencerServiceImpl();
			 service.join(influencer);
			 response.setContentType("text/html; charset=UTF-8");
			 PrintWriter out = response.getWriter();
			 out.println("<script>alert('인플루언서 회원가입에 성공하였습니다. 인플루언서로 로그인해주세요.'); location.href='login'; </script>"); 
			 out.flush();
		 } catch (Exception e) {
			 e.printStackTrace();
			 request.setAttribute("err", e.getMessage());
			 request.getRequestDispatcher("err.jsp").forward(request, response);
		 }
	 } else {
		 Advertiser advertiser = new Advertiser();
		 advertiser.setUserEmail(request.getParameter("userEmail"));
		 advertiser.setPassword(request.getParameter("password"));
		 advertiser.setName(request.getParameter("name"));
		 advertiser.setCompanyName(request.getParameter("companyName"));
		 advertiser.setMobileNumber(request.getParameter("mobileNumber"));
		 advertiser.setAddress(request.getParameter("address"));
		 advertiser.setAddressDetail(request.getParameter("addressDetail"));
		 
		 try {
			 AdvertiserService service = new AdvertiserServiceImpl();
			 service.join(advertiser);
			 response.setContentType("text/html; charset=UTF-8");
			 PrintWriter out = response.getWriter();
			 out.println("<script>alert('광고주 회원가입에 성공하였습니다. 광고주로 로그인해주세요.'); location.href='login'; </script>"); 
			 out.flush();
		 } catch (Exception e) {
			 e.printStackTrace();
			 request.setAttribute("err", e.getMessage());
			 request.getRequestDispatcher("err.jsp").forward(request, response);
		 }
	 }
  }
}
