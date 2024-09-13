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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/mypage_campaign_advertiser.css?after">
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>

</head>
<body>
<%@ include file="../include/header.jsp" %>

<div id="container">
	<%@ include file="../include/sidebar_advertiser.jsp" %>
    <div id="main" >       
    	<h2 style="font-weight:bold;text-align:left">나의 캠페인 현황</h2>
        <div id="filter">
            <div class="filterbtn" id="allList">전체</div>
            <div class="filterbtn" id="ingList">모집중</div>
            <div class="filterbtn" id="endList">모집종료</div>
        </div>
        <h3 id="campaigntype" style="font-weight:bold">전체 캠페인</h3>
        <div id="campaignwrap" >
        <c:forEach items="${campaignList }" var="campaign">
        	<c:choose>
       		<c:when test="${campaign.isRecruit eq 1}">
        		<div class="campaign valid" id="${campaign.campaignNum }">
       		</c:when>
       		<c:otherwise>
        		<div class="campaign invalid" id="${campaign.campaignNum }">
       		</c:otherwise>
        	</c:choose>
					<div class="img"><img src="image?file=${campaign.image}" style="width:200px;height:200px" onclick="location.href='campaignDetail?campaignNum=${campaign.campaignNum }'"/></div>
	                <div class="name">${campaign.campaignTitle }</div>
	                <div class="date"><fmt:formatDate value="${campaign.adStartDate }" pattern="yyyy-MM-dd"/> ~ <fmt:formatDate value="${campaign.adEndDate }" pattern="yyyy-MM-dd"/></div>
	                <button class="email btn">이메일발송</button>
	                <button class="apply btn">신청 목록</button>      
      	     	</div> 
        </c:forEach>
          
        </div>
    </div>
    
<div class="modal applylist">
	<div class="modal_body">
	<button class="closebtn"><img src="https://img.icons8.com/?size=100&id=J3PhU48KWI9A&format=png&color=000000" style="width:20px;height:20px"></button><br>
	<table id="receiveCampaignList">
		<h2>신청한 인플루언서</h2>
	    <thead>
	        <th>닉네임</th><th>카테고리</th><th>채널</th><th>수락</th>
	    </thead>
	    <tbody>
	    </tbody>
      </table>
      </form>
     </div>
</div>
<div class="modal sendemail">
	<div class="modal_body">
	<button class="closebtn"><img src="https://img.icons8.com/?size=100&id=J3PhU48KWI9A&format=png&color=000000" style="width:20px;height:20px"></button><br>
		<h2 style="text-align:center;color:#4849e8;">이메일 발송기능이란?</h2>
		<p>상품 카테고리와 희망광고채널이 일치하는 인플루언서에게 캠페인을 알리는 이메일을 보내줍니다.<br> 더 많은 인플루언서에게 자사 제품을 홍보 요청해보세요.</p>
		<p> &#8251;해당되는 모든 인플루언서들에게 이메일을 발송합니다.</p>
		<input type="button" name="sendEmail" value="이메일 발송" class="btn sendbtn" >
	</div>
</div>
</div>
<%@ include file="../include/footer.jsp" %>    
</body>
<script>
$(document).ready(function() {
	/*나의 캠페인 중 모집중이 아닌 것 버튼 기능 없애기 */
	$(".invalid .btn").attr("disabled",true);
	$(".invalid .btn").css("cursor","default");

	/* 신청목록 모달 띄우기 비동기 */
	$(".apply").on('click',function(e){
		e.preventDefault();
		var campaignNum = $(this).parent().attr("id");
		$.ajax({
			url:"receiveList",
           	type:"POST",
           	async:true,
           	data:{campaignNum:campaignNum},
           	success: function(result){
        		$("#receiveCampaignList > tbody").append(result);
				$(".applylist").addClass('show-modal');
           	},
			error: function (err) {
                alert(err);
            }
		}) 
	});
	
	/* 수락버튼 비동기 */
	$(document).on('click',"button[name='accept']",function(e){
		var applyNum = $(this).attr("value");
		var div = this;
		console.log(applyNum);
		console.log(this);
		$.ajax({
			url: "accept",
           	type: "POST",
           	async:true,
           	data:{applyNum:applyNum},
           	success: function(result){
			},
			error: function (err) {
                alert(err);
            }
		}) 
		$(this).addClass("checked");
		$(this).removeClass("accept");
		$(this).attr("name","checked");
		$(this).text("수락완료");
		
	})
	/* 이메일전송 모달 띄우기 */
	$(".email").on('click',function(e){
		e.preventDefault();
		var campaignNum = $(this).parent().attr("id");
		$(".sendbtn").attr("id","campaignNum"+campaignNum);
		$(".sendemail").addClass('show-modal');
		
	})
	
	/* 이메일 전송 기능 비동기처리 */
	$(".sendbtn").on('click',function(e){
		var campaignNum = $(this).attr("id").replace(/[^0-9]/g,"");
		$.ajax({
			url: "sendEmail",
           	type: "POST",
           	async:true,
           	data:{campaignNum:campaignNum},
           	success: function(result){
           		
			},
			error: function (err) {
                alert(err);
            }
		}) 
		alert("메일 전송 완료");
		$(".sendemail").removeClass('show-modal');
	})
	
	
	/* 모달창 닫기 버튼 */
	$(".closebtn").on('click',function(e){
		e.preventDefault()
		$(".sendbtn").removeAttr("id");
		$("#receiveCampaignList > tbody ").empty();
		$(".applylist").removeClass('show-modal');
		$(".sendemail").removeClass('show-modal');
	})
	
	/* 전체,모집중,모집종료 필터링 버튼 */
	$("#allList").on('click',function(){
		$(this).css("border","2px solid #4849e8");
		$("#ingList").css("border","2px solid #939393");
		$("#endList").css("border","2px solid #939393");
		$(".campaign").css("display","flex");
		$("#campaigntype").text("전체 캠페인");
	})
	$("#ingList").on('click',function(){
		$(this).css("border","2px solid #4849e8")
		$("#allList").css("border","2px solid #939393");
		$("#endList").css("border","2px solid #939393");
		$(".invalid").css("display","none");
		$(".valid").css("display","flex");
		$("#campaigntype").text("모집중인 캠페인");
	})
	$("#endList").on('click',function(){
		$(this).css("border","2px solid #4849e8")
		$("#ingList").css("border","2px solid #939393");
		$("#allList").css("border","2px solid #939393");
		$(".valid").css("display","none");
		$(".invalid").css("display","flex");
		$("#campaigntype").text("모집종료 캠페인");
	})
	
});

</script>

</html>