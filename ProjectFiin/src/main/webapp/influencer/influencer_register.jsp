<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Main Page</title>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/influencer_register.css?ver=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css">

</head>
<body>

<%@ include file="../include/header.jsp" %>

<div class="bodyBackground">
    <div id="main">
        <form action="influencerRegister" method="post" enctype="multipart/form-data">
            <div class="main_first_line">
                <div class="first_line">
                    <div class="influencer_register">
                        <h2>인플루언서 등록하기</h2>
                    </div>

                    <div class="short_introduction">
                        <label for="short_introduction">한 줄 소개</label>

                        <input type="text" id="short_introduction" name="introLine"
                               value="${influencer.introLine}">

                    </div>
                </div>

                <div class="first_line_image">
                    <c:choose>
                        <c:when test="${influencer.profileImage==null}">
                            <img id="uploadImage"
                                 src="${pageContext.request.contextPath}/image/upload.png"
                                 alt="Upload Image" style="cursor: pointer">
                            <input type="file" id="fileInput" name="profileImage"
                                   style="display: none;"/>
                        </c:when>
                        <c:otherwise>
                            <input type="file" id="fileInput" name="profileImage"
                                   style="display: none;" onchange="readURL(this)"/>
                            <img id="uploadImage"
                                 src="${pageContext.request.contextPath}/image?file=${influencer.profileImage}"
                                 alt="Upload Image" style="cursor: pointer"
                                <%--                                 onclick="document.getElementById('fileInput').click();"--%>
                            />
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>


            <%--            --활동채널~채널URL // 유튜브--%>
            <div class="main_second_line">

                <div class="select_channel">
                    <input type="checkbox" id="youtube_checkbox" name="youtube" value="youtube" style="display:none;"
                           <c:if test="${influencer.youtube==1}">checked</c:if>>
<%--                    <label for="active_youtube">활동 채널</label>--%>
                    <img id="youtube_image"  src="${pageContext.request.contextPath}/image/youtube.png" alt="youtube"
                         class="radio-image" onclick="toggleImage('youtube')">
                </div>



                <div class="channel_name">
                    <label for="youtube_channel">채널명</label>

                    <input type="text" id="youtube_channel" name="youtubeName"
                           value="${influencer.youtubeName}">

                    <label for="youtube_subscriber">구독자 수</label>
                    <input type="text" id="youtube_subscriber" name="youtubeFollower"
                           value="${influencer.youtubeFollower}">

                </div>

                <div class="channel_url">
                    <label for="youtube_url">채널 URL</label>
                    <input type="text" id="youtube_url" name="youtubeUrl"
                           value="${influencer.youtubeUrl}">

                </div>
            </div>

            <%--            --활동채널~채널URL // 인스타--%>
            <div class="main_second_line">
                <div class="select_channel">
                    <input type="checkbox" id="instagram_checkbox" name="instagram" value="instagram" style="display:none;"
                           <c:if test="${influencer.instagram==1}">checked</c:if>>
<%--                    <label for="active_instagram">활동 채널</label>--%>
                    <label for="instagram_checkbox">
                    <img id="instagram_image" src="${pageContext.request.contextPath}/image/instagram.png"
                         alt="instagram" class="radio-image" onclick = "toggleImage('instagram')">
                    </label>
                </div>

                <div class="channel_name">
                    <label for="instagram_channel">채널명</label>

                    <input type="text" id="instagram_channel" name="instagramName"
                           value="${influencer.instagramName}">

                    <label for="instagram_subscriber">구독자 수</label>
                    <input type="text" id="instagram_subscriber" name="instagramFollower"
                           value="${influencer.instagramFollower}">


                </div>

                <div class="channel_url">
                    <label for="instagram_url">채널 URL</label>

                    <input type="text" id="instagram_url" name="instagramUrl"
                           value="${influencer.instagramUrl}">

                </div>
            </div>


            <%--            --활동채널~채널URL // 블로그--%>
            <div class="main_second_line">
                <div class="select_channel">
                    <input id="blog_image" type="checkbox" id="blog_checkbox" name="blog" value="blog" style="display:none;"
                           <c:if test="${influencer.blog==1}">checked</c:if>>
