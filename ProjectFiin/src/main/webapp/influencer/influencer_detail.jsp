<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@	page import="java.util.Date" %>
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
		<div>홈 >인플루언서>상세페이지</div>
	</div>
	<br>

	<div class="productimg">
		<div class="img">
			<img src="image?file=${influencerdetail.profile_image }" style="width: 380px; height: 280px; border-radius: 10px">
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
					<div class="channelLine">
					<c:if test="${influencerdetail.youtube ne null }">
						<span class="channel_outline"> 
						<img src="https://img.icons8.com/?size=60&id=19318&format=png&color=000000">
						</span>
						<span class="subscribers_su">
						<fmt:formatNumber value="${influencerdetail.youtube_follower }" type="number" pattern="#,###"/>명
						</span>
						<br>
					</c:if>
					</div>
					<div class="channelLine">
					<c:if test="${influencerdetail.instagram ne null }">
						<span class="channel_outline">
						<img src="https://img.icons8.com/?size=60&id=Xy10Jcu1L2Su&format=png&color=000000">
						</span>
						<span class="subscribers_su">
						<fmt:formatNumber value="${influencerdetail.instagram_follower }" type="number" pattern="#,###"/>명
						</span>
						<br>
					</c:if>
					</div>
					<div class="channelLine">
					<c:if test="${influencerdetail.blog ne null }">
						<span class="channel_outline">
						<img src="${pageContext.request.contextPath}/image/naver.png" style="width: 60px; height: 60px;"/>
						</span>
						<span class="subscribers_su">
						<fmt:formatNumber value="${influencerdetail.blog_follower }" type="number" pattern="#,###"/>명
						</span>
					</c:if>
					</div>
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
							<div class="outBtn">
								<h2 style="margin:20px">캠페인 목록</h2>
								<span>
									<button type="button" class="closeBtn" style="margin-top: 10px">닫기</button>
								</span>
							</div>	
								<table>
									<thead>
									<tr align="center">
										<th>캠페인명</th>
										<th>회사명</th>
										<th>상품명</th>
										<th>마감일</th>
										<th>제안</th>
									</tr>
									</thead>
									<tbody>
										<c:forEach var="list" items="${campaignRequest }">
											<tr align="center">
												<td>${list.campaign_title }</td>
												<td>${list.company_name }</td>
												<td>${list.product_name }</td>
												<td><fmt:formatDate value="${list.ad_end_date }" pattern="yyyy-MM-dd" /></td>
												<td>
													 <button type="button" class="requestBtn" data-campaign-num="${list.campaign_num}" data-influencer-num="${influencerdetail.influencer_num }">제안</button>																		
												
													 <%-- <c:choose>
														<c:when test="${requestScope.requestCampaign == true }">
															<button type="button" class="requestBtn" data-campaign-num="${list.campaign_num}" data-influencer-num="${influencerdetail.influencer_num }">제안</button>																		
														</c:when>
														<c:otherwise>
															<button class="nonRequestBtn">완료</button>		
														</c:otherwise>
													</c:choose>	  --%>										
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
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
			<img src="${pageContext.request.contextPath}/image/watch.png"
				style="width: 25px; height: 25px; border-radius: 1px;"><b>일정정보</b>
		</div>
      	<div class="inp_date">
         캠페인 제안 가능 기간 &nbsp;   
         <fmt:formatDate value="${influencerdetail.regist_date}" pattern="yyyy-MM-dd"/> 
         ~ <span id="regist_end_date" style=""></span>
     	 </div>
		
	</div>
	<br>
	<br>
	<div class="middletext">
		<img src="${pageContext.request.contextPath}/image/information.png"
			style="width: 25px; height: 25px; border-radius: 1px;"><b>기본정보</b>
	</div>

	<div class="basic_info2">
		<br>
		<div style="font-size: 25px; padding: 10px 40px;">
			<b>채널</b>
		</div>
		<div class="channel_name">
		<div id="channelVar">
			<c:if test="${influencerdetail.youtube ne null }">
				<span id="channelImg"><img src="https://img.icons8.com/?size=60&id=19318&format=png&color=000000"></span>
				<span id="channelNa">${influencerdetail.youtube_name }</span>
				<span id="channelUrl">${influencerdetail.youtube_url }<br></span>
			</c:if>
		</div>
		<div id="channelVar">	
			<c:if test="${influencerdetail.instagram ne null }">
				<span id="channelImg"><img src="https://img.icons8.com/?size=60&id=Xy10Jcu1L2Su&format=png&color=000000"></span>
				<span id="channelNa">${influencerdetail.instagram_name }</span>
				<span id="channelUrl">${influencerdetail.instagram_url } <br></span>
			</c:if>
		</div>
		<div id="channelVar">
			<c:if test="${influencerdetail.blog ne null }">
				<span id="channelImg"><img src="${pageContext.request.contextPath}/image/naver.png" style="width: 60px; height: 60px;"/></span>
				<span id="channelNa">${influencerdetail.blog_name }</span>
				<span id="channelUrl">${influencerdetail.blog_url }</span>
			</c:if>
		</div>
		</div>
		<br>
		<div style="font-size: 25px; padding: 0px 40px 10px 40px;">
			<b>소개글</b>
		</div>
		<div class="con_middle">
			<div class="Introduction" style="word-break: normal;">
				${influencerdetail.introduction }
			</div>
		<div style="font-size: 25px; padding: 10px; margin-top: 20px">
			<b>콘텐츠 활용 안내</b>
		</div>
		<div class="content">
			캠페인에 선정되어 작성한 인플루언서 콘텐츠는 회사와 광고주가 활용할 수 있습니다. <br> 이를 원하지 않는 경우
			캠패인을 취소하서나 이미 진행중인 경우 고객센터를 통해 문의해주세요.
		</div>
	</div>
</div>

	<script>
	   var start_date = new Date("${influencerdetail.regist_date}")
	   var end_date = new Date(start_date.setDate(start_date.getDate()+30))
	   var year = end_date.getFullYear();
	   var month = String(end_date.getMonth() + 1).padStart(2, '0');
	   var day = String(end_date.getDate()).padStart(2, '0');
	   $("#regist_end_date").text(year + "-"+ month + "-" + day);
	
	</script>



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
		
		var $button = $(this)
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
				if(result=='캠페인 요청이 성공적으로 처리되었습니다.') {
					$button.css({
						'width': '50px',
						'height': '30px',
						'borderRadius': '10px',
						'backgroundColor': 'gray',
						'color': 'white'
					})

                  
				} else {
					$button.css({
					'width': '50px',
					'height': '30px',
					'borderRadius': '10px',
					'backgroundColor': 'gray',
					'color': 'white'
					})
				}
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