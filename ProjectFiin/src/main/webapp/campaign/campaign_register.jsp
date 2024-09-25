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
        <h2>캠페인 등록하기</h2>
        <div id="adChannel">
            <h3>희망 광고 채널</h3>
            <div id="channel">
                <input type="checkbox" name="channel" id="youtube_checkbox" value="youtube"
                       style="display:none;">
                <label for="youtube_checkbox">
                </label>

                <input type="checkbox" name="channel" id="instagram_checkbox" value="instagram"
                       style="display:none;">
                <label for="instagram_checkbox">
                </label>

                <input type="checkbox" name="channel" id="blog_checkbox" value="blog">
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

            <div class="imgForm" onclick="document.getElementById('fileInput').click();">
                <input type="file" id="fileInput" name="image" style="display: none;">
            <img id="uploadImage"
                src="${pageContext.request.contextPath}/image/upload.png"
                alt="Upload Image" style="cursor: pointer"/>
            </div>

        </div>

        <div class="form-group-group">
            <div class="form-group1">
                <label for="uploadPeriod">업로드 기간</label>
                <select id="uploadPeriod" name="uploadPeriod">
                    <option value="7">1주일 500 point</option>
                    <option value="14">2주일 1000 point</option>
                    <option value="21">3주일 1500 point</option>
                    <option value="28">4주일 1800 point</option>
                </select>
            </div>

            <div class="form-group2">
                <div class="startDate">
                    <label for="StartDate">광고 시작일</label>
                    <input type="text" id="StartDate" name="startDate"
                           value="${campaign.adStartDate}">
                    <input type="hidden" id="startDateInput" name="adStartDate"> <!-- 숨겨진 input -->
                </div>

                <div class="endDate">
                    <label for="EndDate">광고 종료일</label>
                    <input type="text" id="EndDate" name="endDate" value="${campaign.adEndDate}">
                    <input type="hidden" id="endDateInput" name="adEndDate"> <!-- 숨겨진 input -->
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
                    <input type="radio" id="beauty" name="category" value="1" style="display:none;">
                    <label for="beauty">
                    </label>

                </div>
                <div class="category">
                    <input type="radio" id="fashion" name="category" value="2"
                           style="display:none;">
                    <label for="fashion">
                    </label>
                </div>

                <div class="category">
                    <input type="radio" id="sport" name="category" value="3" style="display:none;">
                    <label for="sport">
                    </label>
                </div>
            </div>

            <div class="second3">
                <div class="category">
                    <input type="radio" id="travel" name="category" value="4" style="display:none;">
                    <label for="travel">
                    </label>
                </div>

                <div class="category">
                    <input type="radio" id="food" name="category" value="5" style="display:none;">
                    <label for="food">
                    </label>
                </div>

                <div class="category">
                    <input type="radio" id="life" name="category" value="6" style="display:none;">
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
            <button class="registerBtn" value="등록">등록하기</button>
            <button class="backBtn" value="뒤로가기">뒤로가기</button>
        </div>
    </form>


    <div id="pointModal" class="modal" style="display: none;">
        <div class="modal_body">
            <div id="modalContent"></div>
            <h3>포인트가 부족합니다. </br> 포인트 충전 페이지로 이동하시겠습니까?</h3>
            <div class="modal_button">
                <button class="confirmBtn">확인</button>
                <button class="cancelBtn">취소</button>
            </div>
        </div>
    </div>

</div>

<%@ include file="../include/footer.jsp" %>


<%--<script>--%>
<%--  //이미지 클릭 시, "찾기"로 이동--%>
<%--  document.getElementById('uploadImage').addEventListener('click', function () {--%>
<%--    document.getElementById('fileInput').click();--%>
<%--  });--%>
<%--</script>--%>

<script>
  const fileInput = document.getElementById("fileInput");
  const preview = document.getElementById("uploadImage");

  // 파일 선택 시 미리보기 업데이트
  fileInput.addEventListener("change", () => {
    const reader = new FileReader();
    reader.onload = () => {
      preview.src = reader.result; // 미리보기 이미지 업데이트
    };

    // 선택된 파일이 존재하는 경우만 읽기
    if (fileInput.files && fileInput.files[0]) {
      reader.readAsDataURL(fileInput.files[0]);
    }
  });
</script>

<script>
  /* 파일용량 제한*/
  $("input[name=image]").on("change", function () {
    let maxSize = 5 * 1024 * 1024; //* 5MB 사이즈 제한
    let fileSize = this.files[0].size; //업로드한 파일용량

    if (fileSize > maxSize) {
      alert("파일첨부 사이즈는 5MB 이내로 가능합니다.");
      $(this).val(''); //업로드한 파일 제거
      return;
    }
  });
</script>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-ui-timepicker-addon/1.6.3/jquery-ui-timepicker-addon.min.js"></script>

