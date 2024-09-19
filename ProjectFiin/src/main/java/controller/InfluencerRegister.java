package controller;

// 7.1.1 인플루언서 등록

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import dto.Influencer;
import java.io.IOException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.Optional;
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
      InfluencerService service = new InfluencerServiceImpl();

      request.setAttribute("influencer",
          service.findInfluencerByNum(influencer.getInfluencerNum()));
      request.getRequestDispatcher("/influencer/influencer_register.jsp")
          .forward(request, response);

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
      String profileImage = multi.getFilesystemName("profileImage");
      influencer.setProfileImage(profileImage);

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

      //포인트 Null인 경우 or 아닌 경우
      // Optional의 값이 존재하는 경우에만 처리
      Optional<String> pointOptional = Optional.ofNullable(multi.getParameter("point_balance"));
      pointOptional.ifPresentOrElse(
          point -> influencer.setPointBalance(Integer.parseInt(point)),
          () -> influencer.setPointBalance(0)); // null이거나 빈 문자열이면 0으로 설정
      System.out.println("pointBalance = " + pointOptional);
      System.out.println("influencer.getPointBlanace() = " + influencer.getPointBalance());


      Boolean showModal = (Boolean) request.getAttribute("showModal");
      if (showModal == null) showModal = false;

      //인플루언서의 regist_date가 없을 경우 "등록하기", 있을 경우 "수정하기"로 진행
      InfluencerService service = new InfluencerServiceImpl();


      // 인플루언서 최초 등록 여부 체크
      if (influencer.getIsRegist() == null) {
        influencer.setIsRegist(1);
        influencer.setRegistDate(Timestamp.valueOf(LocalDateTime.now()));

        // 포인트가 null이면 0으로 처리
        Integer pointBalance = influencer.getPointBalance() != null ? influencer.getPointBalance() : 0;

        if (pointBalance >= 500) {
          // 포인트가 500 이상일 경우 차감
          influencer.setPointBalance(pointBalance - 500);
          service.influencerRegister(influencer);

          // 성공 메시지와 상태 전송
          response.setContentType("application/json");
          response.setCharacterEncoding("UTF-8");
          response.getWriter().write("{\"status\":\"success\", \"message\":\"등록 완료\", \"remainingPoints\":" + influencer.getPointBalance() + "}");

        } else {
          // 포인트 부족 시 실패 메시지 전송
          response.setContentType("application/json");
          response.setCharacterEncoding("UTF-8");
          response.getWriter().write("{\"status\":\"error\", \"message\":\"포인트가 부족합니다.\"}");
          return;
        }

      } else {
        // 인플루언서가 이미 등록되어 있는 경우 수정 처리
        service.influencerEdit(influencer);

        // 성공 메시지와 상태 전송
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write("{\"status\":\"success\", \"message\":\"수정 완료\"}");
      }

      // 세션에 influencer 객체 저장
      request.getSession().setAttribute("influencer", influencer);

    } catch (Exception e) {
      e.printStackTrace();
      response.setContentType("application/json");
      response.setCharacterEncoding("UTF-8");
      response.getWriter().write("{\"status\":\"error\", \"message\":\"" + e.getMessage() + "\"}");
    }
  }
}
