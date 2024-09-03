<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css?ver=1">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css?ver=1">
<script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
<script>
  window.onload = function () {
    const swiperSlides = document.querySelectorAll(".swiper");

    swiperSlides.forEach(function (element, index) {
      element.classList.add("swiper-" + index);
      let swiper = new Swiper(".swiper-" + index, {
        autoplay: {
          delay: 1,
          desableOnInteraction: false,
        },
        speed: 8e3,
        loop: true,
        slidesPerView: "auto",
      });
    });
  };
</script>
</head>
<body>
    <%@ include file="./include/header.jsp" %>
    <!-- banner -->
    <div class="banner">
            <div class="banner_text">
              <h1><span>파</span>인드 <span>인</span>플루언서,</h1>
              <h1>파인</h1>
              <p>브랜드와 인플루언서를 매칭 시켜주는 파인</p>
              <p>파인에 등록된 인기 인플루언서에게 연락해보세요.</p>
            </div>
            <div class="swiper">
              <ul class="influencer_container swiper-wrapper">
                <li class="influencer_item swiper-slide">
                    <img src="${pageContext.request.contextPath}/image/influencer_img01.png" alt="인플루언서이미지01" />
                    <div class="sns_wrap">
                      <p>블로그</p>
                      <p>인스타그램</p>
                    </div>
                    <h2>지그재그</h2>
                    <h3>직장인 데일리룩 올리는 블로거</h3>
                    <p class="subcount">구독자 수 <span>8,000명</span></p>
                </li>
                <li class="influencer_item swiper-slide">
                    <img src="${pageContext.request.contextPath}/image/influencer_img02.png" alt="인플루언서이미지02" />
                    <div class="sns_wrap">
                      <p>유튜브</p>
                      <p>인스타그램</p>
                    </div>
                    <h2>레뷰</h2>
                    <h3>뷰티 인플루언서 레뷰</h3>
                    <p class="subcount">구독자 수 <span>120,000명</span></p>
                </li>
                <li class="influencer_item swiper-slide">
                    <img src="${pageContext.request.contextPath}/image/influencer_img03.png" alt="인플루언서이미지03" />
                    <div class="sns_wrap">
                      <p>인스타그램</p>
                    </div>
                    <h2>축구조아</h2>
                    <h3>축구를 좋아하는 인플루언서</h3>
                    <p class="subcount">구독자 수 <span>1,000명</span></p>
                </li>
                <li class="influencer_item swiper-slide">
                    <img src="${pageContext.request.contextPath}/image/influencer_img04.png" alt="인플루언서이미지04" />
                    <div class="sns_wrap">
                      <p>블로그</p>
                      <p>인스타그램</p>
                    </div>
                    <h2>알쓸식잡</h2>
                    <h3>요리를 좋아하는 블로거</h3>
                    <p class="subcount">구독자 수 <span>1,234,240명</span></p>
                </li>
                <li class="influencer_item swiper-slide">
                    <img src="${pageContext.request.contextPath}/image/influencer_img05.png" alt="인플루언서이미지05" />
                    <div class="sns_wrap">
                      <p>블로그</p>
                      <p>인스타그램</p>
                    </div>
                    <h2>트래블로그</h2>
                    <h3>여행을 좋아하는 인플루언서</h3>
                    <p class="subcount">구독자 수 <span>8,000명</span></p>
                </li>
                <li class="influencer_item swiper-slide">
                    <img src="${pageContext.request.contextPath}/image/influencer_img06.png" alt="인플루언서이미지06" />
                    <div class="sns_wrap">
                      <p>블로그</p>
                    </div>
                    <h2>오늘의집</h2>
                    <h3>생활용품 리뷰하는 블로거</h3>
                    <p class="subcount">구독자 수 <span>120,000명</span></p>
                </li>
                <li class="influencer_item swiper-slide">
                    <img src="${pageContext.request.contextPath}/image/influencer_img06.png" alt="인플루언서이미지06" />
                    <div class="sns_wrap">
                      <p>블로그</p>
                    </div>
                    <h2>오늘의집</h2>
                    <h3>생활용품 리뷰하는 블로거</h3>
                    <p class="subcount">구독자 수 <span>120,000명</span></p>
                </li>
                <li class="influencer_item swiper-slide">
                    <img src="${pageContext.request.contextPath}/image/influencer_img06.png" alt="인플루언서이미지06" />
                    <div class="sns_wrap">
                      <p>블로그</p>
                    </div>
                    <h2>오늘의집</h2>
                    <h3>생활용품 리뷰하는 블로거</h3>
                    <p class="subcount">구독자 수 <span>120,000명</span></p>
                </li>
                <li class="influencer_item swiper-slide">
                    <img src="${pageContext.request.contextPath}/image/influencer_img06.png" alt="인플루언서이미지06" />
                    <div class="sns_wrap">
                      <p>블로그</p>
                    </div>
                    <h2>오늘의집</h2>
                    <h3>생활용품 리뷰하는 블로거</h3>
                    <p class="subcount">구독자 수 <span>120,000명</span></p>
                </li>
                <li class="influencer_item swiper-slide">
                    <img src="${pageContext.request.contextPath}/image/influencer_img06.png" alt="인플루언서이미지06" />
                    <div class="sns_wrap">
                      <p>블로그</p>
                    </div>
                    <h2>오늘의집</h2>
                    <h3>생활용품 리뷰하는 블로거</h3>
                    <p class="subcount">구독자 수 <span>120,000명</span></p>
                </li>
              </ul>
            </div>
            <a href="/fiin/influencer/influencer_list.jsp" class="moreview_btn">인플루언서 더보기</a>
    </div>
    <!-- campaign -->
    <div class="campaign">
        <div class="title">
          <h2>🌟 진행중인 캠페인</h2>
          <p>잇플에서 진행되는 다양한 <span>캠페인</span>에 참여해보세요.</p>
        </div>
        <ul class="campaign_container">
          <li class="campaign_item">    
              <div class="campaign_img_wrap">
                <img src="${pageContext.request.contextPath}/image/campaign_img01.png" alt="캠페인이미지01" />
              </div>
              <div class="campaign_text">
                <p class="campaign_sns">블로그</p>
                <h3>히든클리프</h3>
                <h4>[24-8] 제주 히든클리프 호텔_체험형</h4>
                <p>2024-07-29 ~ 2024-08-05</p>
              </div>
          </li>
          <li class="campaign_item">
              <div class="campaign_img_wrap">
                <img src="${pageContext.request.contextPath}/image/campaign_img01.png" alt="캠페인이미지01" />
              </div>
              <div class="campaign_text">
                <p class="campaign_sns">블로그</p>
                <h3>히든클리프</h3>
                <h4>[24-8] 제주 히든클리프 호텔_체험형</h4>
                <p>2024-07-29 ~ 2024-08-05</p>
              </div>
          </li>
          <li class="campaign_item">
              <div class="campaign_img_wrap">
                <img src="${pageContext.request.contextPath}/image/campaign_img02.png" alt="캠페인이미지02" />
              </div>
              <div class="campaign_text">
                <p class="campaign_sns">인스타그램</p>
                <h3>알리코제약</h3>
                <h4>알리코제약 이너수 질세정기 올리브영 온라인몰 상품평 리뷰</h4>
                <p>2024-07-22 ~ 2024-08-30</p>
              </div>
          </li>
          <li class="campaign_item">
              <div class="campaign_img_wrap">
                <img src="${pageContext.request.contextPath}/image/campaign_img03.png" alt="캠페인이미지03" />
              </div>
              <div class="campaign_text">
                <p class="campaign_sns">인스타그램</p>
                <h3>오휘</h3>
                <h4>오휘 콜라겐 패치 리뷰 (릴스)</h4>
                <p>2024-07-25 ~ 2024-07-27</p>
              </div>
          </li>
          <li class="campaign_item">
              <div class="campaign_img_wrap">
                <img src="${pageContext.request.contextPath}/image/campaign_img01.png" alt="캠페인이미지01" />
              </div>
              <div class="campaign_text">
                <p class="campaign_sns">블로그</p>
                <h3>히든클리프</h3>
                <h4>[24-8] 제주 히든클리프 호텔_체험형</h4>
                <p>2024-07-29 ~ 2024-08-05</p>
              </div>
          </li>
          <li class="campaign_item">
              <div class="campaign_img_wrap">
                <img src="${pageContext.request.contextPath}/image/campaign_img01.png" alt="캠페인이미지01" />
              </div>
              <div class="campaign_text">
                <p class="campaign_sns">블로그</p>
                <h3>히든클리프</h3>
                <h4>[24-8] 제주 히든클리프 호텔_체험형</h4>
                <p>2024-07-29 ~ 2024-08-05</p>
              </div>
          </li>
          <li class="campaign_item">
              <div class="campaign_img_wrap">
                <img src="${pageContext.request.contextPath}/image/campaign_img02.png" alt="캠페인이미지02" />
              </div>
              <div class="campaign_text">
                <p class="campaign_sns">인스타그램</p>
                <h3>알리코제약</h3>
                <h4>알리코제약 이너수 질세정기 올리브영 온라인몰 상품평 리뷰</h4>
                <p>2024-07-22 ~ 2024-08-30</p>
              </div>
          </li>
          <li class="campaign_item">
              <div class="campaign_img_wrap">
                <img src="${pageContext.request.contextPath}/image/campaign_img03.png" alt="캠페인이미지03" />
              </div>
              <div class="campaign_text">
                <p class="campaign_sns">인스타그램</p>
                <h3>오휘</h3>
                <h4>오휘 콜라겐 패치 리뷰 (릴스)</h4>
                <p>2024-07-25 ~ 2024-07-27</p>
              </div>
          </li>
        </ul>
        <a href="/fiin/campaign/campaign_list.jsp" class="moreview_btn">캠페인 더보기</a>
    </div>
    <%@ include file="./include/footer.jsp" %>
</body>
</html>