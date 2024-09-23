<%@ page import="dto.Influencer" %>
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
                        <h2>
                            <c:choose>
                                <c:when test="${influencer.isRegist == 0 || influencer.isRegist == null}">
                                    인플루언서 등록하기
                                </c:when>
                                <c:otherwise>
                                    인플루언서 수정하기
                                </c:otherwise>
                            </c:choose>
                        </h2>
                    </div>

                    <div class="short_introduction">
                        <label for="short_introduction">한 줄 소개</label>

                        <input type="text" id="short_introduction" name="introLine"
                               value="${influencer.introLine}">

                    </div>
                </div>

                <div class="first_line_image">
                    <c:choose>
                        <c:when test="${influencer.profileImage == null}">
                            <input type="file" id="fileInput" name="profileImage"
                                   style="display: none;"/>
                            <img id="uploadImage"
                                 src="${pageContext.request.contextPath}/image/upload.png"
                                 alt="Upload Image"
                                 style="cursor: pointer; width:250px; height: 250px; border-radius: 20%; margin-right: 20px;"
                                 onclick="document.getElementById('fileInput').click();">
                        </c:when>
                        <c:otherwise>
                            <input type="file" id="fileInput" name="profileImage"
                                   style="display: none;"/>
                            <img id="uploadImage"
                                 src="${pageContext.request.contextPath}/image?file=${influencer.profileImage}"
                                 alt="Upload Image"
                                 style="cursor: pointer; border-radius: 20%; width: 250px; height: 250px; margin-right: 20px;"
                                 onclick="document.getElementById('fileInput').click();">
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>

            <%--            --활동채널~채널URL // 유튜브--%>
            <div class="main_second_line">

                <div class="select_channel">

                    <input type="checkbox" id="youtube_checkbox" name="youtube" value="youtube"
                           style="display:none;"
                           <c:if test="${influencer.youtube==1}">checked</c:if>>
                    <label for="youtube_checkbox">
                    </label>
                </div>


                <div class="channel_name">
                    <label for="youtube_channel">채널명</label>

                    <input type="text" id="youtube_channel" name="youtubeName"
                           value="${influencer.youtubeName}" disabled>

                    <label for="youtube_subscriber">구독자 수</label>
                    <input type="text" id="youtube_subscriber" name="youtubeFollower"
                           value="${influencer.youtubeFollower}" disabled>

                </div>

                <div class="channel_url">
                    <label for="youtube_url">채널 URL</label>
                    <input type="text" id="youtube_url" name="youtubeUrl"
                           value="${influencer.youtubeUrl}" disabled>

                </div>
            </div>

            <%--            --활동채널~채널URL // 인스타--%>
            <div class="main_second_line">
                <div class="select_channel">

                    <input type="checkbox" id="instagram_checkbox" name="instagram"
                           value="instagram" style="display:none;"
                           <c:if test="${influencer.instagram==1}">checked</c:if>>
                    <label for="instagram_checkbox">
                    </label>
                </div>

                <div class="channel_name">
                    <label for="instagram_channel">채널명</label>

                    <input type="text" id="instagram_channel" name="instagramName"
                           value="${influencer.instagramName}" disabled>

                    <label for="instagram_subscriber">구독자 수</label>
                    <input type="text" id="instagram_subscriber" name="instagramFollower"
                           value="${influencer.instagramFollower}" disabled>

                </div>

                <div class="channel_url">
                    <label for="instagram_url">채널 URL</label>

                    <input type="text" id="instagram_url" name="instagramUrl"
                           value="${influencer.instagramUrl}" disabled>

                </div>
            </div>

            <%--            --활동채널~채널URL // 블로그--%>
            <div class="main_second_line">
                <div class="select_channel">
                    <input id="blog_checkbox" type="checkbox" name="blog"
                           value="blog" style="display:none;"
                           <c:if test="${influencer.blog==1}">checked</c:if>>
                    <label for="blog_checkbox"></label>

                </div>

                <div class="channel_name">
                    <label for="blog_channel">채널명</label>

                    <input type="text" id="blog_channel" name="blogName"
                           value="${influencer.blogName}" disabled>

                    <label for="blog_subscriber">구독자 수</label>
                    <input type="text" id="blog_subscriber" name="blogFollower"
                           value="${influencer.blogFollower}" disabled>


                </div>

                <div class="channel_url">
                    <label for="blog_url">채널 URL</label>

                    <input type="text" id="blog_url" name="blogUrl" value="${influencer.blogUrl}"
                           disabled>

                </div>
            </div>


            <h1 class="categoryH1">주요 활동 카테고리</h1>

            <div class="categoryContainer">

                <div class="first3">
                    <div class="category">
                        <input type="radio" id="beauty" name="category" value="1"
                               style="display:none;"
                               <c:if test="${influencer.categoryId==1}">checked</c:if>>
                        <label for="beauty">
                        </label>

                    </div>

                    <div class="category">
                        <input type="radio" id="fashion" name="category" value="2"
                               style="display:none;"
                               <c:if test="${influencer.categoryId==2}">checked</c:if>>
                        <label for="fashion">
                        </label>

                    </div>

                    <div class="category">
                        <input type="radio" id="sport" name="category" value="3"
                               style="display:none;"
                               <c:if test="${influencer.categoryId==3}">checked</c:if>>
                        <label for="sport">
                        </label>

                    </div>
                </div>

                <div class="second3">
                    <div class="category">
                        <input type="radio" id="travel" name="category" value="4"
                               style="display:none;"
                               <c:if test="${influencer.categoryId==4}">checked</c:if>>
                        <label for="travel">
                        </label>
                    </div>

                    <div class="category">
                        <input type="radio" id="food" name="category" value="5"
                               style="display:none;"
                               <c:if test="${influencer.categoryId==5}">checked</c:if>>
                        <label for="food">
                        </label>

                    </div>

                    <div class="category">
                        <input type="radio" id="life" name="category" value="6"
                               style="display:none;"
                               <c:if test="${influencer.categoryId==6}">checked</c:if>>
                        <label for="life">
                        </label>

                    </div>
                </div>
            </div>

            <div class="requirement">
                <div class="requirement-label">소개글 작성</div>
                <label>

                    <textarea class="requirement-field" name="introduction"
                              placeholder="소개글을 작성 해주세요.">${influencer.introduction}</textarea>

                </label>
            </div>

            <div class="bottom-button">
                <button class="registerBtn" value="등록">
                    <c:choose>
                        <c:when test="${influencer.isRegist == 0 || influencer.isRegist == null}">
                            등록하기
                        </c:when>
                        <c:otherwise>
                            수정하기
                        </c:otherwise>
                    </c:choose>
                </button>
                <button class="backBtn" value="뒤로가기">뒤로 가기</button>
            </div>


        </form>

        <div id="pointModal" class="modal" style="display: none;">
            <div class="modal_body">
                <div id="modalContent"></div>
                <h3>포인트 충전 페이지로 이동하시겠습니까?</h3>
                <div class="modal_button">
                    <button class="confirmBtn">확인</button>
                    <button class="cancelBtn">취소</button>
                </div>
            </div>
        </div>

    </div>
