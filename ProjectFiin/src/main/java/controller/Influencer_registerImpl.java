package controller;


import dto.Influencer;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import service.InfluencerService;
import service.InfluencerServiceImpl;

@WebServlet("/influencer_register")
public class Influencer_registerImpl extends HttpServlet {

  private static final long serialVersionUID = 1L;

  public Influencer_registerImpl() {
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

    // String 파라미터
    String introLine = req.getParameter("intro_line");
    String profileImage = req.getParameter("profile_image");
    String youtubeName = req.getParameter("youtube_name");
    String youtubeUrl = req.getParameter("youtube_url");
    String instagramName = req.getParameter("instagram_name");
    String instagramUrl = req.getParameter("instagram_url");
    String blogName = req.getParameter("blog_name");
    String blogUrl = req.getParameter("blog_url");
    String introduction = req.getParameter("introduction");

    // int 파라미터
    int youtubeFollower;
    int instagramFollower;
    int blogFollower;
    int categoryId;

    try {
      youtubeFollower = Integer.parseInt(req.getParameter("youtube_follower"));
      instagramFollower = Integer.parseInt(req.getParameter("instagram_follower"));
      blogFollower = Integer.parseInt(req.getParameter("blog_follower"));
      categoryId = Integer.parseInt(req.getParameter("category_id"));
    } catch (NumberFormatException e) {
      // 예외 발생 시 처리
      e.printStackTrace();
      throw new ServletException("Invalid input");
    }

// DTO 객체 생성
    Influencer inf = new Influencer(introLine, profileImage, categoryId, introduction,
        youtubeName, youtubeFollower, youtubeUrl,
        instagramName, instagramFollower, instagramUrl,
        blogName, blogFollower, blogUrl);

    try {
      //2. 데이터 처리하기 : Model
      InfluencerService service = new InfluencerServiceImpl();
      Influencer inff = service.register(inf);

      //3. 처리한 데이터 view 지정하여 넘겨주기

      //프론트로 값 보내지 않아도 되면, 불필요
      req.setAttribute("influencer", inff);

      req.getRequestDispatcher("/influencer_register.jsp").forward(req, resp);


    } catch (Exception e) {
      e.printStackTrace();
      req.setAttribute("error", e.getMessage());

      req.getRequestDispatcher("err.jsp").forward(req, resp);
    }
  }
}

