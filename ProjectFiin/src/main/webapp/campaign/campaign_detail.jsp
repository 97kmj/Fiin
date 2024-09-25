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
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
<%@ include file="../include/header.jsp" %>
	<div class="all_container ">
	<div class="campaignaddress">
		<div>홈 > 캠페인> ${campaign.productName }</div>
	</div>
	<br>
	<div class="campaign_first_header"  >
		<div class="img"><img src="image?file=${campaign.image}" style="width:380px;height:280px; border-radius:10px;"></div>
		<div class="imgtext">
			<c:choose>
				<c:when test="${advertiser.advertiserNum eq campaign.advertiserNum}">
					<div class="toggle_wrap">
						<input type="checkbox" id="toggle"  class="toggleCheckbox" ${campaign.isRecruit eq 1 ? 'checked' : ''} />
						<label for="toggle" class='toggleContent' aria-label="Recruitment status">
							<div class="ing" >모집완료</div>							
							<div class="complete" >모집중</div>
						</label>
					</div>
				</c:when>
				<c:otherwise>
					<div  style="font-size:30px; color : white; text-align: center;  padding :10px;" >
						<span id="recruit" style="font-weight:700;background-color : #000000; border-radius:10px;">
							<c:choose>
								<c:when test="${campaign.isRecruit eq 1}">
									&nbsp;모집중&nbsp;
								</c:when>
								<c:otherwise>
									&nbsp;모집완료&nbsp;
								</c:otherwise>
							</c:choose>
						</span>	
					</div>
				</c:otherwise>		
			</c:choose>
			<div style=" text-align: center; padding:10px;">
				<span style="font-size:25px; padding :10px;"><b>${campaign.channel }</b></span>&nbsp;|&nbsp;<a style="font-size:25px; padding :10px;"><b>${categoryList.get(campaign.categoryId-1).category_name }</b></a>
			</div>

			<div style="font-size:25px; text-align: center;"><b>${campaign.productName }</b></div>
			<div style="font-size:20px; text-align: center; padding :10px;">광고기간 : 
			<fmt:formatDate value="${campaign.adStartDate }" pattern="yyyy-MM-dd" />~<fmt:formatDate value="${campaign.adEndDate }" pattern="yyyy-MM-dd" />
			</div>
			<div >
				<c:choose>
	 				<c:when test="${type eq null }">
						<div style=" text-align: center;">
							<a href="login" type="button" class="basic_login" >&nbsp;로그인후 신청해주세요&nbsp;</a>
						</div>
					</c:when>
					<c:otherwise>
						<div class= "container">
							 <c:choose>
								<c:when test='${type eq "influencer"}'>
									<c:choose>
										<c:when test='${campaign.isRecruit eq "1" }'>
											<c:choose>
												<c:when test="${bookmarkCampaign eq 'false' }">
													<img src="image/book.png" class="bookmark" id="book">
												</c:when>
												<c:otherwise>
													<img src="image/bookchecked.png" class="bookmark" id="book">
												</c:otherwise>
											</c:choose>
											<c:choose>
												<c:when test="${requestCampaign eq 'true' }">
													<input type="button"  id="requestcampaign" class="basic_btn" value = "신청하기">
												</c:when>
												<c:otherwise>
													<input type="button"  id="requestcampaign" class="basic_btn" value = "신청취소">
												</c:otherwise>
											</c:choose>
										</c:when>
										<c:otherwise>
											<input type="button"  class="basic_btn1" value = "모집완료된 제품입니다.">
										</c:otherwise>
									</c:choose>
								</c:when>								
								<c:otherwise>
								</c:otherwise>
							</c:choose>
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
				인플루언서모집기간 : <fmt:formatDate value="${campaign.updateStartDate }" pattern="yyyy-MM-dd" />~<fmt:formatDate value="${campaign.updateEndDate }"  pattern="yyyy-MM-dd" /><br>
				광고기간 : <fmt:formatDate value="${campaign.adStartDate }" pattern="yyyy-MM-dd" />~<fmt:formatDate value="${campaign.adEndDate }" pattern="yyyy-MM-dd" />
			</div>
		</div>
		<br>
		<br>
		<div class="middletext"><img src="image/information.png" class="middle_text_img"><b>기본정보</b></div>
	
		<div class="basic_info">
			<div style="font-size:25px; padding : 10px 40px ;"><b>상품명</b></div>
			<div class="prodname">${campaign.productName }</div>
			<div style="font-size:25px;padding : 10px 40px;"><b>카테고리</b></div>
			<div class="chanimg">
				<input type="button" class ="prodbut"  value = ${categoryList.get(campaign.categoryId-1).category_name }>
			</div>
			<div style="font-size:25px; padding : 0px 40px 10px 40px;"><b>희망 캠페인 채널</b></div>
			<div class="chanimg" >
				<c:forTokens items="${campaign.channel}" delims="# " var="item">
				    <c:choose>
				        <c:when test="${item == '블로그'}">
				            <span class="channel_outline">
				                &nbsp;<img src="image/blog_logo.png" class="channel" /><a class="channel_font">블로그</a>&nbsp;
				            </span>
				        </c:when>
				        <c:when test="${item == '인스타그램'}">
				            <span class="channel_outline">
				                &nbsp;<img src="image/instagram_logo.png" class="channel" /><a class="channel_font">인스타</a>&nbsp;
				            </span>
				        </c:when>
				        <c:when test="${item == '유튜브'}">
				            <span class="channel_outline">
				                &nbsp;<img src="image/youtube_logo.png" class="channel" /><a class="channel_font">유튜브</a>&nbsp;
				            </span>
				        </c:when>
				    </c:choose>					
				</c:forTokens>
				

 			</div>

			<div style="font-size:25px; padding : 0px 40px 10px 40px;"><b>광고 요구 사항</b></div>
			<div class="con_middle"> 
				<div class="campaign_request" style="word-break: normal;">${campaign.requirement }
				</div>
				</div>

				<div style="font-size:25px; padding : 10px 40px;"><b>업체 URL</b></div>
				<div class="prodname">${campaign.companyUrl }</div>
				<br>
				<div style="font-size:25px; padding : 10px 40px;"><b>콘텐츠 활용 안내</b></div>
				<div class="content">캠페인에 선정되어 작성한 인플루언서 콘텐츠는 회사와 광고주가 활용할 수 있습니다. <br>
				이를 원하지 않는 경우 캠패인을 취소하서나 이미 진행중인 경우 고객센터를 통해 문의해주세요.</div>
		</div>
		<br>
		<br>
		</div>
	<%@ include file="../include/footer.jsp" %>
