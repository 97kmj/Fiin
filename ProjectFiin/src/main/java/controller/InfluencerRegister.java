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
    req.getRequestDispatcher("/influencer/influencerRegister.jsp").forward(req, resp);
//    System.out.println("InfluencerRegister doGet");
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
    Integer youtubeFollower = Integer.parseInt(request.getParameter("youtubeFollower"));
    String youtubeUrl = request.getParameter("youtubeUrl");

    String instagramName = request.getParameter("instagramName");
    Integer instagramFollower = Integer.parseInt(request.getParameter("instagramFollower"));
    String instagramUrl = request.getParameter("instagramUrl");

    String blogName = request.getParameter("blogName");
    Integer blogFollower = Integer.parseInt(request.getParameter("blogFollower"));
    String blogUrl = request.getParameter("blogUrl");

    //파라미터로 가져오는 category는 array형식(복수형)
    Integer categoryId = Integer.parseInt(request.getParameter("category"));

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
      request.getRequestDispatcher("/influencer/influencerRegister.jsp").forward(request, response);
      ////////////////////////
    } catch (Exception e) {
      e.printStackTrace();
      request.setAttribute("err", e.getMessage());
      request.getRequestDispatcher("err.jsp").forward(request, response);
    }
  }
}
