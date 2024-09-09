<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
</head>
<body>
    <header>
    	<a href="/fiin/main">
    		<img src="${pageContext.request.contextPath}/image/logo.svg" alt="logo이미지" />
    	</a>
        <ul class="menu_wrap">
          <li>
            <a href="/fiin/campaignList">캠페인</a>
          </li>
          <li>
            <a href="/fiin/influencerList">인플루언서</a>
          </li>
          <li>
          	<c:choose>
          		<c:when test="${influencer eq null && advertiser eq null}">
          			<a href="main">등록하기</a>
          		</c:when>
          		<c:when test="${advertiser eq null}">
          			<a href="/fiin/influencerRegister">등록하기</a>
          		</c:when>
          		<c:otherwise>
		            <a href="/fiin/campaignRegister">등록하기</a>  			
          		</c:otherwise>
          	</c:choose>
          </li>
          <li>
            <a href="payment">결제하기</a>
          </li>
        </ul>
        <c:choose>
			<c:when test="${influencer eq null && advertiser eq null}">
				<a href="login" class="menu_button">
        			로그인/회원가입
        		</a>
			</c:when>
			<c:when test="${advertiser eq null}">
				<div class="navbar_login">
					<div class="login_info" OnClick="location.href ='/fiin/mypage/mypage_campaign_influencer.jsp'">
						<div class="login_img">
		            		<img src="https://img.icons8.com/?size=100&id=43942&format=png&color=ffffff">
		            	</div>
		            	<p id="userName">${influencer.name}</p>
	            	</div>
	            	<div class="logout_img">
	            		<a href="logout">
	            			<img src="https://img.icons8.com/?size=100&id=3HSHWjvK9Yxq&format=png&color=000000"/>
	            		</a>
	            	</div>
	            </div>
			</c:when>
			<c:otherwise>
				<div class="navbar_login">

					<div class="login_info" OnClick="location.href ='/fiin/mypage/mypage_campaign_advertiser.jsp'">

						<div class="login_img">
	            			<img src="https://img.icons8.com/?size=100&id=43942&format=png&color=ffffff">
	            		</div>
	            		<p id="userName">${advertiser.name}</p>
					</div>
	            	<div class="logout_img">
	            		<a href="logout">
	            			<img src="https://img.icons8.com/?size=100&id=3HSHWjvK9Yxq&format=png&color=000000"/>
	            		</a>
	            	</div>
	            </div>				
			</c:otherwise>
		</c:choose>
      </header>
</body>
</html>