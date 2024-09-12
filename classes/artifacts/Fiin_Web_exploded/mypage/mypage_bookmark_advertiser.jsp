<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bookmark.css?ver=1">
</head>
<body>
	<%@ include file="../include/header.jsp" %>
	<div class="container">
		<%@ include file="../include/sidebar_advertiser.jsp" %>
		
		<div class="contents_wrap">
			<h2>북마크 관리</h2>
			<div class=bookmark_wrap>
				<h3>북마크한 인플루언서</h3>
				<div class="bookmark_list">
					<div class="bookmark_pick" id="pickNum1"
						onclick="location.href='influencer_detail.jsp'">
						<img src="${pageContext.request.contextPath}/image/inf.png"
							style="width: 200px; height: 270px; border-radius: 20px">
						<div>뷰티|패션</div>
						<div id="channel_name">채널명</div>
						<div id="introduce">직장인의 데일리룩 올리는 블로거</div>
						<div>구독자 수 8,000명</div>
					</div>
					<div class="bookmark_pick" id="pickNum2"
						onclick="location.href='influencer_detail.jsp'">
						<img src="${pageContext.request.contextPath}/image/inf.png"
							style="width: 200px; height: 270px; border-radius: 20px">
						<div>뷰티|패션</div>
						<div id="channel_name">채널명</div>
						<div id="introduce">직장인의 데일리룩 올리는 블로거</div>
						<div>구독자 수 8,000명</div>
					</div>
					<div class="bookmark_pick" id="pickNum3">
						<img src="${pageContext.request.contextPath}/image/inf.png"
							style="width: 200px; height: 270px; border-radius: 20px">
						<div>뷰티|패션</div>
						<div id="channel_name">채널명</div>
						<div id="introduce">직장인의 데일리룩 올리는 블로거</div>
						<div>구독자 수 8,000명</div>
					</div>
					<div class="bookmark_pick" id="pickNum4">
						<img src="${pageContext.request.contextPath}/image/inf.png"
							style="width: 200px; height: 270px; border-radius: 20px">
						<div>뷰티|패션</div>
						<div id="channel_name">채널명</div>
						<div id="introduce">직장인의 데일리룩 올리는 블로거</div>
						<div>구독자 수 8,000명</div>
					</div>
					<div class="bookmark_pick" id="pickNum5">
						<img src="${pageContext.request.contextPath}/image/inf.png"
							style="width: 200px; height: 270px; border-radius: 20px">
						<div>뷰티|패션</div>
						<div id="channel_name">채널명</div>
						<div id="introduce">직장인의 데일리룩 올리는 블로거</div>
						<div>구독자 수 8,000명</div>
					</div>
					<div class="bookmark_pick" id="pickNum6">
						<img src="${pageContext.request.contextPath}/image/inf.png"
							style="width: 200px; height: 270px; border-radius: 20px">
						<div>뷰티|패션</div>
						<div id="channel_name">채널명</div>
						<div id="introduce">직장인의 데일리룩 올리는 블로거</div>
						<div>구독자 수 8,000명</div>
					</div>	
				</div>
			</div>
		</div>
	</div>
	<%@ include file="../include/footer.jsp" %>
</body>
</html>