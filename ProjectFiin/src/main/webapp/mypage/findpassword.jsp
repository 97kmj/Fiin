<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/findPassword.css?ver=1">
</head>
<body>
    <div class="findpassword_container">
        <div class="title_wrap">
          <h2>비밀번호 찾기</h2>
          <a href="login.jsp">
            <img src="${pageContext.request.contextPath}/image/closeIcon.svg" alt="닫기아이콘" />
          </a>
        </div>
        <form action="findpassword_result.jsp" class="findpassword_form">  
          <label for="name" class="input_label">
            아이디(이메일)<span>*</span> <span class="br_style"><br /></span>
            <input
              type="email"
              id="email"
              placeholder="아이디(이메일)를 입력해주세요."
              class="input_style"
              name="email"
            />
          </label>
          <button type="submit" class="findpassword_btn">확인</button>  
        </form>
      </div>
</body>
</html>