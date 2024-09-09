package controller;

// 7.1.1 인플루언서 등록

import dto.Influencer;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import service.InfluencerService;
import service.InfluencerServiceImpl;

@WebServlet("/influencerRegister")
public class InfluencerRegister extends HttpServlet {

  private static final long serialVersionUID = 1L;

  public InfluencerRegister() {
    super();
  }

  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp)
      throws ServletException, IOException {

    req.getRequestDispatcher("/influencer/influencer_register.jsp").forward(req, resp);
  }

  //인플루언서 등록
  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    // *중요*
    //로그인 할 때, influencer_num과 나의 influencer_num을 비교해야 되는데,
    //질문: 로그인 할 때의 influencer_num을 어디서 받을 수 있을지?
    //request에서 influencer_num(나의 인플루언서 번호)을 찾은 후,
    //해당 데이터에다가 아래의 인플루언서 등록 정보들을 추가해줘야 함(insert아니라 update로 진행 필요)




    //1. 요청으로부터 데이터 가져오기
    request.setCharacterEncoding("UTF-8");

    Integer influencer_num = Integer.parseInt(request.getParameter("influencer_num"));

//    // 1. 유효한 멤버인지 검사
//    this.memberRepository.findByMemberId(customUserDetails.getMemberId())
//        .orElseThrow(() -> new CustomException(ErrorMessage.MEMBER_NOT_FOUND));




    String introLine = request.getParameter("introLine");
    String profileImage = request.getParameter("profileImage");

    String youtubeName = request.getParameter("youtubeName");
//    Integer youtubeFollower = Integer.parseInt(request.getParameter("youtubeFollower"));

    Integer youtubeFollower = null;
    String youtubeFollowerStr = request.getParameter("youtubeFollower");

    try {
      if (youtubeFollowerStr != null && !youtubeFollowerStr.isEmpty()) {
        youtubeFollower = Integer.parseInt((youtubeFollowerStr));
      }
    } catch (NumberFormatException e) {
      e.printStackTrace();
      System.out.println("youtubeFollower는 숫자여야 합니다.");
    }

    String youtubeUrl = request.getParameter("youtubeUrl");

    String instagramName = request.getParameter("instagramName");

    Integer instagramFollower = null;
    String instagramFollowerStr = request.getParameter("instagramFollower");

    try {
      if (instagramFollowerStr != null && !instagramFollowerStr.isEmpty()) {
        instagramFollower = Integer.parseInt((instagramFollowerStr));
      }
    } catch (NumberFormatException e) {
      e.printStackTrace();
      System.out.println("instagramFollower는 빈값이 되면 안됩니다.");
    }
    String instagramUrl = request.getParameter("instagramUrl");

    String blogName = request.getParameter("blogName");
//    Integer blogFollower = Integer.parseInt(request.getParameter("blogFollower"));

    Integer blogFollower = null;
    String blogFollowerStr = request.getParameter("blogFollower");
    try {
      if (blogFollowerStr != null && !blogFollowerStr.isEmpty()) {
        blogFollower = Integer.parseInt((blogFollowerStr));
      }
    } catch (Exception e) {
      e.printStackTrace();
      System.out.println("blogFollower는 빈값이 되면 안됩니다.");
    }
    String blogUrl = request.getParameter("blogUrl");

    Integer categoryId = null;
    String categoryIdStr = request.getParameter("category");

    if (categoryIdStr != null && !categoryIdStr.isEmpty()) {
      System.out.println("categoryIdStr = " + categoryIdStr);
      categoryId = Integer.parseInt(categoryIdStr);
      System.out.println("categoryId = " + categoryId);
    } else {
      System.out.println("No Category selected");
    }

    String introduction = request.getParameter("introduction");

    // Influencer 객체 생성
    Influencer inf = new Influencer(introLine, profileImage, youtubeName, youtubeFollower,
        youtubeUrl, instagramName, instagramFollower, instagramUrl,
        blogName, blogFollower, blogUrl, categoryId, introduction);

    try {
      //2. 데이터 처리하기 : Model
      //여기 부분에서 influencer_num을 찾아서 넘겨야 될듯
      InfluencerService service = new InfluencerServiceImpl();
      Influencer inff = service.influencerRegister(inf);

      //3. 처리한 데이터 View 지정하여 넘겨주기
      request.setAttribute("influencer", inff);
      request.getRequestDispatcher("/influencer/influencer_register.jsp")
          .forward(request, response);
    } catch (Exception e) {
      e.printStackTrace();
      request.setAttribute("err", e.getMessage());
      request.getRequestDispatcher("err.jsp").forward(request, response);
    }
  }
}
