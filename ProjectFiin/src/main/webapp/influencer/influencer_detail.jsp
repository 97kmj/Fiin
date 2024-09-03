<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/reset.css">
<link rel="stylesheet" href="../css/influencer_detail.css?ver=1">
</head>
<body>
<%@ include file="../include/header.jsp" %>
	<br>

		<div class="campaignaddress">
			<div>홈 >캠페인>비거너리어쩌구저쩌구 주소</div>
		</div>
		<br>
	
		<div class="productimg"  >
			<div class="img"><img src="인플루언서.png" style="width:380px;height:280px; border-radius:10px;"></div>
			<div class="imgtext">
				<div class="basic_info"><span><b>홍길동</b></span></div>
				<div class="basic_info"><b>활동 채널</b></div>
				<div class="chanimg">
					<div>
						<span class="channel_outline">
							&nbsp;<img src="img/유튜브로고.png" class="channel" ><a class="channel_font">유튜브</a> &nbsp;
						</span>
						<span class="channel_outline"  >
							&nbsp;<img src="img/인스타그램로고.png" class="channel" ><a class="channel_font">인스타그램</a>&nbsp;
						</span>
					</div>
				</div>
				<br>
	
				<div>	
					<span class="basic_info" ><b>컨텐츠 카테고리 </b>&nbsp;|&nbsp;</span><a class="subscribers_su" style="font-size : 25px; text-align: left;">식품</a>
				
				</div>
				<br>
				<div class="basic_info">
					<span class="subscribers_su"><b>구독자 수</b></span>&nbsp;&nbsp;|&nbsp;&nbsp;
					<span class="subscribers_su">100,000명</span>
				</div>
				<div>
		<!-- 			<div style="text-align: center;">
						<a href="signIn.jsp" type="button" class="basic_login" >로그인후 신청해주세요</a>
					</div> -->
					<div  class= "container">
							<img src="img/북마크.png" class="bookmark">
							<input type="button"  class="basic_btn" value = "신청하기">
					</div> 
				</div>
			</div>	
		</div>
	
		<br><br>
		
		<div>
			<div class="middletext"><img src="img/watch.png" style="width:25px;height:25px; border-radius:1px;"><b>일정정보</b></div>
			<div class="inp_date">캠페인 제안 가능 기간 2024-07-10~2024-08-14<br>
								 광고기간 2024-08-27 ~ 2024-10-10</div>
		</div>
		<br><br>
	<div class="middletext"><img src="img/information.png" style="width:25px;height:25px; border-radius:1px;"><b>기본정보</b></div>
	
		<div class="basic_info2">
		<br>
			<div style="font-size:25px; padding : 10px 40px;"><b>채널명</b></div>
			<div class="channel_style">홍길동TV</div>
			<br>
			<div style="font-size:25px; padding : 0px 40px 10px 40px;"><b>소개글</b></div>
				<div class="con_middle"> 
					<div class="Introduction" style="word-break: normal;"><br>
									내가 느낀 그를 향한 이끌림
									사랑이 아니기를 나는
									기도했었지
									나를 보는 안타까운 그 눈빛
									제발 나의 착각이길 바랬지
									지금이라도 피하고싶어
									오랫동안 친구의
									사랑이었던 그를
									하지만 이젠 너무나	
									간절히 원하는
									서로의 마음 속일순 없어
									그 사람 때문에
									많은걸 잃게 되겠지
									힘들때마다 기대온 우정까지
									하지만 어렵게 시작된
									우리 사랑은
									하늘만은 허락할거야
									그 마음을 받아들인 후부터
									나는 친구 얼굴을 바로 볼 수 없었지
									변해가는 사랑속에 얼마나
									아파하는지 알고 있었기에
									정말 미안해 날 용서해줘
									이런 얘긴 이제는 아무 소용 없지만
									그래도 나를 조금만
									이해해주겠니
									그 없인 나도 견딜수 없어
									이 사람 때문에
									많은걸 잃게 되겠지
									힘들때마다 기대온 우정까지
									하지만 어렵게 시작된
									우리 사랑은
									하늘만은 허락할거야
									우리를 위해서 흘려진
									눈물 기억해
									그만큼 소중히 아낄게
					</div>
				</div>
				<div style="font-size:25px; padding : 10px 40px;"><b>채널 URL</b></div>
				<div class="channel_style">www.naver.com</div>
				<div style="font-size:25px; padding : 10px 40px;"><b>콘텐츠 활용 안내</b></div>
				<div class="content">캠페인에 선정되어 작성한 인플루언서 콘텐츠는 회사와 광고주가 활용할 수 있습니다. <br>
				이를 원하지 않는 경우 캠패인을 취소하서나 이미 진행중인 경우 고객센터를 통해 문의해주세요.</div>
		</div>
		
<%@ include file="../include/footer.jsp" %>
</body>

</html>