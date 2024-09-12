<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/campaign_detail.css?after">
<Script src="http://code.jquery.com/jquery-latest.min.js"></Script>
</head>
<body>
<%@ include file="../include/header.jsp" %>
	<br>
	<div class="all_container ">
	<div class="campaignaddress">
		<div>홈 > 캠페인> ${campaign.companyName }</div>

	</div>
	<br>
	<div class="campaign_first_header"  >
		<div class="img"><img src="${pageContext.request.contextPath}/img/${campaign.image }" style="width:380px;height:280px; border-radius:10px;"></div>
		<div class="imgtext">
			<div style="font-size:30px; color : white;  padding :10px;" >
				<span style="background-color : #000000; border-radius:10px; margin-left: 95px;">&nbsp;<b>모집완료</b>&nbsp;</span>		
				<c:choose>
					<c:when test="${influencer ne null and type eq advertiser}">	
						<span class="wrapper">
					  		<input type="checkbox" id="switch" >
					  		<label for="switch" class="switch_label" >
					   		 <span class="onf_btn" ></span>
					  		</label>
						</span>
					</c:when>
				</c:choose>
			</div>
			<div>
				<span style="font-size:25px; text-align: left; padding :10px; 	margin-left: 90px;"><b>${campaign.channel }</b></span>&nbsp;|&nbsp;<a style="font-size:25px; padding :10px;"><b>${categoryList.get(campaign.categoryId-1).category_name }</b></a>
			</div>

			<div style="font-size:25px; text-align: left; padding :10px; margin-left: 90px;"><b>${campaign.companyName }</b></div>
			<div style="font-size:20px; text-align: left; padding :20px; margin-left: 80px;">
			<fmt:formatDate value="${campaign.adStartDate }" pattern="yyyy-MM-dd" />~<fmt:formatDate value="${campaign.adEndDate }" pattern="yyyy-MM-dd" />
			</div>
			<div >
				<c:choose>
	 				<c:when test="${influencer eq null }">
						<div style=" text-align: center;">
							<a href="login" type="button" class="basic_login" >로그인후 신청해주세요</a>
						</div>
					</c:when>
					<c:otherwise>
						<div  class= "container">
							<img src="${pageContext.request.contextPath}/image/북마크.png" class="bookmark">
							<input type="button"  class="basic_btn" value = "제안하기">
						</div>
					</c:otherwise>
				</c:choose>
			</div>
		</div>	
	
	</div>
		<div>
			<br>
			<br>
			<div class="middletext"><img src="image/watch.png" class="middle_text_img"><b>일정정보</b></div>
			<div class="date_information">
				인플루언서모집기간 <fmt:formatDate value="${campaign.updateStartDate }" pattern="yyyy-MM-dd" />~<fmt:formatDate value="${campaign.updateStartDate }"  pattern="yyyy-MM-dd" /><br>
				광고기간 <fmt:formatDate value="${campaign.adStartDate }" pattern="yyyy-MM-dd" />~<fmt:formatDate value="${campaign.adEndDate }" pattern="yyyy-MM-dd" />
			</div>
		</div>
		<br>
		<br>
		<div class="middletext"><img src="image/information.png" class="middle_text_img"><b>기본정보</b></div>
	
		<div class="basic_info">
		<br>
			<div style="font-size:25px; padding : 10px 40px ;"><b>상품명</b></div>
			<div class="prodname">${campaign.productName }</div>
			<br>
			<div style="font-size:25px;padding : 10px 40px;"><b>카테고리</b></div>
			<div class="chanimg">
				<input type="button" class ="prodbut"  value = ${categoryList.get(campaign.categoryId-1).category_name }>
			</div>
			<br>
			<br>
			<div style="font-size:25px; padding : 0px 40px 10px 40px;"><b>희망 캠페인 채널</b></div>
			<div class="chanimg" >
				<c:forEach items="${fn:split(campaign.channel, ',')}" var="item">
				    <c:choose>
				        <c:when test="${item == 'Blog'}">
				            <span class="channel_outline">
				                &nbsp;<img src="image/블로그.png" class="channel" /><a class="channel_font">블로그</a>&nbsp;
				            </span>
				        </c:when>
				        <c:when test="${item == 'Instagram'}">
				            <span class="channel_outline">
				                &nbsp;<img src="image/인스타.png" class="channel" /><a class="channel_font">인스타</a>&nbsp;
				            </span>
				        </c:when>
				        <c:when test="${item == 'YouTube'}">
				            <span class="channel_outline">
				                &nbsp;<img src="image/유튜브.png" class="channel" /><a class="channel_font">유튜브</a>&nbsp;
				            </span>
				        </c:when>
				    </c:choose>
				</c:forEach>
			</div>
				
			<br>
			<br>
			<div style="font-size:25px; padding : 0px 40px 10px 40px;"><b>광고 요구 사항</b></div>
			<div class="con_middle"> 
				<div class="campaign_request" style="word-break: normal;"><br>${campaign.requirement }
				</div>
				</div>
				<br>
				<div style="font-size:25px; padding : 10px 40px;"><b>업체 URL</b></div>
				<div class="prodname">www.naver.com</div>
				<br>
				<div style="font-size:25px; padding : 10px 40px;"><b>콘텐츠 활용 안내</b></div>
				<br>
				<div class="content">캠페인에 선정되어 작성한 인플루언서 콘텐츠는 회사와 광고주가 활용할 수 있습니다. <br>
				이를 원하지 않는 경우 캠패인을 취소하서나 이미 진행중인 경우 고객센터를 통해 문의해주세요.</div>
		</div>
		<br>
		</div>
	<%@ include file="../include/footer.jsp" %>
</body>
</html>