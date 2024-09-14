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
					<c:forEach var="ibookmarkList" items="${bookmarkList }">
						<div class="bookmark_pick" id="pickNum1"
							onclick="location.href='influencer_detail.jsp'">
							<c:if test="${ibookmarkList.profileImage ne null  }">
								<img src="image?file=${ibookmarkList.profileImage }"
									style="width: 200px; height: 270px; border-radius: 20px">
							</c:if>
							<div>
								<c:if test="${ibookmarkList.youtube ne null }">
									<c:out value="유튜브" />
								</c:if>
								<c:if test="${ibookmarkList.instagram ne null }">
									<c:out value="인스타그램" />
								</c:if>
								<c:if test="${ibookmarkList.blog ne null }">
									<c:out value="블로그" />
								</c:if>
								<br> ${ibookmarkList.categoryId }
							</div>
							<div id="channel_name">
								<c:if test="${ibookmarkList.youtubeName ne null }">
								${ibookmarkList.youtubeName }
							</c:if>
								<c:if test="${ibookmarkList.instagramName ne null }">
								${ibookmarkList.instagramName }
							</c:if>
								<c:if test="${ibookmarkList.blogName ne null }">
								${ibookmarkList.blogName }
							</c:if>
							</div>
							<div id="introduce">${ibookmarkList.introLine }</div>
							<div>
								<c:set var="totalFollowers" value="0" />
								<c:if test="${ibookmarkList.youtubeFollower != null }">
									<c:set var="totalFollowers"
										value="${totalFollowers + ibookmarkList.youtubeFollower }" />
								</c:if>
								<c:if test="${ibookmarkList.instagramFollower != null }">
									<c:set var="totalFollowers"
										value="${totalFollowers + ibookmarkList.instagramFollower }" />
								</c:if>
								<c:if test="${ibookmarkList.blogFollower != null }">
									<c:set var="totalFollowers"
										value="${totalFollowers + ibookmarkList.blogFollower }" />
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