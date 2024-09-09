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
<link rel="stylesheet" href="<c:url value='/css/campaign_list.css'/>"/>

<script src="http://code.jquery.com//jquery-latest.min.js"></script>
</head>
<body>
	<%@ include file="../include/header.jsp"%>
	<div class="container">
		<form id="filterform" action="campaignList" method="get">
		<div id="categoryBar">
			<h2>카테고리</h2>
			<div class="categoryWrap">
				 <input type="radio" id="category" name="category" checked value="0"><a href="0">전체</a>&nbsp;&nbsp;&nbsp;
				 <input type="radio" id="category" name="category" value="2"><a href="2">패션</a>&nbsp;&nbsp;&nbsp;
			 	 <input type="radio" id="category" name="category"  value="6"><a href="6">생활용품</a>&nbsp;&nbsp;&nbsp;
				 <input type="radio" id="category" name="category" value="3"><a href="3">스포츠</a>&nbsp;&nbsp;&nbsp;
				 <input type="radio" id="category" name="category" value="4"><a href="4">여행/숙박</a>&nbsp;&nbsp;&nbsp;
				 <input type="radio" id="category" name="category" value="5"><a href="5">맛집</a>&nbsp;&nbsp;&nbsp;
			</div>
		</div>
		<hr style="border: 1px solid #e5e5e5; width: 1200px; margin: 12px 0;">
		
		<div class="channelBar">
			<h2>채널</h2>
			<div class="channelButton">
				<label><input type="checkbox" name="channel" value="instagram">
					<span>인스타그램</span>
				</label> 
				<label><input type="checkbox" name="channel" value="blog">
					<span>블로그</span>
				</label>
				<label><input type="checkbox" name="channel" value="youtube">
					<span>유튜브</span>
				</label>
			</div>
		</div>
		</form>
		
		<div class="allBar">
			<h2></h2>
			<button id="registerButton" onclick="location.href='campaign/campaign_register.jsp'">캠페인 등록하기</button>
		</div>
		<div class="campaignWrap" style="justify-content:left">
	 		<c:forEach items="${campaignList }" var="campaign">
	 			<div class="campaign_pick" id="pickNum1"
				onclick="location.href='\/campaignDetail?campaignNum=${campaign.campaignNum }'">
					<img src="${pageContext.request.contextPath}/image/${campaign.image}" class="campaign_img">
					<div>${campaign.channel } | ${campaign.categoryId }</div>
					<div id="channelName">${campaignA.companyName }</div>
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

<script>
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
	var channels = `${channel}`;
	
	let channelChecks = document.querySelectorAll("input[name='channel']");
	channelChecks.forEach(function(item) {
		if(channels.includes(item.value)) {
			item.checked = true;
		}
	})

	var category = `${category}`;
	let categoryList = document.querySelectorAll("input[name='category']");
	categoryList.forEach(function(item) {
		if(item.value == category) {
			item.checked = true;
		}
	})
	
</script>


</html>