</div>

<%@ include file="../include/footer.jsp" %>

<script>
  const file = document.getElementById("fileInput");
  const preview = document.getElementById("uploadImage");

  // 페이지 로드 시 기존 이미지를 미리보기로 설정
  window.onload = function() {
    const existingImage = "${influencer.profileImage}";
    if (existingImage) {
      preview.src = "${pageContext.request.contextPath}/image?file=" + existingImage;
    }
  };

  // 파일 선택 시 미리보기 업데이트
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
  $("input[name=profileImage]").on("change", function () {
    let maxSize = 5 * 1024 * 1024; //* 5MB 사이즈 제한
    let fileSize = this.files[0].size; //업로드한 파일용량

    if (fileSize > maxSize) {
      alert("파일첨부 사이즈는 5MB 이내로 가능합니다.");
      $(this).val(''); //업로드한 파일 제거
      return;
    }
  });
</script>

<script>
  window.onload = function () {
    // 유튜브 체크박스와 필드 활성화
    var youtubeCheckbox = document.getElementById('youtube_checkbox');
    var instagramCheckbox = document.getElementById('instagram_checkbox');
    var blogCheckbox = document.getElementById('blog_checkbox');

    if (youtubeCheckbox.checked) {
      youtubeCheckbox.dispatchEvent(new Event('change'));
    }

    if (instagramCheckbox.checked) {
      instagramCheckbox.dispatchEvent(new Event('change'));
    }

    if (blogCheckbox.checked) {
      blogCheckbox.dispatchEvent(new Event('change'));
    }

    // 유튜브 체크박스와 필드 설정
    youtubeCheckbox.addEventListener('change', function () {
      var isChecked = this.checked;
      document.getElementById('youtube_channel').disabled = !isChecked;
      document.getElementById('youtube_subscriber').disabled = !isChecked;
      document.getElementById('youtube_url').disabled = !isChecked;
    });

    // 인스타그램 체크박스와 필드 설정
    instagramCheckbox.addEventListener('change', function () {
      var isChecked = this.checked;
      document.getElementById('instagram_channel').disabled = !isChecked;
      document.getElementById('instagram_subscriber').disabled = !isChecked;
      document.getElementById('instagram_url').disabled = !isChecked;
    });

    // 블로그 체크박스와 필드 설정
    blogCheckbox.addEventListener('change', function () {
      var isChecked = this.checked;
      document.getElementById('blog_channel').disabled = !isChecked;
      document.getElementById('blog_subscriber').disabled = !isChecked;
      document.getElementById('blog_url').disabled = !isChecked;
    });
  }
