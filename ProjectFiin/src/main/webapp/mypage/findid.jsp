<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/reset.css">
<link rel="stylesheet" href="../css/findId.css?ver=1">
</head>
<body>
    <div class="findId_container">
        <div class="title_wrap">
          <h2>아이디 찾기</h2>
          <a href="login.jsp">
            <img src="../image/closeIcon.svg" alt="닫기아이콘" />
          </a>
        </div>
        <form action="findid_result.jsp" class="findId_form">  
          <label for="name" class="input_label">
            이름<span>*</span> <span class="br_style"><br /></span>
            <input
              type="text"
              id="name"
              placeholder="이름을 입력해주세요."
              class="input_style"
              name="name"
            />
          </label>
   		  <label for="password" class="input_label">
            휴대폰번호<span>*</span> <span class="br_style"><br /></span>
            <input
              type="text"
              id="number"
              placeholder="(-)를 제외한 휴대폰번호를 입력해주세요."
              class="input_style"
              name="number"
            />
          </label>	
          <a href="findpassword.jsp" class="find_password">비밀번호를 잊으셨나요?</a>
          <button type="submit" class="findId_btn">아이디 찾기</button>  
        </form>
      </div>
</body>
</html>