package controller;

import dto.Advertiser;
import dto.Campaign;
import dto.Influencer;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import service.CampaignService;
import service.CampaignServiceImpl;
import service.RequestCampaignService;
import service.RequestCampaignServiceImpl;

@WebServlet("/requestedInfluencer")
public class mypageRequestedInfluencer extends HttpServlet {

  private static final long serialVersionUID = 1L;


  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp)
      throws ServletException, IOException {

    req.setCharacterEncoding("utf-8");


    try {
      // 광고주 session에 광고주 정보 있으면, 로그인 된걸로 간주
      Advertiser advertiser = (Advertiser) req.getSession().getAttribute("advertiser");
      if (advertiser == null) {
        throw new Exception("로그인 처리 필요");
      }

      //1.캠페인과 매칭되는 인플루언서 찾아야 함
      // 등록된 캠페인 정보 가져오기
    CampaignService campService = new CampaignServiceImpl();
      Campaign campaign = (Campaign) req.getSession().getAttribute("campaign");
      Integer campaignNum = campaign.getCampaignNum();

      Influencer influencer = (Influencer) req.getSession().getAttribute("influencer");
      Integer influencerNum = influencer.getInfluencerNum();

      RequestCampaignService service = new RequestCampaignServiceImpl();
      service.requestCampaign(campaignNum, influencerNum);

      req.setAttribute("receiveCampaign",service.requestCampaign(influencerNum, campaignNum));
      req.getRequestDispatcher("/mypage/mypage_advertiser_requestedInfluencer.jsp").forward(req, resp);
    } catch (Exception e) {
      e.printStackTrace();
      req.setAttribute("err", e.getMessage());
      req.getRequestDispatcher("err.jsp").forward(req, resp);
    }
  }

  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
  }
}
