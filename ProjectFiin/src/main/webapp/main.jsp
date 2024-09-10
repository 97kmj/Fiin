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
              		<!-- OnClick="location.href ='/fiin/influencer_detail.jsp'" -->
                	<li class="influencer_item swiper-slide">
	                    <img src="${pageContext.request.contextPath}/image/influencer_img01.png" alt="인플루언서이미지01" />
	                    <div class="sns_wrap">
	                      <c:if test="${influencer.youtubeUrl ne null}">
	                      	<p>유튜브</p>
	                      </c:if>
	                      <c:if test="${influencer.instagramUrl ne null}">
	                      	<p>인스타그램</p>
	                      </c:if>
	                      <c:if test="${influencer.blogUrl ne null}">
	                      	<p>블로그</p>
	                      </c:if>         
	                    </div>
	                    <h2>${influencer.nickname}</h2>
	                    <h3>${influencer.introLine}</h3>
	                    <p class="subcount">총 구독자 수
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
          	  <!-- OnClick="location.href ='/fiin/campaign_detail.jsp'" -->
	          <li class="campaign_item">    
	              <div class="campaign_img_wrap">
	                <img src="${pageContext.request.contextPath}/image/campaign_img01.png" alt="캠페인이미지01" />
	              </div>
	              <div class="campaign_text">
	              	<div class="sns_wrap">
		                <c:forEach items="${campaign.channel.split('#')}" var="channel">
		                	<c:if test="${channel.equals('blog')}">
		                		<p>블로그</p>
		                	</c:if>
		                    <c:if test="${channel.equals('insta')}">
		                    	<p>인스타그램</p>
		                    </c:if>
		                    <c:if test="${channel.equals('youtube')}">
		                    	<p>유튜브</p>
		                    </c:if>           	
		                </c:forEach>
	                </div>
	                <h3>${campaign.companyName}</h3>
	                <h4>${campaign.campaignTitle}</h4>
	                <p>
	                	<fmt:formatDate value="${campaign.updateStartDate}" pattern="yyyy-MM-dd"/> ~ 
	                	<fmt:formatDate value="${campaign.updateEndDate}" pattern="yyyy-MM-dd"/>
	                </p>
	              </div>
	          </li>
          </c:forEach>       
        </ul>
        <a href="campaignList" class="moreview_btn">캠페인 더보기</a>
    </div>
    <%@ include file="./include/footer.jsp" %>
</body>
</html>