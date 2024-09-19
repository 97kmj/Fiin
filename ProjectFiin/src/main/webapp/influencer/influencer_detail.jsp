<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/reset.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/influencer_detail.css?after">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
	<%@ include file="../include/header.jsp"%>
	<br>

	<div class="campaignaddress">
		<div>홈 >캠페인>비거너리어쩌구저쩌구 주소</div>
	</div>
	<br>

	<div class="productimg">
		<div class="img">
			<img src="image?file=${influencerdetail.profile_image }"
				style="width: 380px; height: 280px; border-radius: 10px;">
		</div>
		<div class="imgtext">
			<div class="basic_info">
				<span><b>${influencerdetail.nickname}</b></span>
			</div>
			<div class="basic_info">
				<b>활동 채널</b>
			</div>
			<div class="chanimg">
				<div>
					<c:if test="${influencerdetail.youtube ne null }">
						<span class="channel_outline"> &nbsp; <img
							src="img/youtube.png" class="channel"> <a
							class="channel_font">유튜브</a> &nbsp;
						</span>
						<span class="subscribers_su">
						<fmt:formatNumber value="${influencerdetail.youtube_follower }" type="number" pattern="#,###"/>명
						</span>
						<br>
					</c:if>
					<c:if test="${influencerdetail.instagram ne null }">
						<span class="channel_outline"> &nbsp; <img
							src="img/instagram.png" class="channel"> <a
							class="channel_font">인스타그램</a>&nbsp;
						</span>
						<span class="subscribers_su">
						<fmt:formatNumber value="${influencerdetail.instagram_follower }" type="number" pattern="#,###"/>명
						</span>
						<br>
					</c:if>
					<c:if test="${influencerdetail.blog ne null }">
						<span class="channel_outline"> &nbsp; <img
							src="img/blog(un).png" class="channel"> <a
							class="channel_font">인스타그램</a>&nbsp;
						</span>
						<span class="subscribers_su">
						<fmt:formatNumber value="${influencerdetail.blog_follower }" type="number" pattern="#,###"/>명
						</span>
					</c:if>
				</div>
			</div>
			<br>

			<div>
				<span class="basic_info"><b>컨텐츠 카테고리 </b>&nbsp;|&nbsp;</span>
				<a style="font-size: 25px; text-align: left;">${influencerdetail.category_name}</a>
			</div>
			<br>
			
			<div class="container">
				<c:choose>
					<c:when test="${type eq 'advertiser' }">
						<c:choose>
							<c:when test="${bookmarkInfluencer eq 'true' }">
								<img src="image/bookmark.png" id="bookmark" style="width:50px; height:50px">
							</c:when>
							<c:otherwise>
								<img src="image/nonBookmark.png" id="bookmark" style="width:50px; height:50px">
							</c:otherwise>
						</c:choose>

						 <div class="modal">
							<div class="modalPopup">
								<h3>캠페인 목록</h3>
								<c:forEach var="campaign" items="${campaignRequest }">
									<li>
										<br>
										캠페인명: ${campaign.campaign_title }<br>
										회사명: ${campaign.company_name }<br>
										상품명: ${campaign.product_name }<br>
										마감일: <fmt:formatDate value="${campaign.ad_end_date }" pattern="yyyy-MM-dd" />
										<button type="button" class="requestBtn" data-campaign-num="${campaign.campaign_num}" data-influencer-num="${influencerdetail.influencer_num }">제안</button>
									</li>
								</c:forEach>
								<button type="button" class="closeBtn">닫기</button>
							</div>
						</div> 

						<!-- end 모달팝업 -->
						<button type="button" class="modalBtn">제안하기</button>


					</c:when>
					<c:when test="${type eq 'influencer' }">
					</c:when>
					<c:otherwise>
						<input type="button" class="basic_btn" value="로그인 후 제안하세요">
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>

	<br>
	<br>

	<div>
		<div class="middletext">
			<img src="${pageContext.request.contextPath}/img/watch.png"
				style="width: 25px; height: 25px; border-radius: 1px;"><b>일정정보</b>
		</div>
		<div class="inp_date">
			캠페인 제안 가능 기간 ${influencerdetail.update_start_date }~${influencerdetail.update_end_date }
		</div>
	</div>
	<br>
	<br>
	<div class="middletext">
		<img src="${pageContext.request.contextPath}/img/information.png"
			style="width: 25px; height: 25px; border-radius: 1px;"><b>기본정보</b>
	</div>

	<div class="basic_info2">
		<br>
		<div style="font-size: 25px; padding: 10px 40px;">
			<b>채널명</b>
		</div>
		<div class="channel_style">
		<c:if test="${influencerdetail.youtube ne null }">
			${influencerdetail.youtube_name }
		</c:if>
		<c:if test="${influencerdetail.instagram ne null }">
			${influencerdetail.instagram_name }
		</c:if>
		<c:if test="${influencerdetail.blog ne null }">
			${influencerdetail.blog_name }
		</c:if>
		</div>
		<br>
		<div style="font-size: 25px; padding: 0px 40px 10px 40px;">
			<b>소개글</b>
		</div>
		<div class="con_middle">
			<div class="Introduction" style="word-break: normal;">
				<br>${influencerdetail.introduction }
		</div>
		<div style="font-size: 25px; padding: 10px 40px;">
			<b>채널 URL</b>
		</div>
		<div class="channel_style">
		<c:if test="${influencerdetail.youtube ne null }">
			${influencerdetail.youtube_url } <br>
		</c:if>
		<c:if test="${influencerdetail.instagram ne null }">
			${influencerdetail.instagram_url } <br>
		</c:if>
		<c:if test="${influencerdetail.blog ne null }">
			${influencerdetail.blog_url }
		</c:if>
		</div>
		<div style="font-size: 25px; padding: 10px 40px;">
			<b>콘텐츠 활용 안내</b>
		</div>
		<div class="content">
			캠페인에 선정되어 작성한 인플루언서 콘텐츠는 회사와 광고주가 활용할 수 있습니다. <br> 이를 원하지 않는 경우
			캠패인을 취소하서나 이미 진행중인 경우 고객센터를 통해 문의해주세요.
		</div>
	</div>
