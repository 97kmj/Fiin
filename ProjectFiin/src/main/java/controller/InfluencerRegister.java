package controller;

// 7.1.1 인플루언서 등록

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import dto.Influencer;
import java.io.IOException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
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

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    try {
      Influencer influencer = (Influencer) request.getSession().getAttribute("influencer");
      if (influencer == null) {
        throw new Exception("로그인 처리 필요");
      }

      request.getRequestDispatcher("/influencer/influencer_register.jsp").forward(request, response);

    } catch (Exception e) {
      e.printStackTrace();
      request.setAttribute("err", e.getMessage());
      request.getRequestDispatcher("err.jsp").forward(request, response);
    }
  }

  //인플루언서 등록
  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    request.setCharacterEncoding("UTF-8");
    String realFolder = request.getServletContext().getRealPath("/upload");

    //업로드
    MultipartRequest multi = new MultipartRequest(request, realFolder, 5 * 1024 * 1024, "UTF-8",
        new DefaultFileRenamePolicy());

    //Login Controller에서 로그인 된 influencer 정보 가져오기
    try {
      Influencer influencer = (Influencer) request.getSession().getAttribute("influencer");
      if (influencer == null) {
        throw new Exception("로그인 처리 필요");
      }

      String introLine = multi.getParameter("introLine");
      influencer.setIntroLine(introLine);

      if(multi.getFile("profileImage") != null && multi.getFile("profileImage").exists()) {
        String profileImage = multi.getOriginalFileName("profileImage");
        influencer.setProfileImage(profileImage);
      }

      String youtube = multi.getParameter("youtube");
      String instagram = multi.getParameter("instagram");
      String blog = multi.getParameter("blog");

      if (youtube != null) {
        influencer.setYoutube(1);
        String youtubeName = multi.getParameter("youtubeName");
        influencer.setYoutubeName(youtubeName);
        Integer youtubeFollower = Integer.parseInt(multi.getParameter("youtubeFollower"));
        String youtubeUrl = multi.getParameter("youtubeUrl");
        influencer.setYoutubeFollower(youtubeFollower);
        influencer.setYoutubeUrl(youtubeUrl);
      } else {
        influencer.setYoutube(0);
        influencer.setYoutubeName(null);
        influencer.setYoutubeFollower(0);
        influencer.setYoutubeUrl(null);
      }

      if (instagram != null) {
        influencer.setInstagram(1);
        String instagramName = multi.getParameter("instagramName");
        influencer.setInstagramName(instagramName);
        Integer instagramFollower = Integer.parseInt(multi.getParameter("instagramFollower"));
        influencer.setInstagramFollower(instagramFollower);
        String instagramUrl = multi.getParameter("instagramUrl");
        influencer.setInstagramUrl(instagramUrl);
      } else {
        influencer.setInstagram(0);
        influencer.setInstagramName(null);
        influencer.setInstagramFollower(0);
        influencer.setInstagramUrl(null);
      }

      if (blog != null) {
        influencer.setBlog(1);
        String blogName = multi.getParameter("blogName");
        influencer.setBlogName(blogName);
        Integer blogFollower = Integer.parseInt(multi.getParameter("blogFollower"));
        String blogUrl = multi.getParameter("blogUrl");
        influencer.setBlogFollower(blogFollower);
        influencer.setBlogUrl(blogUrl);
      } else {
        influencer.setBlog(0);
        influencer.setBlogName(null);
        influencer.setBlogFollower(0);
        influencer.setBlogUrl(null);
      }

      Integer category = Integer.parseInt(multi.getParameter("category"));
      String introduction = multi.getParameter("introduction");
      influencer.setCategoryId(category);
      influencer.setIntroduction(introduction);

      InfluencerService service = new InfluencerServiceImpl();

      // 인플루언서 최초 등록 여부 체크
      if (influencer.getIsRegist() == null || influencer.getIsRegist() == 0) {
        influencer.setIsRegist(1);
        influencer.setRegistDate(Timestamp.valueOf(LocalDateTime.now()));

        //influencer session에서만 차감됨.
        influencer.setPointBalance(influencer.getPointBalance() - 500);
      }

      //최초 등록시에만 포인트 차감하기
      service.influencerRegister(influencer);

      // 업데이트된 influencer 객체를 세션에 다시 저장
      request.getSession().setAttribute("influencer", influencer);

      response.sendRedirect("influencerList");

    } catch (Exception e) {
      e.printStackTrace();
      request.setAttribute("err", e.getMessage());
      request.getRequestDispatcher("err.jsp").forward(request, response);
    }
  }
}
