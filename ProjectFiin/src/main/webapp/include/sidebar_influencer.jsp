<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/sidebar.css">

<style>
.profile_img {
	width: 100px;
	height: 100px;
    background-color: #4849e8;
    border-radius: 50%;
}
</style>
</head>
<body>
<div id="sidebar">
        <div class="sideitem" style="text-align:center">
            <h3 style="padding: 0; margin-bottom: 16px;">${influencer.nickname }</h3>
            <div class="profile_img" style="margin:10px auto;">
           	<c:choose>
            	<c:when test="${influencer.profileImage eq null }">
            		<img src="https://img.icons8.com/?size=100&id=43942&format=png&color=ffffff" >
            	</c:when>
            	<c:otherwise>
	            	<img src="https://img.icons8.com/?size=50&id=NjOjDSZRU0Ma&format=png&color=4849e8">
            	</c:otherwise>
           	</c:choose>
            </div>
        </div>
        <div class="sideitem" style="text-align:left;">
            <h3 style="font-weight:bold ;padding-left:20px;margin-bottom:16px;">내 포인트 > </h3>
            <h3 style="color:#4948e8;font-weight:bold;padding-left:20px;"><fmt:formatNumber value='${(influencer.pointBalance eq null? 0 : influencer.pointBalance)}'/>P</h3>
        </div>
        <div class="sideitem">
            <h3 style="color:#4948e8;font-weight:bold;padding-left:20px;">마이 파인</h3>
            <ul>
            <li><a href="/fiin/mypage/influencer/campaign"><img class="icons" src="https://img.icons8.com/?size=100&id=6YVjhQYEKHAS&format=png&color=000000">캠페인 관리</a></li>
            <li><a href="/fiin/mypage/influencer/info"><img class="icons" src="https://img.icons8.com/?size=100&id=zxB19VPoVLjK&format=png&color=000000">프로필 관리</a></li>
            <li><a href="/fiin/mypage/pointrecord"><img class="icons" src="https://img.icons8.com/?size=100&id=xDnuaxgjAmJP&format=png&color=000000">포인트 관리</a></li>
            <li><a href="/fiin/mypage/influencer/SNS"><img class="icons" src="https://img.icons8.com/?size=100&id=DpOQ6G5p47f0&format=png&color=000000">나의 SNS관리</a></li>
            <li><a href="/fiin/mypage/influencer/bookmark"><img class="icons" src="https://img.icons8.com/?size=100&id=RvKp6z6EcIsB&format=png&color=000000">북마크 관리</a></li>
            </ul>
        </div>
    </div>
</body>
</html>