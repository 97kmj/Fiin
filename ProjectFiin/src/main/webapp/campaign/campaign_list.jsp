<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/campaign_list.css?ver=1">
</head>
<body>
	<%@ include file="../include/header.jsp"%>
	<div class="container">
		<div id="categoryBar">
			<!-- javascript -->
			<h2>인플루언서</h2>
			<div class="categoryWrap">
				<input type="radio" id="all" name="category" value="all"><label for="all">전체</label>
				<input type="radio" id="fasion" name="category" value="fasion"><label for="fasion">패션</label>
				 <input type="radio" id="beauty" name="category" value="beauty"><label for="beauty">뷰티</label>
			 	 <input type="radio" id="daily" name="category" value="daily"><label for="daily">생활용품</label>
				 <input type="radio" id="sport" name="category" value="sport"><label for="sport">스포츠</label>
				 <input type="radio" id="travel" name="category" value="travel"><label for="travel">여행/숙박</label>
				 <input type="radio" id="goodTaste" name="category" value="goodTaste"><label for="goodTaste">맛집</label>
			</div>
		</div>
		
		<hr style="border: 1px solid #e5e5e5; width: 1200px; margin: 12px 0;">
		
		<div class="channelBar">
			<h2>채널</h2>
			<div class="channelButton">
				<label> <input type="checkbox" name="instagram"
					value="instagram"> <span>인스타그램</span>
				</label> <label> <input type="checkbox" name="blog" value="blog">
					<span>블로그</span>
				</label> <label> <input type="checkbox" name="youtube"
					value="youtube"> <span>유튜브</span>
				</label>
			</div>
		</div>
		<div class="allBar">
			<h2>전체</h2>
			<button id="registerButton" onclick="location.href='register.jsp'">캠페인 등록하기</button>
		</div>
		<div class="campaignWrap">
			<div class="campaign_pick" id="pickNum1"
				onclick="location.href='campaign_detail.jsp'">
				<img src="${pageContext.request.contextPath}/image/campaign_img01.png" class="campaign_img">
				<div>인스타그램 | 패션</div>
				<div id="channelName">히든클리프</div>
				<div id="title">[24-8]제주 히든클리프 호텔</div>
				<div>2024-07-29 ~ 2024-08-05</div>
			</div>
			<div class="campaign_pick" id="pickNum2"
				onclick="location.href='campaign_detail.jsp'">
				<img src="${pageContext.request.contextPath}/image/campaign_img01.png" class="campaign_img">
				<div>인스타그램 | 패션</div>
				<div id="channelName">히든클리프</div>
				<div id="title">[24-8]제주 히든클리프 호텔</div>
				<div>2024-07-29 ~ 2024-08-05</div>
			</div>
			<div class="campaign_pick" id="pickNum3"
				onclick="location.href='campaign_detail.jsp'">
				<img src="${pageContext.request.contextPath}/image/campaign_img01.png" class="campaign_img">
				<div>인스타그램 | 패션</div>
				<div id="channelName">히든클리프</div>
				<div id="title">[24-8]제주 히든클리프 호텔</div>
				<div>2024-07-29 ~ 2024-08-05</div>
			</div>
			<div class="campaign_pick" id="pickNum4"
				onclick="location.href='campaign_detail.jsp'">
				<img src="${pageContext.request.contextPath}/image/campaign_img01.png" class="campaign_img">
				<div>인스타그램 | 패션</div>
				<div id="channelName">히든클리프</div>
				<div id="title">[24-8]제주 히든클리프 호텔</div>
				<div>2024-07-29 ~ 2024-08-05</div>
			</div>
			<div class="campaign_pick" id="pickNum5"
				onclick="location.href='campaign_detail.jsp'">
				<img src="${pageContext.request.contextPath}/image/campaign_img01.png" class="campaign_img">
				<div>인스타그램 | 패션</div>
				<div id="channelName">히든클리프</div>
				<div id="title">[24-8]제주 히든클리프 호텔</div>
				<div>2024-07-29 ~ 2024-08-05</div>
			</div>
			<div class="campaign_pick" id="pickNum6"
				onclick="location.href='campaign_detail.jsp'">
				<img src="${pageContext.request.contextPath}/image/campaign_img01.png" class="campaign_img">
				<div>인스타그램 | 패션</div>
				<div id="channelName">히든클리프</div>
				<div id="title">[24-8]제주 히든클리프 호텔</div>
				<div>2024-07-29 ~ 2024-08-05</div>
			</div>
			<div class="campaign_pick" id="pickNum7"
				onclick="location.href='campaign_detail.jsp'">
				<img src="${pageContext.request.contextPath}/image/campaign_img01.png" class="campaign_img">
				<div>인스타그램 | 패션</div>
				<div id="channelName">히든클리프</div>
				<div id="title">[24-8]제주 히든클리프 호텔</div>
				<div>2024-07-29 ~ 2024-08-05</div>
			</div>
			<div class="campaign_pick" id="pickNum8"
				onclick="location.href='campaign_detail.jsp'">
				<img src="${pageContext.request.contextPath}/image/campaign_img01.png" class="campaign_img">
				<div>인스타그램 | 패션</div>
				<div id="channelName">히든클리프</div>
				<div id="title">[24-8]제주 히든클리프 호텔</div>
				<div>2024-07-29 ~ 2024-08-05</div>
			</div>
		</div>
			<div class="page">
		        <ul class="pagination">
		            <li> <a href="#" class="arrow left"><img src="https://img.icons8.com/?size=100&id=x3s0mSWBMJTc&format=png&color=939393" style="weight:20px;height:20px"></a></li>
		            <li> <a href="#" class="active num">1</a></li>
		            <li> <a href="#" class="num">2</a></li>
		            <li> <a href="#" class="num">3</a></li>
		            <li> <a href="#" class="num">4</a></li>
		            <li> <a href="#" class="arrow right"><img src="https://img.icons8.com/?size=100&id=IGZk6vp3nxFm&format=png&color=939393" style="weight:20px;height:20px"></a></li>
	        	</ul>
	    	</div>
    	</div>
	</div>
	<%@include file="../include/footer.jsp" %>
</body>
</html>