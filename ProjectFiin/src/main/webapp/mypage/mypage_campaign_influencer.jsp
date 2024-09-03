<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
<link rel="stylesheet" href="../css/reset.css">
<link rel="stylesheet" href="../css/mypage_campaign_influencer.css?ver=1">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
</head>
<body>
<%@ include file="../include/header.jsp" %>
<div id="container">
	<%@ include file="../include/sidebar_influencer.jsp" %>
	
    <div id="main">
        <h2>나의 요청 현황</h2>
        <div id="filter">
            <div class="filterbtn">신청한 캠페인</div>
            <div class="filterbtn">요청받은 캠페인</div>
        </div>
        <div id="mainwrap">
	        <h3>신청한 캠페인</h3>
	        <div id="campaignwrap">
	            <div class="campaign" id="campaignNum1">
	                <div class="img">
	                <a href="inpluenser_detail.jsp"><img src="image/campaign.png" style="width:200px;height:200px"></a></div>
	                <div class="channel">블로그</div>
	                <div class="compuny_name"><b>히든클리프</b></div>
	                <div class="name"><b>[24-8]제주히든 클리프호텔</b></div>
	                <div class="date">2024-01-01 ~ 2024-01-15</div>
	                <div class="result_total">
	                	<div class="result">수락</div>&nbsp;<div class="result">대기</div>&nbsp;<div class="result">거절</div>
	                </div>
	
	            </div>
	            <div class="campaign" id="campaignNum1">
	                <div class="img">
	                <a href="inpluenser_detail.jsp"><img src="image/campaign.png" style="width:200px;height:200px"></a></div>
	                <div class="channel">블로그</div>
	                <div class="compuny_name"><b>히든클리프</b></div>
	                <div class="name"><b>[24-8]제주히든 클리프호텔</b></div>
	                <div class="date">2024-01-01 ~ 2024-01-15</div>
	                <div class="result_total">
	                	<div class="result">수락</div>&nbsp;<div class="result">대기</div>&nbsp;<div class="result">거절</div>
	                </div>
	
	            </div>
	            <div class="campaign" id="campaignNum1">
	                <div class="img">
	                <a href="inpluenser_detail.jsp"><img src="image/campaign.png" style="width:200px;height:200px"></a></div>
	                <div class="channel">블로그</div>
	                <div class="compuny_name"><b>히든클리프</b></div>
	                <div class="name"><b>[24-8]제주히든 클리프호텔</b></div>
	                <div class="date">2024-01-01 ~ 2024-01-15</div>
	                <div class="result_total">
	                	<div class="result">수락</div>&nbsp;<div class="result">대기</div>&nbsp;<div class="result">거절</div>
	                </div>
	
	            </div>
	      
	            <div class="campaign" id="campaignNum1">
	                <div class="img">
	                <a href="inpluenser_detail.jsp"><img src="image/campaign.png" style="width:200px;height:200px"></a></div>
	                <div class="channel">블로그</div>
	                <div class="compuny_name"><b>히든클리프</b></div>
	                <div class="name"><b>[24-8]제주히든 클리프호텔</b></div>
	                <div class="date">2024-01-01 ~ 2024-01-15</div>
	                <div class="result_total">
	                	<div class="result">수락</div>&nbsp;<div class="result">대기</div>&nbsp;<div class="result">거절</div>
	                </div>
	
	            </div>
			</div>
        <div id="showlist">
        </div>
        </div>
    </div>
    
</div>    
</body>
<%@ include file="../include/footer.jsp" %>
<script>
    function showlist(e) {
        var campaignNum = $(e.target).parent().attr('id');
        console.log(campaignNum);
        var list = $('#'+campaignNum).children('.applylist').clone().children('table');
       
        $('#showlist').html(list);
    }
</script>
</html>