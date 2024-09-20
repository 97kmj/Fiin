<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


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
		<input type="hidden" name="page" id="page" value="1"/>
		<div id="categoryBar">
			<h2>카테고리</h2>
			<div class="categoryWrap">
				 <input type="radio" id="category" name="category" checked value="0"><a href="0">전체</a>
				 <input type="radio" id="category" name="category" value="2"><a href="2">패션</a>
				 <input type="radio" id="category" name="category"  value="1"><a href="1">뷰티</a>
			 	 <input type="radio" id="category" name="category"  value="6"><a href="6">생활용품</a>
				 <input type="radio" id="category" name="category" value="3"><a href="3">스포츠</a>
				 <input type="radio" id="category" name="category" value="4"><a href="4">여행/숙박</a>
				 <input type="radio" id="category" name="category" value="5"><a href="5">맛집</a>
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
			<button id="registerButton" >캠페인 등록하기</button>
		</div>
		</form>
		
		
			
		
		<div id="campaignWrap">
	 		<c:forEach items="${campaignList }" var="campaign">
	 			<div class="campaign_pick" onclick="location.href='campaignDetail?campaignNum=${campaign.campaignNum }'">
					<img src="image?file=${campaign.image}" class="campaign_img">
					<div> ${campaign.channel } | ${categoryList.get(campaign.categoryId-1).category_name }</div>
					<div id="channelName">${campaign.companyName }</div>
					<div id="title">${campaign.productName }</div>
					<div id= "campaigndate">광고기간</div>
					<div>
						<fmt:formatDate value="${campaign.adStartDate}" pattern="yyyy-MM-dd" /> ~ <fmt:formatDate value="${campaign.adEndDate}"
									pattern="yyyy-MM-dd" />
					</div>
				</div>
			</c:forEach> 
		</div>

		<!-- 페이 처리  -->
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
   
    </div>
	<%@include file="../include/footer.jsp" %>
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
	var channels = `${channel}`;
	
	let channelChecks = document.querySelectorAll("input[name='channel']");
	channelChecks.forEach(function(item) {
		if(channels.includes(item.value)) {
			item.checked = true;
			item.parentElement.style.borderColor = '#4849e8';
		}
	})

	var category = `${category}`;
	let categoryList = document.querySelectorAll("input[name='category']");
	categoryList.forEach(function(item) {
		if(item.value == category) {
			item.checked = true;
			
		}
	})
	
	$("#registerButton").click(function(e){
		e.preventDefault();
		location.href='campaignRegister';
	})
</script>


</html>