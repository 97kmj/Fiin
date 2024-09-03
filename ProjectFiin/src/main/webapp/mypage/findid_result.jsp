<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/reset.css">
<style>
body {
	height: 100vh;
}

span {
	color: red;
}

.findId_container {
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
.email {
	border-radius: 8px;
	background-color: #f6f7f8;
	border: 1px solid #e5e5e5;
	padding: 22px 16px;
	width: 100%;
	margin: 26px 0;
	font-weight: bold;
}
.find_password {
	color: #525252;
	font-weight: bold;
	font-size: 12px;
	text-decoration: underline;
	text-align: center;
}
</style>
</head>
<body>
    <div class="findId_container">
        <div class="title_wrap">
          <h2>아이디 찾기</h2>
          <a href="login.jsp">
            <img src="${pageContext.request.contextPath}/image/closeIcon.svg" alt="닫기아이콘" />
          </a>
        </div>
        <p>입력하신 정보와 일치하는 이메일(아이디)입니다.</p>
       	<div class="email">kosta@kosta.com</div>
        <a href="findpassword.jsp" class="find_password">비밀번호를 잊으셨나요?</a>
      </div>
</body>
</html>