<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	href="${pageContext.request.contextPath}/css/bookmark.css?ver=1">
</head>
<body>
	<%@ include file="../include/header.jsp"%>
	<div class="container">
		<%@ include file="../include/sidebar_advertiser.jsp"%>

		<div class="contents_wrap">
			<h2>북마크 관리</h2>
			<div class=bookmark_wrap>
				<h3>북마크한 인플루언서</h3>
				<div class="bookmark_list">
					<c:forEach var="bookmarkInfluencer" items="${bookmarkInfluencer }">
						<div class="bookmark_pick" id="pickNum1"
							onclick="location.href='influencer_detail.jsp'">
							<c:if test="${bookmarkInfluencer.profile_image ne null  }">
								<img src="image?file=${bookmarkInfluencer.profile_image }"
									style="width: 200px; height: 270px; border-radius: 20px">
							</c:if>
							<div>
								<c:if test="${bookmarkInfluencer.youtube ne null }">
									<c:out value="유튜브" />
								</c:if>
								<c:if test="${bookmarkInfluencer.instagram ne null }">
									<c:out value="인스타그램" />
								</c:if>
								<c:if test="${bookmarkInfluencer.blog ne null }">
									<c:out value="블로그" />
								</c:if>
								<br> ${bookmarkInfluencer.category_name }
							</div>
							<div id="channel_name">
								<c:if test="${bookmarkInfluencer.youtube_name ne null }">
								${bookmarkInfluencer.youtube_name }
							</c:if>
								<c:if test="${bookmarkInfluencer.instagram_name ne null }">
								${bookmarkInfluencer.instagram_name }
							</c:if>
								<c:if test="${bookmarkInfluencer.blog_name ne null }">
								${bookmarkInfluencer.blog_name }
							</c:if>
							</div>
							<div id="introduce">${bookmarkInfluencer.intro_line }</div>
							<div>
								<c:set var="totalFollowers" value="0" />
								<c:if test="${bookmarkInfluencer.youtube_follower != null }">
									<c:set var="totalFollowers"
										value="${totalFollowers + bookmarkInfluencer.youtube_follower }" />
								</c:if>
								<c:if test="${bookmarkInfluencer.instagram_follower != null }">
									<c:set var="totalFollowers"
										value="${totalFollowers + bookmarkInfluencer.instagram_follower }" />
								</c:if>
								<c:if test="${bookmarkInfluencer.blog_follower != null }">
									<c:set var="totalFollowers"
										value="${totalFollowers + bookmarkInfluencer.blog_follower }" />
								</c:if>
								총 팔로워 수 : ${totalFollowers }명
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="../include/footer.jsp"%>
</body>
</html>