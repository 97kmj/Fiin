<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/reset.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/influencer_list.css?after">
<script src="http://code.jquery.com//jquery-latest.min.js"></script>
</head>
<body>
	<%@ include file="../include/header.jsp"%>
	<div class="container">
		<form id="filterform" action="influencerList" method="get">
			<div id="categoryBar">
				<h2>인플루언서</h2>
				<div class="categoryWrap">
					<input type="radio" id="all" name="category" value="0" checked><a href="0">전체</a> 
					<input type="radio" id="fasion" name="category" value="2"><a href="2">패션</a>
					<input type="radio" id="beauty" name="category" value="1"><a href="1">뷰티</a> 
					<input type="radio" id="daily" name="category" value="6"><a href="6">생활용품</a> 
					<input type="radio" id="sport" name="category" value="3"><a href="3">스포츠</a> 
					<input type="radio" id="travel" name="category" value="4"><a href="4">여행/숙박</a>
					<input type="radio" id="goodTaste" name="category" value="5"><a href="5">맛집</a>
				</div>
			</div>

			<hr style="border: 1px solid #e5e5e5; width: 1200px; margin: 12px 0;">
			<div class="channelBar">
				<h2>채널</h2>
				<div class="channelButton">
					<label><input type="checkbox" name="channel" value="instagram"> <span>인스타그램</span></label> 
					<label><input type="checkbox" name="channel" value="blog"><span>블로그</span></label>
					<label><input type="checkbox" name="channel" value="youtube"><span>유튜브</span></label>
				</div>
			</div>
		</form>
		<div class="contents_wrap">

			<div class="allBar">
				<h2>전체</h2>
				<div class="search_btn_wrap">
					<div class="search">
						<form id="searchForm" action="influencerList" method="get">
						<input type="text" name="keyword" id="keyword" placeholder="채널명 및 인플루언서를 검색해주세요">
						<button type="button" id="searchButton">검색</button>
						</form>
					</div>
					<button id="registerButton"
						onclick="location.href='influencer_register.jsp'">인플루언서
						등록하기</button>
				</div>
			</div>
			<div class="influencerWrap">
				<c:forEach items="${influencerList}" var="influencer">
					<div class="influencer_pick" id="pickNum1">
						<img
							src="${pageContext.request.contextPath}/image/influencer_img01.png"
							class="influencer_img">
						<div>${influencer.youtube }|${influencer.categoryId }</div>
						<div id="channelName">
							<a href="influecerDetail?num=${influencerNum }"> <c:if
									test="${influencer.youtubeName ne null }">
								${influencer.youtubeName }
							</c:if> <c:if test="${influencer.instagramName ne null }">
								${influencer.instagramName }
							</c:if> <c:if test="${influencer.blogName ne null }">
								${influencer.blogName }
							</c:if>
							</a>
						</div>
						<div id="title">${influencer.introLine }</div>
						<div id="subscriber">
							<c:if test="${influencer.youtubeFollower != null }">
								${influencer.youtubeFollower }
							</c:if>
							<c:if test="${influencer.instagramFollower != null }">
								${influencer.instagramFollower }
							</c:if>
							<c:if test="${influecner.blogFollower != null }">
								${influencer.blogFollower }
							</c:if>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	<!-- paging처리 -->
	<div class="paging">
		<c:choose>
			<c:when test="${pageInfo.curPage>1 }">
				<a href="influencerList?page=${pageInfo.curPage-1 }">&lt;</a>
			</c:when>
			<c:otherwise>
				<a>&lt;</a>
			</c:otherwise>
		</c:choose>
		<c:forEach begin="${pageInfo.startPage }" end="${pageInfo.endPage }"
			var="i">
			<c:choose>
				<c:when test="${i eq pageInfo.curPage }">
					<a href="influencerList?page=${i }" class="select">${i }</a>
				</c:when>
				<c:otherwise>
					<a href="influencerList?page=${i }" class="btn">${i }</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:choose>
			<c:when test="${pageInfo.curPage<pageInfo.allPage }">
				<a href="influencerList?page=${pageInfo.curPage+1 }">&gt;</a>
			</c:when>
			<c:otherwise>
				<a>&gt;</a>
			</c:otherwise>
		</c:choose>
	</div>
	<%@include file="../include/footer.jsp"%>
</body>

<script>
	$(".categoryWrap a").click(function(e) {
		e.preventDefault();
		$(this).prev().click();
		$("#filterform").submit();
	})
	$(".channelButton input").click(function(e) {
		e.preventDefault();
		$(this).prev().click();
		$("#filterform").submit();
	})

	var channels = `${channels}`;

	let channelChecks = document.querySelectorAll("input[name='channel']");
	channelChecks.forEach(function(item) {
		if (channels.includes(item.value)) {
			item.checked = true;
		}
	})
	var category = `${category}`;
	let categoryList = document.querySelectorAll("input[name='category']");
	categoryList.forEach(function(item) {
		if (item.value == category) {
			item.checked = true;
		}
	})
	$("#searchButton").click(function(e) {
		$("#searchForm").submit();
	})
</script>

</html>