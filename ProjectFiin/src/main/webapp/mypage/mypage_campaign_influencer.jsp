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
	<style>
		.selBtn {
			border: 2px solid #4849E8;
			 color:#4849E8;
		}
	</style>
</head>
<body>
<%@ include file="../include/header.jsp" %>
<div id="container">
	<%@ include file="../include/sidebar_influencer.jsp" %>
	
    <div id="main">
        <h2>나의 요청 현황</h2>
        <div id="filter">
            <a href="mypageCampaignInfluencer?btnType=receive" class="filterbtn <c:if test='${btnType eq "receive"}'>selBtn</c:if>" >신청한 캠페인</a>
            <a href="mypageCampaignInfluencer?btnType=request" class="filterbtn <c:if test='${btnType eq "request"}'>selBtn</c:if>" >요청받은 캠페인</a>
        </div>
        <div id="mainwrap">
	        <h3>신청한 캠페인</h3>
	        <div id="campaignwrap" >
	        	<c:forEach items="${campaignListAccept }" var="campaignListAccept">
		            <div class="campaign" >
		                <div class="img" onclick="location.href='campaignDetail?campaignNum=${campaignListAccept.campaign_num }'">
		                	<img src="image?file=${campaignListAccept.image}" style="width:220px;height:205px" class="campaign_img">
		                </div>
		                <div class="channel">${campaignListAccept.channel }</div>
		                <div class="compuny_name">${categoryList.get(campaignListAccept.category_id-1).category_name }</div>
		              
		                <div class="name">${campaignListAccept.company_name }</div>
		                <div class="campaigndate">광고기간</div>
		                <div class="date">
		                	<fmt:formatDate value="${campaignListAccept.ad_start_date}" pattern="yyyy-MM-dd" /> ~ <fmt:formatDate value="${campaignListAccept.ad_end_date}"
							pattern="yyyy-MM-dd" />
						</div>
		                <div class="result_total">
		                	<c:choose>
		                		<c:when test="${campaignListAccept.accept eq false}">
		                			<c:choose>
			                			<c:when test="${btnType eq 'request'}">
			                				<div class="check" value="${campaignListAccept.request_num }">수락하기</div>
			                			</c:when>
			                			<c:otherwise>
			                				<div class="checkreceive">대기중</div>
			                			</c:otherwise>
		                			</c:choose>
		               			</c:when>
		               			<c:otherwise>
		               				<c:choose>
		               					<c:when test="${btnType eq 'request'}">
		               						<div class="check">수락완료</div>
		               					</c:when>
		               					<c:otherwise>
		               						<div class="checkreceive">수락완료</div>
		               					</c:otherwise>
		               				</c:choose>
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
	$("#ckecked").on('click',function(){
		var requestNum = $(this).attr("value");
		alert("1")
		$.ajax({
			url:"mypageCampaignInfluencer",
			type:"POST",
			async:true,
			data:{requestNum:requestNum },
		
			success:function(result){
				$("#ckecked").text('수락완료');
				alert("?")
			},
			error:function(err){
				console.log(err);
			}
				
		})
	})
})  
</script>
</html>