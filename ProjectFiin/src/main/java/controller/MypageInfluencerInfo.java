package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.Influencer;
import service.InfluencerService;
import service.InfluencerServiceImpl;

/**
 * Servlet implementation class MypageInfluencerInfo
 */
@WebServlet("/mypageInfluencerInfo")
public class MypageInfluencerInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MypageInfluencerInfo() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 로그인 여부 확인
		Influencer influencer = (Influencer)request.getSession().getAttribute("influencer");
		if (influencer == null) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('로그인이 필요한 페이지입니다'); location.href='login'; </script>"); 
			out.flush();
		} else {
			request.getRequestDispatcher("/mypage/mypage_influencer_info.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String nickname = request.getParameter("nickname");
		String mobileNumber = request.getParameter("mobileNumber");
		String address = request.getParameter("address");
		String addressDetail = request.getParameter("addressDetail");
		
		try {
			InfluencerService service = new InfluencerServiceImpl();
			Influencer influencer = (Influencer)request.getSession().getAttribute("influencer");
			influencer.setPassword(password);
			influencer.setName(name);
			influencer.setNickname(nickname);
			influencer.setMobileNumber(mobileNumber);
			influencer.setAddress(address);
			influencer.setAddressDetail(addressDetail);
			service.influencerModify(influencer);
			request.getSession().setAttribute("influencer", influencer);
			request.getRequestDispatcher("/mypage/mypage_influencer_info.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("err", e.getMessage());
			request.getRequestDispatcher("err.jsp").forward(request, response);
		}
	}

}
