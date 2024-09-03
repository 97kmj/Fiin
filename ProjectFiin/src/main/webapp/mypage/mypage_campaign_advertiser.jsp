<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/mypage_campaign_advertiser.css?ver=1">
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
</head>
<body>
<%@ include file="../include/header.jsp" %>

<div id="container">
	<%@ include file="../include/sidebar_advertiser.jsp" %>
    <div id="main">       
    	<h2 style="font-weight:bold;text-align:left">나의 캠페인 현황</h2>
        <div id="filter">
            <div class="filterbtn"><a href="#">전체</a></div>
            <div class="filterbtn"><a href="#">모집중</a></div>
            <div class="filterbtn"><a href="#">모집종료</a></div>
        </div>
        <h3 style="font-weight:bold">전체 캠페인</h3>
        <div id="campaignwrap">
        <form action="#" method="get">
            <div class="campaign" id="campaignNum1">
                <div class="img"><img src="https://dummyimage.com/200x200/000000/fff" style="width:200px;height:200px"></div>
                <div class="name">캠페인 제목</div>
                <div class="date">2024-01-01 ~ 2024-01-15</div>
                <button class="email btn">이메일발송</button>
                <button class="apply btn">신청 목록</button>
            </div>
		</form>                
            <div class="campaign" id="campaignNum2">
                <div class="img"><img src="https://dummyimage.com/200x200/000000/fff" style="width:200px;height:200px"></div>
                <div class="name">캠페인 제목</div>
                <div class="date">2024-01-01 ~ 2024-01-15</div>
                <button class="email btn">이메일발송</button>
                <button class="apply btn">신청 목록</button>
                
            </div>
            <div class="campaign" id="campaignNum3">
                <div class="img"><img src="https://dummyimage.com/200x200/000000/fff" style="width:200px;height:200px"></div>
                <div class="name">캠페인 제목</div>
                <div class="date">2024-01-01 ~ 2024-01-15</div>
                <button class="email btn">이메일발송</button>
                <button class="apply btn">신청 목록</button>
                
            </div>
            
            <div class="campaign" id="campaignNum4">
                <div class="img"><img src="https://dummyimage.com/200x200/000000/fff" style="width:200px;height:200px"></div>
                <div class="name">캠페인 제목</div>
                <div class="date">2024-01-01 ~ 2024-01-15</div>
                <button class="email btn">이메일발송</button>
                <button class="apply btn">신청 목록</button>
            </div>
            
        </div>
    </div>
<div class="modal applylist">
	<div class="modal_body">
	<button class="closebtn"><img src="https://img.icons8.com/?size=100&id=J3PhU48KWI9A&format=png&color=000000" style="width:20px;height:20px"></button><br>
	<form action="#" method="post">
	<table>
		<h2>신청한 인플루언서</h2>
	    <thead>
	        <th>닉네임</th><th>카테고리</th><th>채널</th><th>수락</th>
	    </thead>
	    <tr>
	        <td><img src="https://img.icons8.com/?size=30&id=NjOjDSZRU0Ma&format=png&color=4849e8">&nbsp;홍길동</td><td>식품</td><td>유튜브,인스타그램</td><td><input type="submit" name="status" value="수락" class="btn"></td>
	    </tr>
	    <tr>
	        <td><img src="https://img.icons8.com/?size=30&id=NjOjDSZRU0Ma&format=png&color=4849e8">&nbsp;홍길동</td><td>식품</td><td>유튜브</td><td><input type="submit" name="status" value="수락" class="btn"></td>
	    </tr>
	    <tr>
	        <td><img src="https://img.icons8.com/?size=30&id=NjOjDSZRU0Ma&format=png&color=4849e8">&nbsp;홍길동</td><td>식품</td><td>유튜브</td><td><input type="submit" name="status" value="수락" class="btn"></td>
	    </tr>
	    
      </table>
      </form>
     </div>
</div>
<div class="modal sendemail">
	<div class="modal_body">
	<button class="closebtn"><img src="https://img.icons8.com/?size=100&id=J3PhU48KWI9A&format=png&color=000000" style="width:20px;height:20px"></button><br>
	<form action="#" method="post">
		<h2 style="color:#4849e8;">이메일 발송기능이란?</h2>
		<p>상품 카테고리와 희망광고채널이 일치하는 인플루언서에게 캠페인을 알리는 이메일을 보내줍니다.<br> 더 많은 인플루언서에게 자사 제품을 홍보 요청해보세요.</p>
		<p> &#8251;해당되는 모든 인플루언서들에게 이메일을 발송합니다.</p>
		<input type="submit" name="status" value="이메일 발송" class="btn" >
	</form>
	</div>
</div>
</div>
<%@ include file="../include/footer.jsp" %>    
</body>
<script>
	$(".apply").on('click',function(){
		$(".applylist").addClass('show-modal');
	})
	$(".email").on('click',function(){
		$(".sendemail").addClass('show-modal');
	})
	$(".closebtn").on('click',function(){
		$(".applylist").removeClass('show-modal');
		$(".sendemail").removeClass('show-modal');
	})
		

</script>

</html>