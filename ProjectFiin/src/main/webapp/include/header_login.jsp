<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/header.css?ver=1">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<style>
	.navbar_login {
        width: 100px;
        display:flex;
        align-items:center;
	}
	#loginbtn {
		color:white;
	}
    #loginimg {
    width: 30px;
    height: 30px;
    background-color:#4849e8;
    border-radius:50%; 
    margin:0 auto;
    }
    #loginimg > img {
        width:30px;
        height:30px;
    }
</style>
</head>
<body>
    <header>
    	<a href="main.jsp">
    		<img src="../image/logo.svg" alt="logo이미지" />
    	</a>
        <ul class="menu_wrap">
          <li>
            <a href="campaign.jsp">캠페인</a>
          </li>
          <li>
            <a href="influencer.jsp">인플루언서</a>
          </li>
          <li>
            <a href="register_campaign.jsp">등록하기</a>
          </li>
          <li>
            <a href="payment.jsp">결제하기</a>
          </li>
        </ul>
        <div class="navbar_login" OnClick="location.href ='mypage.jsp'" style="cursor:pointer;">
			<div id="loginimg">
            	<img src="https://img.icons8.com/?size=100&id=43942&format=png&color=ffffff">
            </div>
            <div style="font-weight:bold">홍길동</div>
		</div>
      </header>
</body>
</html>