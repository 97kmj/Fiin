<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Main Page</title>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/campaign_register.css?ver=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css">

<%--    //jquery추가--%>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
</head>
<body>

<%@ include file="../include/header.jsp" %>

<div class="bodyBackground">

    <!-- 통합된 폼 -->
    <form action="campaignRegister" method="post" enctype="multipart/form-data">
        <h2>
        <c:choose>
            <c:when test="${campaign.companyName == null}">
                캠페인 등록하기
            </c:when>
            <c:otherwise>
                캠페인 수정하기
            </c:otherwise>
        </c:choose>
        </h2>
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
                    <input type="text" id="companyName" name="companyName"
                           value="${campaign.companyName}">
                </div>
                <div class="form-group">
                    <label for="companyUrl">업체 URL</label>
                    <input type="text" id="companyUrl" name="companyUrl"
                           value="${campaign.companyUrl}">
                </div>
                <div class="form-group">
                    <label for="campaignName">캠페인 이름</label>
                    <input type="text" id="campaignName" name="campaignTitle"
                           value="${campaign.campaignTitle}">
                </div>
                <div class="form-group">
                    <label for="productName">상품명</label>
                    <input type="text" id="productName" name="productName"
                           value="${campaign.productName}">
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
                    <option value="4주일">4주일 1800 point</option>
                </select>
            </div>

            <div class="form-group2">
                <div class="startDate">
                    <label for="StartDate">Start Date</label>
                    <input type="text" id="StartDate" name="adStartDate"
                           value="${campaign.adStartDate}">
                </div>

                <div class="endDate">
                    <label for="EndDate">End Date</label>
                    <input type="text" id="EndDate" name="adEndDate"
                           value="${campaign.adEndDate}">
                </div>

            </div>
        </div>

        <div class="categoryContainer">
            <div class="contentHeader">
                <h3 class="categoryH1">컨텐츠 카테고리 선택</h3>
                <p>등록하고자 하는 캠페인 주제를 한 가지 선택해주세요.</p>
            </div>

            <div class="first3">
                <div class="category">
                    <input type="radio" id="beauty" name="category" value="1" style="display:none;"
                           <c:if test="${campaign.categoryId==1}">checked</c:if>>
                    <label for="beauty">
                    </label>

                </div>
                <div class="category">
                    <input type="radio" id="fashion" name="category" value="2" style="display:none;"
                           <c:if test="${campaign.categoryId==2}">checked</c:if>>
                    <label for="fashion">
                    </label>
                </div>

                <div class="category">
                    <input type="radio" id="sport" name="category" value="3" style="display:none;"
                           <c:if test="${campaign.categoryId==3}">checked</c:if>>
                    <label for="sport">
                    </label>
                </div>
            </div>

            <div class="second3">
                <div class="category">
                    <input type="radio" id="travel" name="category" value="4" style="display:none;"
                           <c:if test="${campaign.categoryId==4}">checked</c:if>>
                    <label for="travel">
                    </label>
                </div>

                <div class="category">
                    <input type="radio" id="food" name="category" value="5" style="display:none;"
                           <c:if test="${campaign.categoryId==5}">checked</c:if>>
                    <label for="food">
                    </label>
                </div>

                <div class="category">
                    <input type="radio" id="life" name="category" value="6" style="display:none;"
                           <c:if test="${campaign.categoryId==6}">checked</c:if>>
                    <label for="life">
                    </label>
                </div>
            </div>
        </div>

        <div class="requirement">
            <div class="requirement-label">요구 사항</div>
            <label>
                <textarea class="requirement-field" name="requirement"
                          placeholder="여기에 요구 사항을 작성하세요...">${campaign.requirement}</textarea>
            </label>
        </div>

        <div class="bottom-button">
            <button type="submit" class="registerBtn" value="등록" onclick="showModal(event)">등록하기</button>
            <button type="button" onclick="window.history.back()">뒤로가기</button>
        </div>

        <div id="pointModal" class="modal" style="display: none;">
            <div class="modal_body">
                <div id="modalContent"></div>
                <h3>포인트가 부족합니다. </br> 포인트 충전 페이지로 이동하시겠습니까?</h3>
                <div class="modal_button">
                    <button class="confirmBtn" onclick="confirmAction()">확인</button>
                    <button class="cancelBtn" onclick="closeModal()">취소</button>
                </div>
            </div>
        </div>



    </form>

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
  document.addEventListener("DOMContentLoaded", function () {
    // 등록 버튼 클릭 시 서버에 AJAX 요청
    document.querySelector(".bottom-button button[type='submit']").addEventListener("click", function (event) {
      event.preventDefault(); // 기본 동작 방지

      // AJAX 요청을 통해 서버에 데이터 전송
      fetch('/fiin/campaignRegister', {
        method: 'POST',
        body: new FormData(document.querySelector('form')) // form 데이터 전송
      })
      .then(response => response.json()) // 응답을 JSON으로 변환
      .then(data => {
        console.log('Response Data:', data); // 서버 응답 확인
        if (data.status === 'success') {
          // 성공 시 페이지 이동
          alert(data.message); // 성공 메시지 표시
          window.location.href = "/fiin/campaignList"; // 페이지 이동
        } else if (data.status === 'error') {
          // 포인트 부족 시 포인트 충전 페이지로 이동
          if (data.message.includes("포인트가 부족")) {
            window.location.href = "/fiin/payment"; // 결제 페이지로 이동
          } else {
            // 기타 에러 처리
            alert(data.message); // 에러 메시지 표시
          }
        }
      })
      .catch(error => {
        console.error('Error:', error);
      });
    });

    // 뒤로가기 버튼 클릭 시
    document.querySelector(".bottom-button button[type='button']").addEventListener("click", function () {
      window.history.back(); // 이전 페이지로 이동
    });
  });
