<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css?ver=1">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/join.css?ver=1">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.6.0.min.js"></script>
<script>
	$(function() {
		$(".address_btn").click(function () {
			new daum.Postcode({
		        oncomplete: function(data) {
	                var addr = '';
	                var extraAddr = '';
					
	                if (data.userSelectedType === 'R') {
	                    addr = data.roadAddress;
	                } else {
	                    addr = data.jibunAddress;
	                }

	                if(data.userSelectedType === 'R'){
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                    if(data.buildingName !== ''){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    if(extraAddr !== ''){
	                        extraAddr = ' (' + extraAddr + ')';
	                    }
	                } else {
	                	$('#address').val = '';
	                }
		            $("#address").val(addr + " " + extraAddr);
		            $("#addressdetail").attr("disabled", false);
		            $("#addressdetail").focus();
		        }
	    	}).open();
		})
	})
</script>
</head>
<body>
    <div class="signup_container">
        <div class="title_wrap">
          <h2>광고주 회원가입</h2>
          <a href="login.jsp">
            <img src="${pageContext.request.contextPath}/image//closeIcon.svg" alt="닫기아이콘" />
          </a>
        </div>
        <form action="" class="signup_form">
          <label for="email" class="input_label">
            이메일<span>*</span> <span class="br_style"><br /></span>
            <div class="input_btn_wrap">
              <input
                type="email"
                id="email"
                placeholder="이메일을 입력해주세요."
                class="input_btn_style"
       			name="email"
              />
              <button type="button">확인</button>
            </div>
          </label>
          <label for="password" class="input_label">
            비밀번호<span>*</span> <span class="br_style"><br /></span>
            <input
              type="password"
              id="password"
              placeholder="영문,숫자 포함 최소 8자리 이상 비밀번호를 입력해주세요."
              class="input_style"
              name="password"
            />
          </label>
          <label for="password_check" class="input_label">
            비밀번호 확인<span>*</span> <span class="br_style"><br /></span>
            <input
              type="password"
              id="password_check"
              placeholder="비밀번호를 다시 입력해주세요."
              class="input_style"
              name="passwordcheck"
            />
          </label>
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
          <label for="name" class="input_label">
            업체명<span>*</span> <span class="br_style"><br /></span>
            <input
              type="text"
              id="companyname"
              placeholder="업체명을 입력해주세요."
              class="input_style"
              name="companyname"
            />
          </label>
          <label for="number" class="input_label">
            휴대폰번호<span>*</span> <span class="br_style"><br /></span>
            <div class="input_btn_wrap">
              <input
                type="text"
                id="number"
                placeholder="휴대폰번호를 입력해주세요."
                class="input_btn_style"
                name="number"
              />
              <button type="button">인증</button>
            </div>
          </label>
          <label for="address" class="input_label">
            주소<span>*</span> <span class="br_style"><br /></span>
            <div class="input_btn_wrap">
              <input
                type="text"
                placeholder="주소를 검색해주세요."
                class="input_btn_style"
                name="address"
                id="address"
                disabled
              />
              <button type="button" class="address_btn">주소검색</button>
            </div>
            <input
            type="text"
            class="input_btn_style"
            name="addressdetail"
            id="addressdetail"
            disabled
          />
          </label>
  		  <div class="terms_wrap">
	          <div class="terms">
		          <input type="checkbox" id="terms_necessary" name="terms_necessary" checked />
		          <label for="terms_necessary" id="necessary_label"></label>
		          <p>[필수] 서비스 이용약관, 개인정보처리방침에 동의합니다.</p>
	 		  </div>
	 		  <div class="terms">
	 		  	<input type="checkbox" id="terms_choice" name="terms_choice" />
	          	<label for="terms_choice" id="choice_label"></label>
	          	<p>[선택] 마케팅 정보 수신에 동의합니다.</p>
			  </div>
          </div>
          <input type="submit" class="signup_btn" value="가입하기" /> 
       	</form>
	</div>
</body>
</html>