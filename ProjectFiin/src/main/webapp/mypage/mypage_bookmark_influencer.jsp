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
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bookmark.css">
</head>
<body>
	<%@ include file="../include/header.jsp"%>
	<div class="container">
		<%@ include file="../include/sidebar_influencer.jsp" %>

		<div class="contents_wrap">
			<h2>북마크 관리</h2>
			<div class=bookmark_wrap>
				<h3>북마크한 캠페인</h3>
				<div class="bookmark_list">
					<c:forEach var="cbookmark" items="${cbookmarkList }">
						<div class="bookmark_pick" id="pickNum1"
							OnClick="location.href='influencerDetail?num=' + ${ibookmark.influencer_num}">
							<c:if test="${cbookmark.image ne null }">
								<img src="image?file=${cbookmark.image }"
									style="width: 200px; height: 270px; border-radius: 20px; margin-bottom: 10px; object-fit: fill">
							</c:if>
							<div>${cbookmark.CHANNEL } | ${cbookmark.category_name }</div>
							<div id="channel_name">
								<c:if test="${cbookmark.company_name ne null }">
								${cbookmark.company_name }
							</c:if>
							</div>
							<div id="introduce">
								<c:if test="${cbookmark.campaign_title ne null }">
								${cbookmark.campaign_title }
							</c:if>
							</div>
							<div>
								<c:if test="${cbookmark.ad_start_date ne null }">
									<fmt:formatDate value="${cbookmark.ad_start_date }"
										pattern="yyyy-MM-dd" />~<fmt:formatDate
										value="${cbookmark.ad_end_date }" pattern="yyyy-MM-dd" />
								</c:if>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="../include/footer.jsp" %>
</body>
</html>