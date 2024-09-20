package controller;

// 7.0.1 캠페인 등록

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import dto.Advertiser;
import dto.Campaign;
import java.io.IOException;
import java.sql.Time;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalDateTime;
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
    String realFolder = request.getServletContext().getRealPath("upload");
    //업로드
    MultipartRequest multi = new MultipartRequest(request, realFolder, 5 * 1024 * 1024, "UTF-8",
        new DefaultFileRenamePolicy());

    try {
      Advertiser advertiser = (Advertiser) request.getSession().getAttribute("advertiser");
      if (advertiser == null) {
        throw new Exception("로그인 처리 필요");
      }

      //캠페인 인스턴스 객체 만들고, 거기다가 form에서 가져온 값들 넣어서, service에 전달하기
      Campaign campaign = new Campaign();

      // !! 업로드 기간 가져오기
      String uploadPeriodValue = multi.getParameter("uploadPeriod");

      int uploadPeriod = Integer.parseInt(uploadPeriodValue);
      System.out.println("uploadPeriodValue = " + uploadPeriodValue );
      System.out.println("uploadPeriod = " + uploadPeriod );

      // 현재 날짜를 업로드 시작 날짜로 설정
      LocalDate updateStartDateLocalDate = LocalDate.now();

      // 업로드 종료 날짜는 시작일에 uploadPeriod를 더한 날짜
      LocalDate updateEndDateLocalDate = updateStartDateLocalDate.plusDays(uploadPeriod);

      Timestamp updateStartDate = Timestamp.valueOf(updateStartDateLocalDate.atStartOfDay());
      Timestamp updateEndDate = Timestamp.valueOf(updateEndDateLocalDate.atStartOfDay());

      campaign.setUpdateStartDate(updateStartDate);
      campaign.setUpdateEndDate(updateEndDate);

      // 캠페인 객체에 날짜 설정 (업로드 시작, 종료 시간 설정)
      Integer advertiserNum = advertiser.getAdvertiserNum();
      campaign.setAdvertiserNum(advertiserNum);

      Integer category = Integer.parseInt(multi.getParameter("category"));
      campaign.setCategoryId(category);

      String[] channels = multi.getParameterValues("channel");
      String channel="";
      for(String ch : channels) {
        channel +=ch+"#";
      }
      campaign.setChannel(channel);

      String companyName = multi.getParameter("companyName");
      campaign.setCompanyName(companyName);
      String companyUrl = multi.getParameter("companyUrl");
      campaign.setCompanyUrl(companyUrl);
      String campaignTitle = multi.getParameter("campaignTitle");
      campaign.setCampaignTitle(campaignTitle);

      String productName = multi.getParameter("productName");
      campaign.setProductName(productName);

      String adstartDate = multi.getParameter("adStartDate");
      campaign.setAdStartDate(Timestamp.valueOf(adstartDate));

      String adendDate = multi.getParameter("adEndDate");
      campaign.setAdEndDate(Timestamp.valueOf(adendDate));


      String requirement = multi.getParameter("requirement");
      campaign.setRequirement(requirement);

      if(multi.getFile("image") != null && multi.getFile("image").exists()) {
        String image = multi.getOriginalFileName("image");
        campaign.setImage(image);
      }

      // 데이터 처리하기 : Model
      CampaignService service = new CampaignServiceImpl();

      // 캠페인 최초 등록 여부 체크 (포인트 차감)
        advertiser.setPointBalance(advertiser.getPointBalance() - 500);
        service.campaignRegister(campaign);

      System.out.println("campaign = " + campaign);

      response.sendRedirect("campaignList");

    } catch (Exception e) {
      e.printStackTrace();
      request.setAttribute("err", e.getMessage());
      request.getRequestDispatcher("err.jsp").forward(request, response);

    }
  }
}
