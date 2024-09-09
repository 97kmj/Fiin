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
			<h2>인플루언서</h2>
			<div class="categoryWrap">
				<input type="radio" id="all" name="category" value="0" checked
					onclick="submitForm()"> <label for="all">전체</label> <input
					type="radio" id="fasion" name="category" value="2"
					onclick="submitForm()"> <label for="fasion">패션</label> <input
					type="radio" id="beauty" name="category" value="1"
					onclick="submitForm()"> <label for="beauty">뷰티</label> <input
					type="radio" id="daily" name="category" value="6"
					onclick="submitForm()"> <label for="daily">생활용품</label> <input
					type="radio" id="sport" name="category" value="3"
					onclick="submitForm()"> <label for="sport">스포츠</label> <input
					type="radio" id="travel" name="category" value="4"
					onclick="submitForm()"> <label for="travel">여행/숙박</label> <input
					type="radio" id="goodTaste" name="category" value="5"
					onclick="submitForm()"> <label for="goodTaste">맛집</label>
			</div>
		</div>

		<form id="categoryform" action="InfluencerList" method="get">
			<input type="hidden" name="categoryId" id="categoryId">
		</form>


		<hr style="border: 1px solid #e5e5e5; width: 1200px; margin: 12px 0;">
		<form id="filterForm" action="InfluencerList" method="get">
			<div class="channelBar">
				<h2>채널</h2>
				<div class="channelButton">
					<label> <input type="checkbox" name="channel"
						value="instagram" onchange="submitForm()"> <span>인스타그램</span></label>
					<label> <input type="checkbox" name="channel" value="blog"
						onchange="submitForm()"><span>블로그</span></label><label> <input
						type="checkbox" name="channel" value="youtube"
						onchange="submitForm()"><span>유튜브</span></label>
				</div>
			</div>
		</form>
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

	<script>
		function submitForm() {
			const selectedCategory = document
					.querySelector('input[name="category"]:checked').value;
			document.getElementById('categoryId').value = selectedCategory;
			
			document.getElementById('categoryform').submit();
			document.getElementById('filterForm').submit();
		}
	</script>

	<%@include file="../include/footer.jsp"%>
</body>
</html>