</script>

<script>
  function toggleFields(checkboxId, fields) {
    var checkbox = document.getElementById(checkboxId);
    var isChecked = checkbox.checked;
    fields.forEach(function (fieldId) {
      document.getElementById(fieldId).disabled = !isChecked;
    });
  }

  window.onload = function () {
    // 유튜브 체크박스 상태에 따라 필드 활성화
    toggleFields('youtube_checkbox', ['youtube_channel', 'youtube_subscriber', 'youtube_url']);

    // 인스타그램 체크박스 상태에 따라 필드 활성화
    toggleFields('instagram_checkbox',
        ['instagram_channel', 'instagram_subscriber', 'instagram_url']);

    // 블로그 체크박스 상태에 따라 필드 활성화
    toggleFields('blog_checkbox', ['blog_channel', 'blog_subscriber', 'blog_url']);

    // 체크박스 변경 시 필드 상태 업데이트
    document.getElementById('youtube_checkbox').addEventListener('change', function () {
      toggleFields('youtube_checkbox', ['youtube_channel', 'youtube_subscriber', 'youtube_url']);
    });
    document.getElementById('instagram_checkbox').addEventListener('change', function () {
      toggleFields('instagram_checkbox',
          ['instagram_channel', 'instagram_subscriber', 'instagram_url']);
    });
    document.getElementById('blog_checkbox').addEventListener('change', function () {
      toggleFields('blog_checkbox', ['blog_channel', 'blog_subscriber', 'blog_url']);
    });
  }
</script>

<script>
  <%--      // 모달에서 "확인" 버튼 클릭 시 /payment 페이지로 이동--%>
  document.querySelector(".confirmBtn").addEventListener("click", function () {
    window.location.href = "/fiin/payment"; // 결제 페이지로 이동
  });

  <%--      // 모달에서 "취소" 버튼 클릭 시 모달 닫기--%>
  document.querySelector(".cancelBtn").addEventListener("click", function () {
    document.getElementById("pointModal").style.display = "none"; // 모달 닫기
  });

  <%--      // 뒤로가기 버튼 클릭 시 메인 화면으로 이동--%>
  document.querySelector(".backBtn").addEventListener("click", function (e) {
    e.preventDefault()
    window.location.href = "/fiin/main"; // 메인 페이지로 이동
  });

</script>

