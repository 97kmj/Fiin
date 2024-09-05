package controller;

import dto.Point;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import dto.Point;
import service.PointService;
import service.PointServiceImpl;

/**
 * Servlet implementation class Payment
 */
@WebServlet("/payment")
public class Payment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Payment() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			PointService service = new PointServiceImpl();
			List<Point> pointList = service.pointList();
			System.out.println(pointList.toString());
			request.setAttribute("pointList", pointList);
			request.getRequestDispatcher("/point/payment.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("err", e.getMessage());
			request.getRequestDispatcher("err.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String data = request.getParameter("data");
		try {
			PointService service = new PointServiceImpl();
			JSONParser parser = new JSONParser();
			JSONObject jsonObj = (JSONObject)parser.parse(data);
			String type = (String)jsonObj.get("type");
			Integer changePoint = Integer.parseInt((String)jsonObj.get("changePoint"));
			Long num = (Long)jsonObj.get("num");
			Integer userNum = (int)(long)num;
			service.insertPointRecord(type, userNum, changePoint); 
			service.updatePointBalance(type, userNum,changePoint);
			response.setCharacterEncoding("utf-8");
			response.getWriter().write("결제 성공");
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("err", e.getMessage());
			request.getRequestDispatcher("err.jsp").forward(request, response); 
		}
	}

}
