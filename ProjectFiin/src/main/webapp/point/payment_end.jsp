<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/reset.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">

<style>
	#container {
		margin:20px auto;
		padding:20px 0px;
		background-color:white;
		width:1200px;
		border-radius:20px;
        text-align:center;
    }
   	#homebtn {
   		font-size:16px;
   		display:block;
  		vertical-align:middle;
   		width:200px;
   		height:auto;
   		margin:20px auto;
   		background-color:#4849E8;
   		color:white;
   		border:solid 1px #4849E8;
    	border-radius:10px;
    	text-align:center;
    	padding: 9px 12px 7px;
    	cursor:pointer;
   	}
    #payinfo {
        margin:0 auto;
        border-collapse: separate;
        border-spacing: 2rem 1.5rem;
    }
    tr td:nth-child(2) {
        color:#4849e8;
        font-weight:bold;
    }
    
</style>
</head>
<body>
<%@ include file="../include/header_login.jsp" %>
    <div id="container">
        <svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px" width="100" height="100" viewBox="0,0,255.98959,255.98959">
        <g fill="#4849e8" fill-rule="nonzero" stroke="none" stroke-width="1" stroke-linecap="butt" stroke-linejoin="miter" stroke-miterlimit="10" stroke-dasharray="" stroke-dashoffset="0" font-family="none" font-weight="none" font-size="none" text-anchor="none" style="mix-blend-mode: normal"><g transform="scale(8,8)"><path d="M16,3c-7.16797,0 -13,5.83203 -13,13c0,7.16797 5.83203,13 13,13c7.16797,0 13,-5.83203 13,-13c0,-7.16797 -5.83203,-13 -13,-13zM16,5c6.08594,0 11,4.91406 11,11c0,6.08594 -4.91406,11 -11,11c-6.08594,0 -11,-4.91406 -11,-11c0,-6.08594 4.91406,-11 11,-11zM22.28125,11.28125l-7.28125,7.28125l-4.28125,-4.28125l-1.4375,1.4375l5,5l0.71875,0.6875l0.71875,-0.6875l8,-8z"></path></g></g>
        </svg>
        <h1 style="text-align:center; font-weight:bold;">결제 완료</h1>
        <table id="payinfo">
            <tr>
                <td>결제 포인트</td><td>1,000P</td>
            </tr>
            <tr>
                <td>결제 금액</td><td>10,000원</td>
            </tr>
            <tr>
                <td>보유 포인트</td><td>11,000P</td>
            </tr>
        </table>
        <div id="homebtn" OnClick="location.href ='/fin/main.jsp'">메인페이지로 이동</div>
    </div>

</body>
</html>