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
    //1. 요청으로부터 데이터 가져오기
    request.setCharacterEncoding("UTF-8");

    String introLine = request.getParameter("introLine");
    String profileImage = request.getParameter("profileImage");

    String youtubeName = request.getParameter("youtubeName");
//    Integer youtubeFollower = Integer.parseInt(request.getParameter("youtubeFollower"));

    String youtubeFollowerStr = request.getParameter("youtubeFollower");
    int youtubeFollower = 0;

    if (youtubeFollowerStr != null && !youtubeFollowerStr.isEmpty()) {
      try {
        youtubeFollower = Integer.parseInt((youtubeFollowerStr));
      } catch (NumberFormatException e) {
        e.printStackTrace();
        System.out.println("youtubeFollower는 숫자여야 합니다.");
      }
    } else {
      System.out.println("youtubeFollower값이 비어있습니다.");
    }

    String youtubeUrl = request.getParameter("youtubeUrl");

    String instagramName = request.getParameter("instagramName");
    String instagramFollowerStr = request.getParameter("instagramFollower");
    int instagramFollower = 0;
    try {
      if (!instagramFollowerStr.isEmpty()) {
        instagramFollower = Integer.parseInt((instagramFollowerStr));
      }
    } catch (Exception e) {
      e.printStackTrace();
      System.out.println("instagramFollower는 빈값이 되면 안됩니다.");
    }
    String instagramUrl = request.getParameter("instagramUrl");

    String blogName = request.getParameter("blogName");
//    Integer blogFollower = Integer.parseInt(request.getParameter("blogFollower"));

    String blogFollowerStr = request.getParameter("blogFollower");
    int blogFollower = 0;
    try {
      if (!blogFollowerStr.isEmpty()) {
        blogFollower = Integer.parseInt((blogFollowerStr));
      }
    } catch (Exception e) {
      e.printStackTrace();
      System.out.println("blogFollower는 빈값이 되면 안됩니다.");
    }

    String blogUrl = request.getParameter("blogUrl");

    //파라미터로 가져오는 category는 array형식(복수형)
//    Integer categoryId = Integer.parseInt(request.getParameter("category"));

    String categoryIdStr = request.getParameter("category");
    if (categoryIdStr != null && !categoryIdStr.isEmpty()) {
      System.out.println("CategoryId = " + categoryIdStr);
    } else {
      System.out.println("No Category selected");
    }

    //여기 에러나옴 -> 주말에 이어서 해결하기
    Integer categoryId = Integer.parseInt(categoryIdStr);

    String introduction = request.getParameter("introduction");

    // Influencer 객체 생성
    Influencer inf = new Influencer(introLine, profileImage, youtubeName, youtubeFollower,
        youtubeUrl, instagramName, instagramFollower, instagramUrl,
        blogName, blogFollower, blogUrl, categoryId, introduction);

    try {
      //2. 데이터 처리하기 : Model
      InfluencerService service = new InfluencerServiceImpl();
      Influencer inff = service.influencerRegister(inf);

      //3. 처리한 데이터 View 지정하여 넘겨주기
      request.setAttribute("influencer", inff);
      request.getRequestDispatcher("/influencer/influencer_register.jsp")
          .forward(request, response);
      ////////////////////////
    } catch (Exception e) {
      e.printStackTrace();
      request.setAttribute("err", e.getMessage());
      request.getRequestDispatcher("err.jsp").forward(request, response);
    }
  }

}
