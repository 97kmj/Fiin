package controller;

// 7.0.1 캠페인 등록

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import dto.Advertiser;
import dto.Campaign;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.Calendar;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import service.CampaignService;
import service.CampaignServiceImpl;

@WebServlet("/campaignRegister")
public class CampaignRegister extends HttpServlet {

  private static final long serialVersionUID = 1L;


  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp)
      throws ServletException, IOException {

    try {
      // 광고주 session에 광고주 정보 있으면, 로그인 된걸로 간주
      Advertiser advertiser = (Advertiser) req.getSession().getAttribute("advertiser");
      if (advertiser == null) {
        throw new Exception("로그인 처리 필요");
      }

      // campaign session 추가
      Campaign campaign = (Campaign) req.getSession().getAttribute("campaign");

      // advertiser_num을 가지고, 본인이 등록한 campaign 찾기
      CampaignService service = new CampaignServiceImpl();
      System.out.println(service.findCampaignByAdNum(advertiser.getAdvertiserNum()));

      // advertiser_num으로 찾은 campaign_num을 "campaign" 섹션에 추가
      //질문: "camapaign"이 섹션에 추가되어 있는지?
      req.setAttribute("campaign", service.findCampaignByAdNum(advertiser.getAdvertiserNum()));
      req.getRequestDispatcher("/campaign/campaign_register.jsp").forward(req, resp);
    } catch (Exception e) {
      e.printStackTrace();
      req.setAttribute("err", e.getMessage());
      req.getRequestDispatcher("err.jsp").forward(req, resp);
    }
  }

  //캠페인 등록
  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    //1. 요청으로부터 데이터 가져오기
    request.setCharacterEncoding("UTF-8");
    String realFolder = request.getServletContext().getRealPath("/upload");
    //업로드
    MultipartRequest multi = new MultipartRequest(request, realFolder, 5 * 1024 * 1024, "UTF-8",
        new DefaultFileRenamePolicy());

    try {
      Advertiser advertiser = (Advertiser) request.getSession().getAttribute("advertiser");
      if(advertiser == null) {
        throw new Exception("로그인 처리 필요");
      }

      Campaign campaign = new Campaign();

      // 업로드 기간 가져오기
      String uploadPeriod = multi.getParameter("uploadPeriod");


      Boolean showModal = (Boolean) request.getAttribute("showModal");
      if (showModal == null) showModal = false;


      // 현재 날짜 가져오기
      Calendar calendar = Calendar.getInstance();
      Timestamp updateStartDate = new Timestamp(calendar.getTimeInMillis());

      // 업로드 기간에 따라 날짜 계산
      int daysToAdd = 0;
      switch (uploadPeriod) {
        case "1주일":
          daysToAdd = 7;
          break;
        case "2주일":
          daysToAdd = 14;
          break;
        case "3주일":
          daysToAdd = 21;
          break;
        case "4주일":
          daysToAdd = 28;
          break;
        default:
          throw new Exception("유효하지 않은 업로드 기간입니다.");
      }

      // 날짜에 일수 추가
      calendar.add(Calendar.DAY_OF_MONTH, daysToAdd);

      // 계산된 날짜를 Timestamp로 변환
      Timestamp updateEndDate = new Timestamp(calendar.getTimeInMillis());

      // 캠페인 객체에 날짜 설정 (업로드 시작, 종료 시간 설정)
      campaign.setUpdateStartDate(updateStartDate);
      campaign.setUpdateEndDate(updateEndDate);


      Integer advertiserNum = advertiser.getAdvertiserNum();
      campaign.setAdvertiserNum(advertiserNum);

      String channel = multi.getParameter("channel");
      campaign.setChannel(channel);
      String companyName = multi.getParameter("companyName");
      campaign.setCompanyName(companyName);
      String companyUrl = multi.getParameter("companyUrl");
      campaign.setCompanyUrl(companyUrl);
      String campaignTitle = multi.getParameter("campaignTitle");
      campaign.setCampaignTitle(campaignTitle);

      String productName = multi.getParameter("productName");
      campaign.setProductName(productName);

//      Timestamp updateStartDate = Timestamp.valueOf(multi.getParameter("updateStartDate"));
//      campaign.setUpdateStartDate(updateStartDate);
//      Timestamp updateEndDate = Timestamp.valueOf(multi.getParameter("updateEndDate"));
//      campaign.setUpdateEndDate(updateEndDate);

      String adstartDateStr = multi.getParameter("startDate");
      String adendDateStr = multi.getParameter("endDate");

      if (adstartDateStr != null && !adstartDateStr.isEmpty()) {
        Timestamp adStartDate = Timestamp.valueOf(adstartDateStr);
        campaign.setAdStartDate(adStartDate);
      }

      if (adendDateStr != null && !adendDateStr.isEmpty()) {
        Timestamp adEndDate = Timestamp.valueOf(adendDateStr);
        campaign.setAdEndDate(adEndDate);
      }

      Integer category = Integer.parseInt(multi.getParameter("category"));
      campaign.setCategoryId(category);
      String requirement = multi.getParameter("requirement");
      campaign.setRequirement(requirement);
      String image = multi.getParameter("image");
      campaign.setImage(image);

      //해당 부분 필요할지 여부 생각해보기.
      response.setContentType("application/json");
      response.setCharacterEncoding("UTF-8");
      response.getWriter().write("{\"status\":\"success\", \"message\":\"캠페인이 등록되었습니다.\"}");

    // 데이터 처리하기 : Model
    CampaignService service = new CampaignServiceImpl();
    service.campaignRegister(campaign);


      // 처리한 데이터 View에 전달
      request.setAttribute("campaign", campaign);
      request.getRequestDispatcher("/campaignRegister.jsp").forward(request, response);
    } catch (Exception e) {
      e.printStackTrace();
      request.setAttribute("err", e.getMessage());
      request.getRequestDispatcher("err.jsp").forward(request, response);

    }
  }
}