<script>
  //등록하기 버튼 클릭 시, 모달창 띄우기(포인트 부족) or 등록하기(포인트 충분)
  $(".registerBtn").click(function (e) {
    let isRegist = "${influencer.isRegist}";
    let point = '${influencer.pointBalance}';
    if ((isRegist == null || +isRegist == 0) && (point == null || +point < 500)) {
      // 모달 창 표시
      e.preventDefault(); // 기본 동작 방지
      document.getElementById("pointModal").style.display = "block";
    }
  })
</script>

<script>
  // 필드값이 없을 경우, 알림창 띄우기
  document.querySelector('form').addEventListener('submit', function (event) {
    // 한 줄 소개
    let introLine = document.getElementById('short_introduction').value;
    if (introLine.trim() === '') {
      event.preventDefault(); // 폼 제출 막기
      alert('소개글을 입력해주세요!');
      return;
    }

    // 프로필 이미지
    let profileImage = document.getElementById('fileInput').value;
    if (profileImage.trim() === '') {
      event.preventDefault(); // 폼 제출 막기
      alert('프로필 이미지를 선택해주세요!');
      return;
    }

    // 유튜브 채널명, 구독자 수, 채널 URL
    let youtubeCheckbox = document.getElementById('youtube_checkbox').checked;
    if (youtubeCheckbox) {
      let youtubeChannel = document.getElementById('youtube_channel').value;
      let youtubeSubscribers = document.getElementById('youtube_subscriber').value;
      let youtubeUrl = document.getElementById('youtube_url').value;

      if (youtubeChannel.trim() === '') {
        event.preventDefault();
        alert('유튜브 채널명을 입력해주세요!');
        return;
      }
      if (youtubeSubscribers.trim() === '') {
        event.preventDefault();
        alert('유튜브 구독자 수를 입력해주세요!');
        return;
      }
      if (youtubeUrl.trim() === '') {
        event.preventDefault();
        alert('유튜브 채널 URL을 입력해주세요!');
        return;
      }
    }

    // 인스타그램 채널명, 구독자 수, 채널 URL
    let instagramCheckbox = document.getElementById('instagram_checkbox').checked;
    if (instagramCheckbox) {
      let instagramChannel = document.getElementById('instagram_channel').value;
      let instagramSubscribers = document.getElementById('instagram_subscriber').value;
      let instagramUrl = document.getElementById('instagram_url').value;

      if (instagramChannel.trim() === '') {
        event.preventDefault();
        alert('인스타그램 채널명을 입력해주세요!');
        return;
      }
      if (instagramSubscribers.trim() === '') {
        event.preventDefault();
        alert('인스타그램 구독자 수를 입력해주세요!');
        return;
      }
      if (instagramUrl.trim() === '') {
        event.preventDefault();
        alert('인스타그램 채널 URL을 입력해주세요!');
        return;
      }
    }

    // 블로그 채널명, 구독자 수, 채널 URL
    let blogCheckbox = document.getElementById('blog_checkbox').checked;
    if (blogCheckbox) {
      let blogChannel = document.getElementById('blog_channel').value;
      let blogSubscribers = document.getElementById('blog_subscriber').value;
      let blogUrl = document.getElementById('blog_url').value;

      if (blogChannel.trim() === '') {
        event.preventDefault();
        alert('블로그 채널명을 입력해주세요!');
        return;
      }
      if (blogSubscribers.trim() === '') {
        event.preventDefault();
        alert('블로그 구독자 수를 입력해주세요!');
        return;
      }
      if (blogUrl.trim() === '') {
        event.preventDefault();
        alert('블로그 채널 URL을 입력해주세요!');
        return;
      }
    }

    if (!youtubeCheckbox && !instagramCheckbox && !blogCheckbox) {
      event.preventDefault()
      alert('최소 하나의 채널은 선택되어야 합니다.');
      return null;
    }

    // 카테고리 선택
    let categoryChecked = document.querySelector('input[name="category"]:checked');
    if (!categoryChecked) {
      event.preventDefault();
      alert('카테고리를 선택해주세요!');
      return;
    }

    // 소개글
    let introduction = document.querySelector('textarea[name="introduction"]').value;
    if (introduction.trim() === '') {
      event.preventDefault();
      alert('소개글을 작성해주세요!');
      return;
    }
  });
</script>


</body>
</html>