</body>
<script>
	//스위치

	//스위치가 바뀌는지 이벤트 확인
	$("#toggle").change(function(){
	
		// checked 변수, 캠페인 no 저장
		var isChecked = $(this).is(':checked');
		var campaignNum = "${campaign.campaignNum}";
		$.ajax({
			url:'campaignDetail',
			type:'post',
			data:{
				campaignNum:campaignNum,
				status: isChecked ? '1':'0'
			},
			success:function(response){
				console.log(response);
			},
			error:function(err){
				console.log(err);
			}
		})
		if(isChecked){
			$("#recruit").text('모집중');
		}else{
			$("#recruit").text('모집완료');
		}
			
	})
		

	// 북마크
	$(function(){
		$('#book').click(function(){
			$.ajax({
				url:'bookmarkCampaign',
				type:'post',
				async:true,
				dataType:'text',
				data:{campaignNum:'${campaign.campaignNum}'},
				success:function(result){
					if(result=='true') {
						$('#book').attr('src','image/bookchecked.png');
					} else {
						$('#book').attr('src','image/book.png');
					}
				},
				error:function(err){
					console.log(err);
				}
			})
		})
	})
	$('#requestcampaign').click(function(){
		
		$.ajax({
			url:'receiveCampaign',
			type:'post',
			data:{
				campaignNum:${campaign.campaignNum},
				influencer:'${influencer.influencerNum}'
			},
			success:function(result){
				if(result=='false'){
					$("#requestcampaign").attr("value",'신청취소');
				}else{
					$("#requestcampaign").attr("value",'신청하기');
				}
			},
			error:function(err){
				console.log(err);
			}
		})
		
		
	})
	
	
</script>

</html>