<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/campaign_list.css?ver=1">
</head>
<body>
	<%@ include file="../include/header.jsp"%>
	<div class="container">
		<div id="categoryBar">
			<h2>인플루언서</h2>
			<div class="categoryWrap">
				<input type="radio" id="all" name="category" value="all"><label for="all">전체</label>
				<input type="radio" id="fasion" name="category" value="fasion"><label for="fasion">패션</label>
				 <input type="radio" id="beauty" name="category" value="beauty"><label for="beauty">뷰티</label>
			 	 <input type="radio" id="daily" name="category" value="daily"><label for="daily">생활용품</label>
				 <input type="radio" id="sport" name="category" value="sport"><label for="sport">스포츠</label>
				 <input type="radio" id="travel" name="category" value="travel"><label for="travel">여행/숙박</label>
				 <input type="radio" id="goodTaste" name="category" value="goodTaste"><label for="goodTaste">맛집</label>
			</div>
		</div>
		
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
		<div class="allBar">
			<h2></h2>
			<button id="registerButton" onclick="location.href='register.jsp'">캠페인 등록하기</button>
		</div>
		<div class="campaignWrap">
	 		<c:forEach items="${campaignList }" var="campaign">
	 			<div class="campaign_pick" id="pickNum1"
				onclick="location.href='campaign/campaign_detail.jsp'">
					<img src="${pageContext.request.contextPath}/image/campaign_img01.png" class="campaign_img">
					<div>${campaign.channel } | ${campaign.categoryId }</div>
					<div id="channelName">${campaign.companyName }</div>
					<div id="title">${campaign.productName }</div>
					<div>${campaign.adStartDate} ~ ${campaign.adEndDate}</div>
				</div>
			</c:forEach> 
		</div>
		<!-- 페이지 처리  -->
		<div style="text-align:center">
			<!-- 페이지 이전버튼 생성  -->
 			<c:choose>
				<c:when test="${pageInfo.curPage>1 }">
				 	<a href="campaignList?page=${pageInfo.curPage-1 }">&lt;</a>
				 </c:when>
				 <c:otherwise>
				 	<a>&lt;</a>
				 </c:otherwise>
			</c:choose>
			<!-- 페이지 가운데 숫자 버튼  생성  -->
			<c:forEach begin="${pageInfo.startPage }" end="${pageInfo.endPage }" var="i">
				<c:choose>
					<c:when test="${i eq pageInfo.curPage }">
						<a href="campaignList?page=${i}" class="select">${i }</a>
					</c:when>
					<c:otherwise>
						<a href="campaignList?page=${i}" class="btn">${i }</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			
			<!-- 페이지 다음버튼 생성  -->
			<c:choose>
				<c:when test="${pageInfo.curPage<pageInfo.allPage }">
					<a href="campaignList?page=${pageInfo.curPage+1 }">&gt;</a>
				</c:when>
				<c:otherwise>
					<a>&gt;</a>
				</c:otherwise>
			</c:choose>
    	</div>
    </div>

	<%@include file="../include/footer.jsp" %>
</body>
</html>