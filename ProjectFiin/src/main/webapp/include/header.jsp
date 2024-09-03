<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css?ver=1">
</head>
<body>
    <header>
    	<a href="/fiin/main.jsp">
    		<img src="${pageContext.request.contextPath}/image/logo.svg" alt="logo이미지" />
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
            <a href="payment">결제하기</a>
          </li>
        </ul>
        <a href="login.jsp" class="menu_button">
        	로그인/회원가입
        </a>
      </header>
</body>
</html>