<script>
  $(function () {
    // StartDate와 EndDate의 공통 설정을 한 번에 적용
    $("#StartDate, #EndDate").datepicker({
      dateFormat: 'yy-mm-dd',
      showOtherMonths: true,
      showMonthAfterYear: true,
      changeYear: true,
      changeMonth: true,
      buttonImageOnly: true,
      buttonText: "선택",
      yearSuffix: "년",
      monthNamesShort: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'],
      dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
      dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일']
    });

    // StartDate에서 날짜를 선택할 때 EndDate의 달력 자동 표시
    $("#StartDate").on("change", function () {
      // 200ms 지연 후 EndDate 달력을 표시
      setTimeout(function () {
        $("#EndDate").focus();  // EndDate로 포커스 이동
        $("#EndDate").datepicker("show");  // EndDate의 달력 표시
      }, 200);  // 지연 시간 조정 가능
    });

    // StartDate에 날짜 선택 시, 숨겨진 input에 시간 포함하여 설정
    $("#StartDate").on("change", function () {
      let dateText = $(this).val();
      $('#startDateInput').val(dateText + " 00:00:00");  // 숨겨진 input에 시간 추가
    });

    // EndDate에 날짜 선택 시, 숨겨진 input에 시간 포함하여 설정
    $("#EndDate").on("change", function () {
      let dateText = $(this).val();
      $('#endDateInput').val(dateText + " 23:59:59");  // 숨겨진 input에 시간 추가
    });
  });
</script>

<script>

  // 모달에서 "확인" 버튼 클릭 시 /payment 페이지로 이동
  document.querySelector(".confirmBtn").addEventListener("click", function () {
    window.location.href = "/fiin/payment"; // 결제 페이지로 이동
  });

  // 모달에서 "취소" 버튼 클릭 시 모달 닫기
  document.querySelector(".cancelBtn").addEventListener("click", function () {
    document.getElementById("pointModal").style.display = "none"; // 모달 닫기
  });

  // 뒤로가기 버튼 클릭 시 메인 화면으로 이동
  document.querySelector(".backBtn").addEventListener("click", function (e) {
    e.preventDefault();
    window.location.href = "/fiin/main"; // 메인 페이지로 이동
  });

</script>

<script>
  //등록하기 버튼 클릭 시, 업로드 기간에 따라서 포인트 차감(부족 시, 알림창 띄우기)
  $(".registerBtn").click(function (e) {
    let point = '${advertiser.pointBalance}';
    let uploadPeriodSelect = document.getElementById('uploadPeriod')
    let uploadPeriodValue = uploadPeriodSelect.value;

    if (uploadPeriodValue == 7 && (point == null || +point < 500)) {
      e.preventDefault(); // 기본 동작 방지
      document.getElementById("pointModal").style.display = "block";
    } else if (uploadPeriodValue == 14 && (point == null || +point < 1000)) {
      e.preventDefault(); // 기본 동작 방지
      document.getElementById("pointModal").style.display = "block";
    } else if (uploadPeriodValue == 21 && (point == null || +point < 1500)) {
      e.preventDefault(); // 기본 동작 방지
      document.getElementById("pointModal").style.display = "block";
    } else if (uploadPeriodValue == 28 && (point == null || +point < 1800)) {
      e.preventDefault(); // 기본 동작 방지
      document.getElementById("pointModal").style.display = "block";
    }
  });
</script>

<script>
  document.querySelector('form').addEventListener('submit', function (event) {

    // 채널 최소 1개 선택
    let youtubeCheckbox = document.getElementById('youtube_checkbox').checked;
    let instagramCheckbox = document.getElementById('instagram_checkbox').checked;
    let blogCheckbox = document.getElementById('blog_checkbox').checked;

    if (!youtubeCheckbox && !instagramCheckbox && !blogCheckbox) {
      event.preventDefault();
      alert('최소 하나의 광고 채널을 선택해주세요!');
      return;
    }

    // 업체명
    let companyName = document.getElementById('companyName').value;
    if (companyName.trim() === '') {
      event.preventDefault();
      alert('업체명을 입력해주세요!');
      return;
    }

    // 업체 URL
    let companyUrl = document.getElementById('companyUrl').value;
    if (companyUrl.trim() === '') {
      event.preventDefault();
      alert('업체 URL을 입력해주세요!');
      return;
    }

    // 캠페인 이름
    let campaignName = document.getElementById('campaignName').value;
    if (campaignName.trim() === '') {
      event.preventDefault();
      alert('캠페인 이름을 입력해주세요!');
      return;
    }

    // 상품명
    let productName = document.getElementById('productName').value;
    if (productName.trim() === '') {
      event.preventDefault();
      alert('상품명을 입력해주세요!');
      return;
    }

    // 프로필 이미지
    let profileImage = document.getElementById('fileInput').value;
    if (profileImage.trim() === '') {
      event.preventDefault();
      alert('프로필 이미지를 선택해주세요!');
      return;
    }



    // 업로드 기간
    let uploadPeriod = document.getElementById('uploadPeriod').value;
    if (uploadPeriod.trim() === '') {
      event.preventDefault();
      alert('업로드 기간을 선택해주세요!');
      return;
    }

    // 광고 시작일
    let startDate = document.getElementById('StartDate').value;
    if (startDate.trim() === '') {
      event.preventDefault();
      alert('광고 시작일을 입력해주세요!');
      return;
    }

    // 광고 종료일
    let endDate = document.getElementById('EndDate').value;
    if (endDate.trim() === '') {
      event.preventDefault();
      alert('광고 종료일을 입력해주세요!');
      return;
    }

    // 카테고리 선택
    let categoryChecked = document.querySelector('input[name="category"]:checked');
    if (!categoryChecked) {
      event.preventDefault();
      alert('카테고리를 선택해주세요!');
      return;
    }

    // 요구 사항
    let requirement = document.querySelector('textarea[name="requirement"]').value;
    if (requirement.trim() === '') {
      event.preventDefault();
      alert('요구 사항을 입력해주세요!');
      return;
    }

  });
</script>

</body>
</html>