</div>

	<script>
	const modal = document.querySelector('.modal');
	const modalOpen = document.querySelector('.modalBtn');
	const modalClose = document.querySelector('.closeBtn');
	
	modalOpen.addEventListener('click', function(){
		modal.style.display = 'block';
	});
	modalClose.addEventListener('click', function(){
		modal.style.display = 'none';
	});
	</script>

	<script>
	$(function() {
	
	/* var num = "${influencer.influencerNum}"; */
	
	console.log(${influencerdetail.influencer_num})
	$("#bookmark").click(function(){
		$.ajax({
			url:'bookmarkInfluencer',
			type:'post',
			async:true,
			dataType:'text',
			data:{influencerNum:"${influencerdetail.influencer_num}"},
			success:function(result) {
				console.log(result)
				if(result=='true') {
					$('#bookmark').attr('src','image/bookmark.png');
				} else {
					$('#bookmark').attr('src','image/nonBookmark.png');
				}
			},
			error:function(err) {
				console.log(err);
			}
		})
	})
		})
</script>
<script>
$(function() {
	$('.requestBtn').click(function(){
		
		var requestCampaignNum = $(this).data('campaign-num')
		var requestInfluencerNum = $(this).data('influencer-num')
		console.log(requestCampaignNum)
		console.log(requestInfluencerNum)
		$.ajax({
			url:'requestCampaign',
			type:'post',
			async:true,
			dataType:'text',
			data:{
				campaignNum:requestCampaignNum,
				influencerNum:requestInfluencerNum
			},
			success:function(result){
				alert(result)
			},
			error:function(err){
				console.log(err);
			}
		})
	})
})
</script>

	<%@ include file="../include/footer.jsp"%>
</body>

</html>