</script>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment.min.js"></script>

<script>
  $(document).ready(function() {
    $("#StartDate").datepicker({
      dateFormat: 'yy-mm-dd', // jQuery UI Datepicker format
      onSelect: function(dateText) {
        // 선택한 날짜를 서버로 전송할 준비
        $('#startDateInput').val(dateText + ' 00:00:00'); // 시간을 추가하여 yyyy-MM-dd HH:mm:ss 형식으로 변환
      }
    });

    $("#EndDate").datepicker({
      dateFormat: 'yy-mm-dd', // jQuery UI Datepicker format
      onSelect: function(dateText) {
        // 선택한 날짜를 서버로 전송할 준비
        $('#endDateInput').val(dateText + ' 23:59:59'); // 시간을 추가하여 yyyy-MM-dd HH:mm:ss 형식으로 변환
      }
    });
  });
</script>

<script>

  document.addEventListener("DOMContentLoaded", function () {

    // 등록 버튼 클릭 시 서버에 AJAX 요청
    document.querySelector(".registerBtn").addEventListener("click", function (event) {
      event.preventDefault(); // 기본 동작 방지

      // AJAX 요청을 통해 서버에 데이터 전송
      fetch('/fiin/influencerRegister', {
        method: 'POST',
        body: new FormData(document.querySelector('form')) // form 데이터 전송
      })
      .then(response => response.json()) // 응답을 JSON으로 변환
      .then(data => {
        console.log('Response Data:', data); // 서버 응답 확인
        if (data.status === 'success') {
          // 성공 시 모달을 닫고 페이지 이동
          alert(data.message); // 성공 메시지 표시
          window.location.href = "/fiin/influencerList"; // 페이지 이동
        } else if (data.status === 'error') {
          // 포인트 부족 또는 에러 발생 시 모달 표시
          document.getElementById("pointModal").style.display = "block";
          document.getElementById("modalContent").innerText = data.message; // 에러 메시지 설정
        }
      })
      .catch(error => {
        console.error('Error:', error);
      });
    });

    // 모달에서 "확인" 버튼 클릭 시 /payment 페이지로 이동
    document.querySelector(".confirmBtn").addEventListener("click", function () {
      window.location.href = "/fiin/payment"; // 결제 페이지로 이동
    });

    // 모달에서 "취소" 버튼 클릭 시 모달 닫기
    document.querySelector(".cancelBtn").addEventListener("click", function () {
      document.getElementById("pointModal").style.display = "none"; // 모달 닫기
    });

    // 뒤로가기 버튼 클릭 시 메인 화면으로 이동
    document.querySelector(".backBtn").addEventListener("click", function () {
      window.location.href = "/fiin/main"; // 메인 페이지로 이동
    });
  });

</script>



</body>
</html>