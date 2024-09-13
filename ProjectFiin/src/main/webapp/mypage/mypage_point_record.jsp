<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/mypage_point_record.css?after">
</head>
<body>
	<%@ include file="../include/header.jsp"%>
	<div id="container">
		<c:choose>
			<c:when test="${influencer eq null }">
				<%@ include file="../include/sidebar_advertiser.jsp"%>
			</c:when>
			<c:otherwise>
				<%@ include file="../include/sidebar_influencer.jsp"%>
			</c:otherwise>
		</c:choose>
		<div id="main">
			<h2 style="text-align: left">포인트 관리</h2>
			<h3 style="margin: 20px 0;">
				보유 포인트&nbsp;&nbsp;&nbsp; <span
					style="color: #4849E8; font-weight: bold"><fmt:formatNumber
						value='${type eq "influencer" ? (influencer.pointBalance eq null? 0 : influencer.pointBalance): (advertiser.pointBalance eq null? 0 : advertiser.pointBalance)}' />P</span>
			</h3>
			<c:if test="${empty pointRecordList}">
				<br>
				<div style="color: gray; font-size: 20px;">포인트 충전&#183;사용 내역이
					없습니다.</div>
			</c:if>
			<table id="pointrecord">
				<c:forEach items="${pointRecordList }" var="pointRecord">
					<tr>
						<td class="td1">${pointRecord.changePoint > 0 ? '충전':'사용' }</td>
						<td class="td2">${pointRecord.detail }</td>
						<td class="td3">
							<div>${pointRecord.changePoint > 0 ? '+':'-' }<fmt:formatNumber	value="${pointRecord.changePoint}" />P
							</div>
							<div>
								<fmt:formatDate value="${pointRecord.updateAt}"
									pattern="yyyy-MM-dd HH:mm" />
							</div>
						</td>
					</tr>
				</c:forEach>
			</table>
			<div class="page">
				<ul class='pagination'>
					<c:choose>
						<c:when test="${pageInfo.curPage>1 }">
							<li><a href="pointrecord?page=${pageInfo.curPage-1 }"
								class="arrow left"><img
									src="https://img.icons8.com/?size=100&id=x3s0mSWBMJTc&format=png&color=939393"
									style="weight: 20px; height: 20px"></a></li>
						</c:when>
						<c:otherwise>
						</c:otherwise>
					</c:choose>
					<c:forEach begin="${pageInfo.startPage }" end="${pageInfo.endPage }" var="i">
						<c:choose>
							<c:when test="${i eq pageInfo.curPage }">
								<li><a href="pointrecord?page=${i }" class="active num">${i }</a></li>
							</c:when>
							<c:otherwise>
								<li><a href="pointrecord?page=${i }" class="num">${i }</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:choose>
						<c:when test="${pageInfo.curPage<pageInfo.allPage }">
							<li><a href="pointrecord?page=${pageInfo.curPage+1 }"
								class="arrow right"><img
									src="https://img.icons8.com/?size=100&id=IGZk6vp3nxFm&format=png&color=939393"
									style="weight: 20px; height: 20px"></a></li>
						</c:when>
						<c:otherwise>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
		</div>
	</div>
	<%@ include file="../include/footer.jsp"%>
</body>
</html>
