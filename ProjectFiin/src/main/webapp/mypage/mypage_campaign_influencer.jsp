<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/mypage_campaign_influencer.css?after">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
	
	<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>

</head>
<body>
<%@ include file="../include/header.jsp" %>
<div id="container">
	<%@ include file="../include/sidebar_influencer.jsp" %>
	
    <div id="main">
        <h2>나의 요청 현황</h2>
        <div id="filter">
            <div class="filterbtn" id="receiveCampain" style="border: 2px solid rgb(72,73,232);">신청한 캠페인</div>
            <div class="filterbtn" id="requestCampain" style="border: 2px solid rgb(147,147,147);">요청받은 캠페인</div>
        </div>
        <div id="mainwrap">
	        <h3>신청한 캠페인</h3>
	        <div id="campaignwrap">
	        	<c:forEach items="${campaignListReceive }" var="campaignListReceive">
		            <div class="campaign" id="campaignNum1">
		                <div class="img" onclick="location.href='campaignDetail?campaignNum=${campaignListReceive.campaign_num }'">
		                	<img src="image?file=${campaignListReceive.image}" style="width:220px;height:205px" class="campaign_img">
		                </div>
		                <div class="channel">${campaignListReceive.channel }</div>
		                <div class="compuny_name">${categoryList.get(campaignListReceive.category_id-1).category_name }</div>
		              
		                <div class="name">${campaignListReceive.company_name }</div>
		                <div class="date">
		                	<fmt:formatDate value="${campaignListReceive.ad_start_date}" pattern="yyyy-MM-dd" /> ~ <fmt:formatDate value="${campaignListReceive.ad_end_date}"
							pattern="yyyy-MM-dd" />
						</div>
		                <div class="result_total">
		                	<c:choose>
		                		<c:when test="${campaignListReceive.accept eq false}">
		                			<div class="check">대기중</div>
		               			</c:when>
		               			<c:otherwise>
		               				<div class="check">수락</div>
		               			</c:otherwise>
		               		</c:choose>
		               </div>
		            </div>
		    	</c:forEach> 
			</div>
        	
    	</div>
    
	</div> 
</div>   
</body>
<%@ include file="../include/footer.jsp" %>

<script>
$(document).ready(function() {
	//신청리스트,요청리스트 필터링 버튼
	$("#receiveCampaign").on('click',function(){
		$(this).css("border","2px solid #4849e8");
		$("#requestCampaign").css("border","2px solid #939393");
		alert("1")
		
	})
	$("#requestCampaign").on('click',function(){
		$(this).css("border","2px solid #4849e8");
		$("#receiveCampaign").css("border","2px solid #939393");
		alert("2")
	})
	
    

})  
</script>
</html>