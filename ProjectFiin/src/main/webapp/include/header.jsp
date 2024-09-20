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
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.6.0.min.js"></script>
</head>
<body>
    <header>
    	<a href="main">
    		<img src="${pageContext.request.contextPath}/image/logo.svg" alt="logo이미지" />
    	</a>
        <ul class="menu_wrap">
          <li>
            <a href="campaignList">캠페인</a>
          </li>
          <li>
            <a href="influencerList">인플루언서</a>
          </li>
          <li>
          	<c:choose>
          		<c:when test="${influencer eq null && advertiser eq null}">
          			<a href="javascript:alert('로그인 후 사용해주세요.'); location.href='login';">등록하기</a>
          		</c:when>
          		<c:when test="${advertiser eq null}">
          			<a href="influencerRegister">등록하기</a>
          		</c:when>
          		<c:otherwise>
		            <a href="campaignRegister">등록하기</a>  			
          		</c:otherwise>
          	</c:choose>
          </li>
          <li>
          	<c:choose>
          		<c:when test="${influencer eq null && advertiser eq null}">
          			<a href="javascript:alert('로그인 후 사용해주세요.'); location.href='login'">결제하기</a>
          		</c:when>
          		<c:otherwise>
					<a href="payment">결제하기</a>          		
          		</c:otherwise>
          	</c:choose>
          </li>
        </ul>
        
        <c:choose>
			<c:when test="${influencer eq null && advertiser eq null}">
				<a href="login" class="menu_button">
        			로그인/회원가입
        		</a>
			</c:when>
			<c:otherwise>
				<div class="navbar_login">
					<c:choose>
						<c:when test="${advertiser eq null}">
							<div class="login_info" OnClick="location.href ='mypageCampaignInfluencer'">
								<div class="login_img">
								<c:choose>
									<c:when test="${influencer.profileImage ne null}">
										<img src="image?file=${influencer.profileImage}" alt="프로필 이미지"/>
									</c:when>
									<c:otherwise>
										<img src="https://img.icons8.com/?size=100&id=43942&format=png&color=ffffff" style="background-color: #4849e8;">
									</c:otherwise>
								</c:choose>
				            	</div>
						        <p id="userName">${influencer.name}</p>        
	            			</div>
						</c:when>
						<c:otherwise>
							<div class="login_info" OnClick="location.href ='mypageCampaignAdvertiser'">
						        <p id="userName">${advertiser.name}</p>
					        </div>     
						</c:otherwise>
					</c:choose>
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