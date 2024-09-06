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
	href="${pageContext.request.contextPath}/css/influencer_list.css?ver=1">
<script src="http://code.jquery.com//jquery-latest.min.js"></script>
</head>
<body>
	<%@ include file="../include/header.jsp"%>
	<div class="container">
		<div id="categoryBar">
			<!-- javascript -->
			<h2>인플루언서</h2>
			<div class="categoryWrap">
				<input type="radio" id="all" name="category" checked><a
					href="0">전체</a> <input type="radio" id="fasion" name="category"><a
					href="2">패션</a> <input type="radio" id="beauty" name="category"><a
					href="1">뷰티</a> <input type="radio" id="daily" name="category"><a
					href="6">생활용품</a> <input type="radio" id="sport" name="category"><a
					href="3">스포츠</a> <input type="radio" id="travel" name="category"><a
					href="4">여행/숙박</a> <input type="radio" id="goodTaste"
					name="category"><a href="5">맛집</a>
			</div>
		</div>
		<form id="categoryform" action="influencerList" method="get">
			<input type="hidden" name="categoryId">
		</form>

		<!-- 채널, 검색 jstl 수정해야함 -->
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
		<div class="contents_wrap">
			<div class="allBar">
				<h2>전체</h2>
				<div class="search_btn_wrap">
					<div class="search">
						<input type="text" placeholder="검색">
						<button type="button" id="searchButton">검색</button>
					</div>
					<button id="registerButton" onclick="location.href='register.jsp'">인플루언서
						등록하기</button>
				</div>
			</div>
			<div class="influencerWrap">
				<c:forEach items="${influnencerList }" var="influencer">
					<div class="influencer_pick" id="pickNum1"
						onclick="location.href='influencerDetail.jsp'">
						<img
							src="${pageContext.request.contextPath}/image/influencer_img01.png"
							class="influencer_img">
						<div>${influencer.channel }|${influencer.categoryId }</div>
						<div id="channelName">
							<c:if test="${influencer.youtube_name ne null }">
								${influencer.youtube_name }&nbsp;
							</c:if>
							<c:if test="${influencer.instagram_name ne null }">
								${influencer.instagram_name }&nbsp;
							</c:if>
							<c:if test="${influencer.blog_name ne null }">
								${influencer.blog_name }
							</c:if>
						</div>
						<div id="title">${influencer.intro_line }</div>
						<div id="subscriber">
							<c:if test="${influencer.youtube_follower }">
								${influencer.youtube_follwer }
							</c:if>
							<c:if test="${influencer.instagram_follower }">
								${influencer.instagram_follower }
							</c:if>
							<c:if test="${influecner.blog_follower }">
								${influencer.blog_follower }
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
</html>