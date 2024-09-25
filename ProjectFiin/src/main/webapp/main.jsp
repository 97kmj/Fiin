
<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
          disableOnInteraction: false,
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
            
            <!-- 인플루언서 리스트 -->
            <div class="swiper">
              <ul class="influencer_container swiper-wrapper">
              	<c:forEach items="${influencerList}" var="influencer">
                	<li class="influencer_item swiper-slide" OnClick="location.href ='influencerDetail?num=' + ${influencer.influencerNum}">
	                    <img src="image?file=${influencer.profileImage}" alt="인플루언서 이미지" class="profile_img" />
	                    <div class="sns_wrap">
	                      <c:if test="${influencer.youtubeUrl ne null}">
	                      	<img src="https://img.icons8.com/?size=30&id=19318&format=png&color=000000">	                    
	                      </c:if>
	                      <c:if test="${influencer.instagramUrl ne null}">
	                      	<img src="https://img.icons8.com/?size=30&id=Xy10Jcu1L2Su&format=png&color=000000">
	                      </c:if>
	                      <c:if test="${influencer.blogUrl ne null}">
	                      	<img src="${pageContext.request.contextPath}/image/naver.png" style="width: 30px; height: 30px;"/>		                	
	                      </c:if>         
	                    </div>
	                    <h2>${influencer.nickname}</h2>
	                    <h3>${influencer.introLine}</h3>
	                    <p class="subcount">총 팔로워 수
	                    	<span><fmt:formatNumber value="${influencer.instagramFollower + influencer.blogFollower + influencer.youtubeFollower}"/>명</span>
	                    </p>
                	</li>
              	</c:forEach>
              </ul>
            </div>
            <a href="influencerList" class="moreview_btn">인플루언서 더보기</a>
    </div>
    
    <div class="campaign">
        <div class="title">
          <h2>🌟 진행중인 캠페인</h2>
          <p>잇플에서 진행되는 다양한 <span>캠페인</span>에 참여해보세요.</p>
        </div>
        
        <!-- 캠페인 리스트 -->
        <ul class="campaign_container">
          <c:forEach items="${campaignList}" var="campaign">
	          <li class="campaign_item" OnClick="location.href='campaignDetail?campaignNum=' + ${campaign.campaignNum}">    
	              <div class="campaign_img_wrap">
	                <img src="image?file=${campaign.image}" alt="캠페인이미지" />
	              </div>
	              <div class="campaign_text">
	              	<div class="campaign_sns">
	              		<div class="campaign_channel">
	              		<p class="campaign_text_title">광고채널</p>
		                <c:forEach items="${campaign.channel.split('#')}" var="channel">
		                	<c:if test="${channel.equals('blog')}">
		                		<img src="${pageContext.request.contextPath}/image/naver.png" style="width: 25px; height: 25px;"/>
		                	</c:if>
		                    <c:if test="${channel.equals('instagram')}">
		                    	<img src="https://img.icons8.com/?size=25&id=Xy10Jcu1L2Su&format=png&color=000000">
		                    </c:if>
		                    <c:if test="${channel.equals('youtube')}">
		                    	<img src="https://img.icons8.com/?size=25&id=19318&format=png&color=000000">
		                    </c:if>           	
		                </c:forEach>
		                </div>
		                <c:if test="${campaign.categoryId eq '1'}">
		                	<div class="category">뷰티</div>	
		                </c:if>
		                <c:if test="${campaign.categoryId eq '2'}">
		                	<div class="category">패션</div>
		                </c:if>
		                <c:if test="${campaign.categoryId eq '3'}">
		                	<div class="category">스포츠</div>	
		                </c:if>
		                <c:if test="${campaign.categoryId eq '4'}">
		                	<div class="category">여행/숙박</div>	
		                </c:if>

		                <c:if test="${campaign.categoryId eq '5'}">		                
		                	<div class="category">식품</div>
		                </c:if>
		                <c:if test="${campaign.categoryId eq '6'}">
		                	<div class="category">생활용품</div>	
		                </c:if>
		                
	                </div>
	                <div class="campaign_date_wrap">
	                	<p class="campaign_text_title">광고상품</p>
	                	<p>${campaign.productName}</p>
	                </div>
	                <div class="campaign_date_wrap">
	                	<p class="campaign_text_title">캠페인명</p>
	                	<p class="campaign_title">${campaign.campaignTitle}</p>
	                </div>
	              	<div class="campaign_date_wrap">
	                	<p class="campaign_text_title">광고기간</p>
	                	<p>
		                	<fmt:formatDate value="${campaign.updateStartDate}" pattern="yyyy-MM-dd"/> ~ 
		                	<fmt:formatDate value="${campaign.updateEndDate}" pattern="yyyy-MM-dd"/>
	                	</p>
	                </div>
	              </div>
	          </li>
          </c:forEach>       
        </ul>
        <a href="campaignList" class="moreview_btn">캠페인 더보기</a>
    </div>
    <%@ include file="./include/footer.jsp" %>
</body>
</html>
