<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Main Page</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/mypage_advertiser_requestedInfluencer.css?after">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css">


</head>
<body>
	<%@ include file="../include/header.jsp"%>

	<div class="mid">
		<%@ include file="../include/sidebar_advertiser.jsp"%>
		<div id="main">
			<h2 style="font-weight: bold; text-align: left">요청한 인플루언서 목록</h2>

			<div id="mainwrap">
				<div id="campaignwrap">
			<c:forEach items="${requestList }" var="request">
				<div class="request" id="${request.request_num }">
					<div class="campaign_name">
							<p style="font-weight: bold; width: 100%; text-overflow: ellipsis; white-space: nowrap; overflow: hidden;">${request.campaign_title }</p>
					</div>
					<div class="card">
					<div class="profile_img">
						<img src="image?file=${request.profile_image }" style="width:200px;height:200px;object-fit:cover;" onClick="location.href='influencerDetail?num=' + ${request.influencer_num}">
					</div>
					<div class="category" >
						<c:if test="${request.youtube ne null }">
							<%-- <c:out value="유튜브"/> --%>
							<img src="https://img.icons8.com/?size=25&id=19318&format=png&color=000000" onClick="window.open('${request.youtube_url}')"/>
						</c:if>
						<c:if test="${request.instagram ne null }">
							<%-- <c:out value="인스타그램"/> --%>
							<img src="https://img.icons8.com/?size=25&id=Xy10Jcu1L2Su&format=png&color=000000" onClick="window.open('${request.instagram_url}')"/>
				
						</c:if>
						<c:if test="${request.blog ne null }">
							<%-- <c:out value="블로그"/> --%>
							<img src="${pageContext.request.contextPath}/image/naver.png" style="width: 25px; height: 25px;" onClick="window.open('${request.blog_url}')"/>
						</c:if>&nbsp;|&nbsp;${categoryList.get(request.category_id-1).category_name }</div>
					<div class="nickname">${request.nickname }</div>

					<div class="subject">${request.intro_line }</div>
					<div class="status">${request.accept eq true ? '수락' : '대기중'}</div>
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
