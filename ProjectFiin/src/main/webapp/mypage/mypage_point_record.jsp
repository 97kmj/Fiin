<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/mypage_point_record.css?ver=1">
</head>
<body>
<%@ include file="../include/header.jsp" %>
<div id="container">
    <%@ include file="../include/sidebar_advertiser.jsp" %>
    <div id="main">
        <h2 style="text-align:left">포인트 관리</h2>
        <h3 style="margin: 20px 0;">사용가능포인트&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#4849E8; font-weight:bold">45,000</span></h3>
        <table>
            <tr>
                <td class="td1">충전</td>
                <td class="td2">포인트 충전</td>
                <td class="td3"><div>+5,000P</div><div>2024-07-25</div></td>
            </tr>
            <tr>
                <td class="td1">충전</td>
                <td class="td2">포인트 충전</td>
                <td class="td3"><div>+5,000P</div><div>2024-07-25</div></td>
            </tr>
            <tr>
                <td class="td1">충전</td>
                <td class="td2">포인트 충전</td>
                <td class="td3"><div>+5,000P</div><div>2024-07-25</div></td>
            </tr>
            <tr>
                <td class="td1">사용</td>
                <td class="td2">인플루언서 등록</td>
                <td class="td3"><div>-1,000P</div><div>2024-07-25</div></td>
            </tr>
        </table>
		    <div class="page">
		        <ul class="pagination">
		            <li> <a href="#" class="arrow left"><img src="https://img.icons8.com/?size=100&id=x3s0mSWBMJTc&format=png&color=939393" style="weight:20px;height:20px"></a></li>
		            <li> <a href="#" class="active num">1</a></li>
		            <li> <a href="#" class="num">2</a></li>
		            <li> <a href="#" class="num">3</a></li>
		            <li> <a href="#" class="num">4</a></li>
		            <li> <a href="#" class="arrow right"><img src="https://img.icons8.com/?size=100&id=IGZk6vp3nxFm&format=png&color=939393" style="weight:20px;height:20px"></a></li>
	        	</ul>
	    	</div>
    	</div>
	
</div>
    <%@ include file="../include/footer.jsp" %>
</body>
</html>
