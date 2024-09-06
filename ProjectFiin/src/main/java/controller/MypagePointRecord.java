package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.PointRecord;
import service.PointService;
import service.PointServiceImpl;
import util.PageInfo;

/**
 * Servlet implementation class PointRecord
 */
@WebServlet("/mypage/pointrecord")
public class MypagePointRecord extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MypagePointRecord() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String paramPage = request.getParameter("page");
		Integer page = 1;
		if (paramPage!=null) {
			page = Integer.parseInt(paramPage);
		}
		
		try {
			PointService service = new PointServiceImpl();
			PageInfo pageInfo = new PageInfo();
			pageInfo.setCurPage(page);
			List<PointRecord> pointRecordList = service.showPointRecord("influencer", 1, pageInfo);
			request.setAttribute("pointRecordList", pointRecordList);
			request.setAttribute("pageInfo", pageInfo);
			request.getRequestDispatcher("/mypage/mypage_point_record.jsp").forward(request, response);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
