package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.InfluencerService;
import service.InfluencerServiceImpl;

/**
 * Servlet implementation class EmailCheck
 */
@WebServlet("/emailCheck")
public class EmailCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmailCheck() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String userEmail = request.getParameter("userEmail");
		
		try {
			InfluencerService service = new InfluencerServiceImpl();
			boolean doubleEmail = service.checkDoubleEmail(userEmail);
			response.getWriter().write(String.valueOf(doubleEmail));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
