<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	<div class="topBar">
		<form id="filterform" action="influencerList" method="get" style="width: 680px">
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
					<label>
						<input type="checkbox" name="channel" value="instagram">
						<span>인스타그램</span>
					</label> 
					<label>
						<input type="checkbox" name="channel" value="blog">
						<span>블로그</span>
					</label>
					<label>
						<input type="checkbox" name="channel" value="youtube">
						<span>유튜브</span>
					</label>
				</div>
			</div>
		</form>
		<c:choose>
			<c:when test="${type eq 'influencer' }">
				<div class="allBar">
					<div class="search_btn_wrap">
						<div class="search">
							<form id="searchForm" action="influencerList" method="get">
							<input type="text" name="keyword" id="keyword" placeholder="채널명 및 인플루언서를 검색해주세요">
							<button type="button" id="searchButton">검색</button>
						</form>
						</div>
						<button id="registerButton" onclick="location.href='influencerRegister'">인플루언서 등록하기</button>
					</div>
				</div>
			</c:when>
			<c:otherwise>
						
				<div class="allBar">
					<div class="search_btn_wrap" style="margin-left: 170px">
						<div class="search">
							<form id="searchForm" action="influencerList" method="get">
							<input type="text" name="keyword" id="keyword" placeholder="채널명 및 인플루언서를 검색해주세요">
							<button type="button" id="searchButton">검색</button>
						</form>
						</div>
					</div>
				</div>
			
			</c:otherwise>
		</c:choose>
		</div>
		<div class="contents_wrap">
		
			<div class="influencerWrap" >
				<c:if test="${empty influencerList}">
					<div class="emptyList">인플루언서 목록이 없습니다.</div>
				</c:if>
				<c:forEach items="${influencerList}" var="showinfluencer">
					<div class="influencer_pick" id="pickNum1" OnClick="location.href='influencerDetail?num=' + ${showinfluencer.influencer_num}">
						<c:if test="${showinfluencer.profile_image ne null }">

						<img src="image?file=${showinfluencer.profile_image }" class="influencer_img" style="width:100%;height:250px;object-fit:cover">
						</c:if>
						<div>
							
							<c:if test="${showinfluencer.youtube ne null }">
								<%-- <c:out value="유튜브"/> --%>
								<img src="https://img.icons8.com/?size=25&id=19318&format=png&color=000000">
							</c:if>
							
							
							<c:if test="${showinfluencer.instagram ne null }">
								<%-- <c:out value="인스타그램"/> --%>
								<img src="https://img.icons8.com/?size=25&id=Xy10Jcu1L2Su&format=png&color=000000">
							</c:if>
							
							
							<c:if test="${showinfluencer.blog ne null }">
								<%-- <c:out value="블로그"/> --%>
								<img src="${pageContext.request.contextPath}/image/naver.png" style="width: 25px; height: 25px;"/>
							</c:if>
							
						</div>
						 ${showinfluencer.category_name }
						
						<div id="channelName">
						${showinfluencer.channel_name }
<%--  							<c:if test="${showinfluencer.youtube_name ne null }">
								${showinfluencer.youtube_name }
							</c:if>
							 <c:if test="${showinfluencer.instagram_name ne null }">
								${showinfluencer.instagram_name }
							</c:if> 
							<c:if test="${showinfluencer.blog_name ne null }">
								${showinfluencer.blog_name }
							</c:if> --%>

						</div>
						<div id="title">${showinfluencer.intro_line }</div>
						<div id="subscriber">
		
<%-- 							<c:set var = "totalFollowers" value="0"/>
							<c:if test="${showinfluencer.youtube_follower != null }">
							<c:set var="totalFollowers" value="${totalFollowers + showinfluencer.youtube_follower }"/>
							</c:if>
							<c:if test="${showinfluencer.instagram_follower != null }">
							<c:set var="totalFollowers" value="${totalFollowers + showinfluencer.instagram_follower }"/>
							</c:if>
							<c:if test="${showinfluencer.blog_follower != null }">
							<c:set var="totalFollowers" value="${totalFollowers + showinfluencer.blog_follower }"/>
							</c:if>
							총 팔로워 수 : <fmt:formatNumber value="${totalFollowers }" type="number" pattern="#,###"/>명 --%>
						
						
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	<!-- 페이지 처리  -->
		<div class="pageDiv" style="text-align:center">
			<ul class='pagination'>
			
			<!-- 페이지 이전버튼 생성  -->
 			<c:choose>
				<c:when test="${pageInfo.curPage>1 }">
				 	<li><a href="#" data-page="${pageInfo.curPage-1 }" class="arrow left">
				 	<img src="https://img.icons8.com/?size=100&id=x3s0mSWBMJTc&format=png&color=939393" style="weight: 20px; height: 20px">
				 	</a></li>
				 </c:when>
				 <c:otherwise>
				 </c:otherwise>
			</c:choose>
			<!-- 페이지 가운데 숫자 버튼  생성  -->
			<c:forEach begin="${pageInfo.startPage }" end="${pageInfo.endPage }" var="i">
				<c:choose>
					<c:when test="${i eq pageInfo.curPage }">
						<li><a href="#" class="select num" data-page="${i }">${i }</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="#" class="btn num" data-page="${i }">${i }</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			
			<!-- 페이지 다음버튼 생성  -->
			<c:choose>
				<c:when test="${pageInfo.curPage<pageInfo.allPage }">
					<li><a href="#" data-page="${pageInfo.curPage+1 }" class="arrow right">
					<img src="https://img.icons8.com/?size=100&id=IGZk6vp3nxFm&format=png&color=939393"	style="weight: 20px; height: 20px">
					</a></li>
				</c:when>
				<c:otherwise>
				</c:otherwise>
			</c:choose>
			</ul>
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