<%--                    <label for="active_blog">활동 채널</label>--%>

                    <img src="${pageContext.request.contextPath}/image/blog(un).png" alt="youtube"
                         class="radio-image" onclick="toggleImage('blog')">

                </div>

                <div class="channel_name">
                    <label for="blog_channel">채널명</label>

                    <input type="text" id="blog_channel" name="blogName"
                           value="${influencer.blogName}">

                    <label for="blog_subscriber">구독자 수</label>
                    <input type="text" id="blog_subscriber" name="blogFollower"
                           value="${influencer.blogFollower}">


                </div>

                <div class="channel_url">
                    <label for="blog_url">채널 URL</label>

                    <input type="text" id="blog_url" name="blogUrl" value="${influencer.blogUrl}">

                </div>
            </div>


            <h1 class="categoryH1">주요 활동 카테고리</h1>

            <div class="categoryContainer">
                <%--    <div class="contentHeader">--%>

                <%--    <p>등록하고자 하는 캠페인 주제를 한 가지 선택해주세요.</p>--%>
                <%--    </div>--%>


                <div class="first3">
                    <div class="category">
                        <label for="beauty">

                            <img src="${pageContext.request.contextPath}/image/beauty.png" alt="뷰티"
                                 class="radio-image">
                            <input type="radio" id="beauty" name="category" value="1"
                                   <c:if test="${influencer.categoryId==1}">checked</c:if>>
                        </label>

                    </div>

                    <div class="category">
                        <label for="fashion">

                            <img src="${pageContext.request.contextPath}/image/fashion.png" alt="패션"
                                 class="radio-image">
                            <input type="radio" id="fashion" name="category" value="2"
                                   <c:if test="${influencer.categoryId==2}">checked</c:if>>
                        </label>

                    </div>

                    <div class="category">
                        <label for="sport">

                            <img src="${pageContext.request.contextPath}/image/sport.png" alt="스포츠"
                                 class="radio-image">
                            <input type="radio" id="sport" name="category" value="3"
                                   <c:if test="${influencer.categoryId==3}">checked</c:if>>
                        </label>

                    </div>
                </div>

                <div class="second3">
                    <div class="category">
                        <label for="travel">

                            <img src="${pageContext.request.contextPath}/image/travel(un).png" alt="여행"
                                 class="radio-image">
                            <input type="radio" id="travel" name="category" value="4"
                                   <c:if test="${influencer.categoryId==4}">checked</c:if>>
                        </label>

                    </div>

                    <div class="category">
                        <label for="food">

                            <img src="${pageContext.request.contextPath}/image/food.png" alt="식품"
                                 class="radio-image">
                            <input type="radio" id="food" name="category" value="5"
                                   <c:if test="${influencer.categoryId==5}">checked</c:if>>
                        </label>

                    </div>

                    <div class="category">
                        <label for="life">

                            <img src="${pageContext.request.contextPath}/image/life.png" alt="생활용품"
                                 class="radio-image">
                            <input type="radio" id="life" name="category" value="6"
                                   <c:if test="${influencer.categoryId==6}">checked</c:if>>
                        </label>

                    </div>
                </div>
            </div>

            <%--</form>--%>


            <div class="requirement">
                <div class="requirement-label">소개글 작성</div>
                <label>

                    <textarea class="requirement-field" name="introduction"
                              placeholder="소개글을 작성 해주세요.">${influencer.introduction}</textarea>

                </label>
            </div>

            <div class="bottom-button">

                <button type="submit" value="등록">등록하기</button>
                <button type="button" value="뒤로가기">뒤로 가기</button>
            </div>
        </form>
    </div>
</div>

<%@ include file="../include/footer.jsp" %>

<script>
  //이미지 클릭 시, "찾기"로 이동
  document.getElementById('uploadImage').addEventListener('click', function () {
    document.getElementById('fileInput').click();
  });
</script>

<script>
  const file = document.getElementById("fileInput");
  const preview = document.getElementById("uploadImage");

  //파일 선택 시 미리보기 업데이트
  file.addEventListener("change", () => {
    const reader = new FileReader();
    reader.onload = () => {
      preview.src = reader.result;
    };
    // 선택된 파일이 존재하는 경우만 읽기
    if (file.files && file.files[0]) {
      reader.readAsDataURL(file.files[0]);
    }
  });
</script>

<script>
  /* 파일용량 제한*/
  $("input[name=profileImage]").on("change", function(){
    let maxSize = 5 * 1024 * 1024; //* 5MB 사이즈 제한
    let fileSize = this.files[0].size; //업로드한 파일용량

    if(fileSize > maxSize){
      alert("파일첨부 사이즈는 5MB 이내로 가능합니다.");
      $(this).val(''); //업로드한 파일 제거
      return;
    }
  });
</script>

<script>
  function changeYoutubeImage() {
    const image = document.getElementById('active_youtube');
    const currentSrc = image.src;

    // 기존 이미지와 다른 이미지 파일 경로
    const originalImage = '/image/youtube.png'; // 기존 이미지
    const newImage = '/image/youtube(checked).png'; // 변경할 이미지

    // 이미지가 기존 이미지일 경우 다른 이미지로 변경
    if (currentSrc.includes(originalImage)) {
      image.src = newImage;
    } else {
      // 이미지가 이미 변경된 경우 다시 원래 이미지로 변경
      image.src = originalImage;
    }
  }
</script>

<script>
  // 채널 클릭 시, 클릭된 이미지로 변경
  function toggleImage(platform) {
    const checkbox = document.getElementById(`${platform}_checkbox`);
    const image = document.getElementById(`${platform}_image`);

    // 이미지 클릭 시, 체크박스의 상태를 반영하여 이미지 변경
    if (checkbox.checked) {
      // 체크 해제 시 원래 이미지로 변경
      image.src = `${pageContext.request.contextPath}/image/${platform}.png`;
      checkbox.checked = false;
    } else {
      // 체크 시 선택된 이미지로 변경
      image.src = `${pageContext.request.contextPath}/image/${platform}_checked.png`;
      checkbox.checked = true;
    }
  }

  // 페이지 로드 시, 체크박스 상태에 따라 이미지 설정
  window.onload = function() {
    const platforms = ['instagram', 'youtube', 'blog']; // 플랫폼 목록
    platforms.forEach(platform => {
      const checkbox = document.getElementById(`${platform}_checkbox`);
      const image = document.getElementById(`${platform}_image`);

      if (checkbox.checked) {
        image.src = `${pageContext.request.contextPath}/image/${platform}_checked.png`;
      } else {
        image.src = `${pageContext.request.contextPath}/image/${platform}.png`;
      }
    });
  };
</script>

</body>
</html>
