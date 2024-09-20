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
					<c:forEach var="ibookmark" items="${ibookmarkList }">
						<div class="bookmark_pick" id="pickNum1"
							OnClick="location.href='influencerDetail?num=' + ${ibookmark.influencer_num}">
							<c:if test="${ibookmark.profile_image ne null  }">
								<img src="image?file=${ibookmark.profile_image }"
									style="width: 200px; height: 270px; border-radius: 20px">
							</c:if>
							<div>
								<c:if test="${ibookmark.youtube ne null }">
									<img src="https://img.icons8.com/?size=25&id=19318&format=png&color=000000">
								</c:if>
								<c:if test="${ibookmark.instagram ne null }">
									<img src="https://img.icons8.com/?size=25&id=Xy10Jcu1L2Su&format=png&color=000000">
								</c:if>
								<c:if test="${ibookmark.blog ne null }">
									<img src="${pageContext.request.contextPath}/image/naver.png" style="width: 25px; height: 25px;"/>
								</c:if>
								<br>
								 ${ibookmark.category_name }
							</div>
							<div id="channel_name">
								${ibookmark.nickname }
							</div>
							<div id="introduce">${ibookmark.intro_line }</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="../include/footer.jsp"%>
</body>
</html>