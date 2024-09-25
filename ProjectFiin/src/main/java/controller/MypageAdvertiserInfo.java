package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.Advertiser;
import service.AdvertiserService;
import service.AdvertiserServiceImpl;

/**
 * Servlet implementation class MypageAdvertiserInfo
 */
@WebServlet("/mypageAdvertiserInfo")
public class MypageAdvertiserInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MypageAdvertiserInfo() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 로그인 여부 확인
		Advertiser advertiser = (Advertiser)request.getSession().getAttribute("advertiser");
		if (advertiser == null) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('로그인이 필요한 페이지입니다'); location.href='login'; </script>"); 
			out.flush();
		} else {
			request.getRequestDispatcher("/mypage/mypage_advertiser_info.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String companyName = request.getParameter("companyName");
		String mobileNumber = request.getParameter("mobileNumber");
		String address = request.getParameter("address");
		String addressDetail = request.getParameter("addressDetail");
		
		try {
			AdvertiserService service = new AdvertiserServiceImpl();
			Advertiser advertiser = (Advertiser)request.getSession().getAttribute("advertiser");
			advertiser.setPassword(password);
			advertiser.setName(name);
			advertiser.setCompanyName(companyName);
			advertiser.setMobileNumber(mobileNumber);
			advertiser.setAddress(address);
			advertiser.setAddressDetail(addressDetail);
			service.advertiserModify(advertiser);
			request.getSession().setAttribute("advertiser", advertiser);
			request.getRequestDispatcher("/mypage/mypage_advertiser_info.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("err", e.getMessage());
			request.getRequestDispatcher("err.jsp").forward(request, response);	
		}
	}
}
