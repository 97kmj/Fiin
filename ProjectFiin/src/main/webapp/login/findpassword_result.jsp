<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css">
<style>
body {
	height: 100vh;
}

span {
	color: red;
}

.findPassword_container {
	width: 580px;
	border-radius: 20px;
	box-shadow: 3px 5px 10px rgb(0, 0, 0, 0.25);
	padding: 66px;
	text-align: center;
}

.title_wrap {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 20px;
}

.password {
	border-radius: 8px;
	background-color: #f6f7f8;
	border: 1px solid #e5e5e5;
	padding: 22px 16px;
	width: 100%;
	margin: 26px 0;
	font-weight: bold;
}
.change_password_btn {
	padding: 16px 0;
	display: block;
	text-align: center;
	color: white;
	background-color: #4849e8;
	font-weight: bold;
	border-radius: 8px;
	border: none;
	margin: 20px 0;
	font-size: 16px;
	cursor: pointer;
	width: 100%;
}

</style>
</head>
<body>
    <div class="findPassword_container">
        <div class="title_wrap">
          <h2>비밀번호 찾기</h2>
          <a href="login.jsp">
            <img src="${pageContext.request.contextPath}/image/closeIcon.svg" alt="닫기아이콘" />
          </a>
        </div>
        <p>입력하신 정보와 일치하는 비밀번호입니다.</p>
       	<div class="password">kosta********</div>
       	<a href="login.jsp" class="change_password_btn">로그인 하기</a>
     </div>
</body>
</html>