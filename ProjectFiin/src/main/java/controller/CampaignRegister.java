package controller;

// 7.0.1 캠페인 등록

import dto.Campaign;
import java.io.IOException;
import java.sql.Timestamp;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import service.CampaignService;
import service.CampaignServiceImpl;

@WebServlet("/campaignRegister")
public class CampaignRegister extends HttpServlet {


  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp)
      throws ServletException, IOException {
    super.doGet(req, resp);
  }

  //인플루언서 등록
  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    //1. 요청으로부터 데이터 가져오기
    request.setCharacterEncoding("UTF-8");

    String channel = request.getParameter("channel");
    String companyName = request.getParameter("companyName");
    String companyUrl = request.getParameter("companyUrl");
    String campaignTitle = request.getParameter("campaignTitle");
    String productName = request.getParameter("productName");
    Timestamp updateStartDate = Timestamp.valueOf(request.getParameter("updateStartDate"));
    Timestamp updateEndDate = Timestamp.valueOf(request.getParameter("updateEndDate"));
    Timestamp adStartDate = Timestamp.valueOf(request.getParameter("adStartDate"));
    Timestamp adEndDate = Timestamp.valueOf(request.getParameter("adEndDate"));
    Integer categoryId = Integer.parseInt(request.getParameter("categoryId"));

// Campaign 객체 생성
    Campaign cam = new Campaign(channel, companyName, companyUrl, campaignTitle, productName,
        updateStartDate, updateEndDate, adStartDate, adEndDate, categoryId);

    try {
      // 데이터 처리하기 : Model
      CampaignService service = new CampaignServiceImpl();
      Campaign camp = service.register(cam);

      // 처리한 데이터 View에 전달
      request.setAttribute("camp", camp);
      request.getRequestDispatcher("/campaignRegister.jsp").forward(request, response);
    } catch (Exception e) {
      e.printStackTrace();
      request.setAttribute("err", e.getMessage());
      request.getRequestDispatcher("err.jsp").forward(request, response);

    }
  }
}
