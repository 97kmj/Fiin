<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
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
		<div>홈 >캠페인>비거너리어쩌구저쩌구 주소</div>

	</div>
	<br>
	<div class="campaign_first_header"  >
		<div class="img"><img src="${pageContext.request.contextPath}/img/${campaign.image }" style="width:380px;height:280px; border-radius:10px;"></div>
		<div class="imgtext">
			<div style="font-size:30px; color : white;  padding :10px;" >
				<span style="background-color : #000000; border-radius:10px; margin-left: 95px;">&nbsp;<b>모집완료</b>&nbsp;</span>
				<span class="wrapper">
					  <input type="checkbox" id="switch" >
					  <label for="switch" class="switch_label" >
					    <span class="onf_btn" ></span>
					  </label>
				</span>
			</div>
			<br>
			<div>
				<span style="font-size:25px; text-align: left; padding :10px; 	margin-left: 90px;"><b>${campaign.channel }</b></span>&nbsp;|&nbsp;<a style="font-size:25px; padding :10px;"><b>${campaign.categoryId }</b></a>
			</div>
			<br>
			<div style="font-size:25px; text-align: left; padding :10px; margin-left: 90px;"><b>${campaign.companyName }</b></div>
			<div style="font-size:20px; text-align: left; padding :20px; margin-left: 80px;">${campaign.adStartDate }~${campaign.adEndDate }</div>
			<br>
			<div >
<%-- 				<c:when test="${user_id == null }">
					<div style=" text-align: center;">
						<a href="signIn.jsp" type="button" class="basic_login" >로그인후 신청해주세요</a>
					</div>
				</c:when>
				<c:otherwise> --%>
					<div  class= "container">
						<img src="${pageContext.request.contextPath}/img/북마크.png" class="bookmark">
						<input type="button"  class="basic_btn" value = "제안하기">
					</div>
				<%-- </c:otherwise> --%>
			</div>
		</div>	
	
	</div>
		<div>
			<br>
			<br>
			<div class="middletext"><img src="img/watch.png" class="middle_text_img"><b>일정정보</b></div>
			<div class="date_information">인플루언서모집기간 ${campaign.updateStartDate }~${campaign.updateEndDate }<br>
								 광고기간 ${campaign.adStartDate }~${campaign.adEndDate }</div>
		</div>
		<br>
		<br>
		<div class="middletext"><img src="img/information.png" class="middle_text_img"><b>기본정보</b></div>
	
		<div class="basic_info">
		<br>
			<div style="font-size:25px; padding : 10px 40px ;"><b>상품명</b></div>
			<div class="prodname">${campaign.productName }</div>
			<br>
			<div style="font-size:25px;padding : 10px 40px;"><b>카테고리</b></div>
			<div class="chanimg">
				<input type="button" class ="prodbut"  value = ${campaign.categoryId }>
			</div>
			<br>
			<br>
			<div style="font-size:25px; padding : 0px 40px 10px 40px;"><b>희망 캠페인 채널</b></div>
			<div class="chanimg" >
				<span class="channel_outline">
					&nbsp;<img src="img/유튜브로고.png" class="channel" ><a class="channel_font">유튜브</a> &nbsp;
				</span>
				<span class="channel_outline">
					&nbsp;<img src="img/인스타그램로고.png" class="channel" ><a class="channel_font">인스타그램</a>&nbsp;
				</span>
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