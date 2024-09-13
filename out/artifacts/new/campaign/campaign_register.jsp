<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Main Page</title>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/campaign_register.css?ver=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css">
</head>
<body>

<%@ include file="../include/header.jsp" %>

<div class="bodyBackground">

    <!-- 통합된 폼 -->
    <form action="campaignRegister" method="post" enctype="multipart/form-data">
        <h2>캠페인 등록하기</h2>
        <div id="adChannel">
            <h3>희망 광고 채널</h3>
            <div id="channel">
                <input type="checkbox" name="channel" id="youtube_checkbox" value="youtube"
                       style="display:none;"
                       <c:if test="${campaign.youtube==1}">checked</c:if>>
                <label for="youtube_checkbox">
                </label>

                <input type="checkbox" name="channel" id="instagram_checkbox" value="insta"
                       style="display:none;"
                       <c:if test="${campaign.instagram==1}">checked</c:if>>
                <label for="instagram_checkbox">
                </label>

                <input type="checkbox" name="channel" id="blog_checkbox" value="blog"
                       <c:if test="${campaign.blog==1}">checked</c:if>>
                <label for="blog_checkbox">
                </label>
            </div>
        </div>

        <div class="companyInfo">
            <div class="campaignField">
                <div class="form-group">
                    <label for="companyName">업체명</label>
                    <input type="text" id="companyName" name="companyName">
                </div>
                <div class="form-group">
                    <label for="companyUrl">업체 URL</label>
                    <input type="text" id="companyUrl" name="companyUrl">
                </div>
                <div class="form-group">
                    <label for="campaignName">캠페인 이름</label>
                    <input type="text" id="campaignName" name="campaignTitle">
                </div>
                <div class="form-group">
                    <label for="productName">상품명</label>
                    <input type="text" id="productName" name="productName">
                </div>
            </div>

            <c:choose>
                <c:when test="${campaign.profileImage==null}">
                    <input type="file" id="fileInput" name="profileImage"
                           style="display: none;"/>
                    <img id="uploadImage"
                         src="${pageContext.request.contextPath}/image/upload.png"
                         alt="Upload Image" style="cursor: pointer">
                </c:when>
                <c:otherwise>
                    <input type="file" id="fileInput" name="profileImage"
                           style="display: none;" onchange="readURL(this)"/>
                    <img id="uploadImage"
                         src="${pageContext.request.contextPath}/image?file=${campaign.profileImage}"
                         alt="Upload Image" style="cursor: pointer"
                    />
                </c:otherwise>
            </c:choose>
        </div>

        <div class="form-group-group">
            <div class="form-group1">
                <label for="uploadPeriod">업로드 기간</label>
                <select id="uploadPeriod" name="uploadPeriod">
                    <option value="1주일">1주일 500 point</option>
                    <option value="2주일">2주일 1000 point</option>
                    <option value="3주일">3주일 1500 point</option>
                </select>
            </div>

            <div class="form-group1">
                <label for="adPeriod">광고 기간</label>
                <select id="adPeriod" name="adPeriod">
                    <option value="start_date">start Date</option>
                    <option value="end_date">end Date</option>
                </select>
            </div>
        </div>

        <div class="categoryContainer">
            <div class="contentHeader">
                <h3 class="categoryH1">컨텐츠 카테고리 선택</h3>
                <p>등록하고자 하는 캠페인 주제를 한 가지 선택해주세요.</p>
            </div>

            <div class="first3">
                <div class="category">
                    <input type="radio" id="beauty" name="category" value="beauty"
                           class="radio-input" style="display:none;">
                    <label for="beauty">
                    </label>

                </div>
                <div class="category">
                    <input type="radio" id="fashion" name="category" value="fashion"
                           class="radio-input" style="display:none;">
                    <label for="fashion">
                    </label>
                </div>

                <div class="category">
                    <input type="radio" id="sport" name="category" value="sport"
                           class="radio-input" style="display:none;">
                    <label for="sport">
                    </label>
                </div>
            </div>

            <div class="second3">
                <div class="category">
                    <input type="radio" id="travel" name="category" value="travel"
                           class="radio-input" style="display:none;">
                    <label for="travel">
                    </label>
                </div>

                <div class="category">
                    <input type="radio" id="food" name="category" value="food" class="radio-input" style="display:none;">
                    <label for="food" >
                    </label>
                </div>

                <div class="category">
                    <input type="radio" id="life" name="category" value="life" class="radio-input" style="display:none;">
                    <label for="life">
                    </label>
                </div>
            </div>
        </div>

        <div class="requirement">
            <div class="requirement-label">요구 사항</div>
            <label>
                <textarea class="requirement-field" name="requirement"
                          placeholder="여기에 요구 사항을 작성하세요..."></textarea>
            </label>
        </div>

        <div class="bottom-button">
            <button type="submit">등록하기</button>
            <button type="button" onclick="window.history.back()">뒤로가기</button>
        </div>


    </form>

</div>

<%@ include file="../include/footer.jsp" %>

<%--    //푸터가 정 사이즈가 아니고, 그리고 우선 form안에 정보 다 넣었음--%>
<%--    // 사이즈 조정 필요--%>

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


</body>
</html>