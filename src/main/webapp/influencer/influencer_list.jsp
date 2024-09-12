<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/influencer_list.css?after">
<script src="http://code.jquery.com//jquery-latest.min.js"></script>
</head>
<body>
	<%@ include file="../include/header.jsp"%>
	<div class="container">
		<form id="filterform" action="influencerList" method="get">
			<input type="hidden" name="page" value="1" id="page"/>
			<div id="categoryBar">
				<h2>인플루언서</h2>
				<div class="categoryWrap">
					<input type="radio" id="all" name="category" value="0" checked><a href="0">전체</a> 
					<input type="radio" id="fasion" name="category" value="2"><a href="2">패션</a>
					<input type="radio" id="beauty" name="category" value="1"><a href="1">뷰티</a> 
					<input type="radio" id="daily" name="category" value="6"><a href="6">생활용품</a> 
					<input type="radio" id="sport" name="category" value="3"><a href="3">스포츠</a> 
					<input type="radio" id="travel" name="category" value="4"><a href="4">여행/숙박</a>
					<input type="radio" id="goodTaste" name="category" value="5"><a href="5">식품</a>
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
				<c:forEach items="${influencerList}" var="showinfluencer">
					<div class="influencer_pick" id="pickNum1">
						<c:if test="${showinfluencer.profile_image ne null }">
						<a href="influencerDetail?num=${showinfluencer.influencer_num }">
						<img src="image?file=${showinfluencer.profile_image }" class="influencer_img">
						</a>
						</c:if>
						<div>
						<c:if test="${showinfluencer.youtube ne null }">
								<c:out value="유튜브"/>
						</c:if>
						<c:if test="${showinfluencer.instagram ne null }">
							<c:out value="인스타그램"/>
						</c:if>
						<c:if test="${showinfluencer.blog ne null }">
							<c:out value="블로그"/>
						</c:if>
						<br> 
						 ${showinfluencer.category_name }
						</div>
						
						<div id="channelName">
 							<c:if test="${showinfluencer.youtube_name ne null }">
								${showinfluencer.youtube_name }
							</c:if>
							 <c:if test="${showinfluencer.instagram_name ne null }">
								${showinfluencer.instagram_name }
							</c:if> 
							<c:if test="${showinfluencer.blog_name ne null }">
								${showinfluencer.blog_name }
							</c:if>

						</div>
						<div id="title">${showinfluencer.intro_line }</div>
						<div id="subscriber">
							<c:if test="${showinfluencer.youtube_follower != null }">
								${showinfluencer.youtube_follower }명
							</c:if>
							<c:if test="${showinfluencer.instagram_follower != null }">
								${showinfluencer.instagram_follower }명
							</c:if>
							<c:if test="${showinfluecner.blog_follower != null }">
								${showinfluencer.blog_follower }명
							</c:if>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	<!-- paging처리 -->
	<div class="pageDiv" style="text-align: center">
		<!-- 페이지 이전버튼 생성 -->
		<c:choose>
			<c:when test="${pageInfo.curPage>1 }">
				<a href="#" data-page="{pageInfo.curPage-1}">&lt;</a>
			</c:when>
			<c:otherwise>
				<a>&lt;</a>
			</c:otherwise>
		</c:choose>
		<!-- 페이지 가운데 숫자 버튼 생성 -->
		<c:forEach begin="${pageInfo.startPage }" end="${pageInfo.endPage }" var="i">
			<c:choose>
				<c:when test="${i eq pageInfo.curPage }">
					<a href="#" class="select" data-page="${i }">${i }</a>
				</c:when>
				<c:otherwise>
					<a href="#" class="btn" data-page="${i }">${i }</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		
		<!-- 페이지 다음버튼 생성 -->
		<c:choose>
			<c:when test="${pageInfo.curPage<pageInfo.allPage }">
				<a href="#" data-page="${pageInfo.curPage+1 }">&gt;</a>
			</c:when>
			<c:otherwise>
				<a>&gt;</a>
			</c:otherwise>
		</c:choose>
	</div>
	<%@include file="../include/footer.jsp"%>
</body>

<script>

	$(".pageDiv a").click(function(e) {
		e.preventDefault();
		$("#page").val($(this).data("page"));
		$("#filterform").submit();
	})

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
		let param = $("#keyword").val();
		$("#searchForm").submit();
	})

</script>

</html>