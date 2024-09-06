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
<script src="http://code.jquery.com//jquery-latest.min.js"></script>
</head>
<body>
	<%@ include file="../include/header.jsp"%>
	<div class="container">
		<div id="categoryBar">
			<h2>카테고리</h2>
			<div class="categoryWrap">
<!-- 				<input type="radio" id="all" name="category" value="0" checked><label for="all">전체</label>
				<input type="radio" id="fasion" name="category" value="2"><label for="fasion">패션</label>
				<input type="radio" id="fasion" name="category" value="2"><a href="2">패션</a>&nbsp;
				 <input type="radio" id="beauty" name="category" value="1"><label for="beauty">뷰티</label>
			 	 <input type="radio" id="daily" name="category" value="8"><label for="daily">생활용품</label>
				 <input type="radio" id="sport" name="category" value="3"><label for="sport">스포츠</label>
				 <input type="radio" id="travel" name="category" value="4"><label for="travel">여행/숙박</label>
				 <input type="radio" id="goodTaste" name="category" value="5"><label for="goodTaste">맛집</label> -->
				 
				 <input type="radio" id="all" name="category" checked><a href="0">전체</a>&nbsp;&nbsp;&nbsp;
				 <input type="radio" id="fasion" name="category"><a href="2">패션</a>&nbsp;&nbsp;&nbsp;
			 	 <input type="radio" id="daily" name="category" ><a href="6">생활용품</a>&nbsp;&nbsp;&nbsp;
				 <input type="radio" id="sport" name="category"><a href="3">스포츠</a>&nbsp;&nbsp;&nbsp;
				 <input type="radio" id="travel" name="category"><a href="4">여행/숙박</a>&nbsp;&nbsp;&nbsp;
				 <input type="radio" id="goodTaste" name="category"><a href="5">맛집</a>&nbsp;&nbsp;&nbsp;
			</div>
		</div>
		<form id="categoryform" action="campaignList" method="get">
			<input type="hidden" name="categoryId"> 
		</form>
		
		
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
		<div class="allBar">
			<h2></h2>
			<button id="registerButton" onclick="location.href='campaign/campaign_register.jsp'">캠페인 등록하기</button>
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
<script>
	$(".categoryWrap a").on("click", function(e){
		e.preventDefault();
		let categoryId= $(this).attr("href");
		$("#categoryform input[name='categoryId']").val(categoryId);
		$("input[name='channel']:checked").each(function(){

			console.log($("input[name='channel']:checked")).val()

		});
		$("#categoryform").submit();
	});

	
</script>
</html>