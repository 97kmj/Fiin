package controller;


import java.io.IOException;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/campaign_register")
public class campaign_registerImpl extends HttpServlet {

  private static final long serialVersionUID = 1L;

  public campaign_registerImpl() {
  }

  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp)
      throws ServletException, IOException {
  }

  @Override
  protected void doPost(HttpServletRequest req, HttpServletResponse resp)
      throws ServletException, IOException {
    //1. 요청으로부터 데이터 가져오기
    req.setCharacterEncoding("UTF-8");

    //현재 날짜
    Date currentDate = new Date();
    System.out.println(currentDate);

    // String 파라미터
    String channel = req.getParameter("channel");
    String image = req.getParameter("image");

    String companyName = req.getParameter("companyName");
    String companyUrl = req.getParameter("companyUrl");
    String campaignTitle = req.getParameter("campaignTitle");
    String productName = req.getParameter("productName");
    String requirement = req.getParameter("requirement");

//    Date uploadPeriod = req.getParameter("uploadPeriod");
//    Date startDate = req.getParameter("startDate");
//    Date endDate = req.getParameter("endDate");

    //string으로 받고, int로 변형 필요
    int category_id;
    try {
      category_id = Integer.parseInt(req.getParameter("category_id"));
    } catch (NumberFormatException e) {
      e.printStackTrace();
      throw new ServletException("Invalid category_id");
    }

// Dto 객체 생성
//    Campaign cam = new Campaign(channel, image, category_id, requirement, companyName, companyUrl,
//        campaignTitle, productName
//    );

    //2. 데이터 처리하기 : Model
//    try {
//      CampaignService service = new CampaignServiceImpl();
//      Campaign camp = service.register(cam);
//
//      //3. 처리한 데이터 view 지정하여 넘겨주기
//
//      //프론트로 값 보내지 않아도 되면, 불필요
//      req.setAttribute("campaign", camp);
//
//      req.getRequestDispatcher("/campaign_register.jsp").forward(req, resp);
//
//
//    } catch (Exception e) {
//      e.printStackTrace();
//      req.setAttribute("error", e.getMessage());
//
//      req.getRequestDispatcher("err.jsp").forward(req, resp);
//    }
  }
}
