<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/payment.css">
<script src="http://code.jquery.com//jquery-latest.min.js"></script>

</head>

<body>
<%@ include file="../include/header.jsp" %>
<div id="container">
	<h2 style="margin-bottom: 40px;">포인트 결제하기</h2>
	
		<div id="items">
			<label class="labl" for="${pointList[0].pointPrice }">
				<input type="radio" name="point" id="${pointList[0].pointPrice }" value="${pointList[0].pointAmount }">
				<div><img src="https://img.icons8.com/?size=100&id=iRgwumOATYL6&format=png&color=000000">
					<div class="blue bold">1,000포인트</div><div>10,000원</div>
				</div>
			</label>
			<label class="labl" for="${pointList[1].pointPrice }">
				<input type="radio" name="point" id="${pointList[1].pointPrice }" value="${pointList[1].pointAmount }">
				<div><img src="https://img.icons8.com/?size=100&id=EAJO2Tj4XI6Z&format=png&color=000000">
					<div class="blue bold">3,100포인트</div><div>30,000원</div>
				</div>
			</label>
			<label class="labl" for="${pointList[2].pointPrice }">
				<input type="radio" name="point" id="${pointList[2].pointPrice }" value="${pointList[2].pointAmount }">
				<div><img src="https://img.icons8.com/?size=100&id=3Qj1WJsYS8T4&format=png&color=000000">
					<div class="blue bold">5,300포인트</div><div>50,000원</div>
				</div>
			</label>
			<label class="labl" for="${pointList[3].pointPrice }">
				<input type="radio" name="point" id="${pointList[3].pointPrice }" value="${pointList[3].pointAmount }">
				<div><img src="https://img.icons8.com/?size=100&id=h3USDbkfsNWM&format=png&color=000000">
					<div class="blue bold">11,000포인트</div><div>100,000원</div>
				</div>
			</label>
		</div>
		<div>
			<button id="submitbtn">결제하기</button>
		</div>
	</div>
<%@ include file="../include/footer.jsp" %>  
</body>

<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
    <script>
    	//결제 api 
    	document.getElementById("submitbtn").onclick = function(e){
    		if(userNum == '') {
    			alert("로그인 후 이용가능합니다.");
    			location.href="login";
    		} else {
	    		requestPay();
    		}
    	}
    	console.log('${influencer}');
    	console.log('${advertiser}');
		var type = '${type}';
    	var userNum = '${type eq "influencer"? influencer.influencerNum:advertiser.advertiserNum}';
    	var email = '${type eq "influencer"? influencer.userEmail:advertiser.userEmail}';
    	var name = '${type eq "influencer"? influencer.name : advertiser.name}';
    	var tel = '${type eq "influencer"? influencer.mobileNumber:advertiser.mobileNumber}';
		console.log(userNum);
		console.log('${type eq "influencer"? influencer.mobileNumber:advertiser.mobileNumber}');
        function requestPay() {
            IMP.init("imp18223576"); // 예: 'imp00000000'
            const checkPoint =$('input:radio[name="point"]:checked');
            const pointAmount = checkPoint==null ? null: checkPoint.val();
            console.log(typeof pointAmount);
            const pointPrice = checkPoint.attr("id");
            IMP.request_pay(
                    {
                        pg: "html5_inicis.INIpayTest",
                        pay_method: "card",
                        merchant_uid: 'merchant_'+new Date().getTime(), // 주문 고유 번호
                        name: "파인 "+pointAmount.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")+"Point", // 숫자 3자리마다 , 찍어주는 것 
                        amount: pointPrice,  
                        buyer_email: email,
                        buyer_name: name,
                        buyer_tel: tel, //번호 필수
                    },
                    function (response) {
                        if (response.success) {
                        	//결제 성공시 DB에 데이터 반영
                        	$.ajax({
   	                        	url:"payment",
       	                    	type:"POST",
           	                	async:true,
               	            	data:{data:JSON.stringify({type:type,num:userNum, changePoint:pointAmount})},
	                           	success: function(result){
                            		alert(result);
		                            location.href="pointrecord";
	                           	},
								error: function (err) {
	                                console.log(err);
                                }
		                    })
                        } else {
                            alert('결제 실패');
                            console.log(response);
                        }
                    },
                );
        }
    </script>
</html>