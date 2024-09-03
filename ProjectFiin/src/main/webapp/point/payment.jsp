<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/payment.css">
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
<script src="http://code.jquery.com//jquery-latest.min.js"></script>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
    <script>
    
    	document.getElementById("submitbtn").onclick = function(e){
    		requestPay();
    	}
    
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
                        merchant_uid: `order_no_0001`+new Date().getTime(), // 주문 고유 번호
                        name: "파인 "+pointAmount.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")+"Point",
                        amount: pointPrice,
                        buyer_email: "kmj0376@naver.com",
                        buyer_name: "김민준",
                        buyer_tel: "010-9954-0377",
                        buyer_addr: "서울특별시 강남구 신사동",
                        buyer_postcode: "01181",
                    },
                    function (response) {
                        if (response.success) {
                            alert('결제가 완료되었습니다.');
                            $.ajax({
                            	url:"payment",
                            	type:"post",
                            	async:true,
                            	
                            })
                            location.replace("http://localhost:8080/semi/mypage_point_record.jsp")
                        } else {
                            alert('결제 실패');
                            console.log(response);
                        }
                    },
                );
        }
    </script>
</html>