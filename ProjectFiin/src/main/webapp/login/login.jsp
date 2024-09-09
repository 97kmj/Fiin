<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css?ver=1">
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function() {
		$(".influencer_tab").on("click", function() {
			$(this).css({
				"background-color" : "#ddf344",
				color : "white",
				"font-weight" : "bold",
			});
			$(".advertiser_tab").css({
				"background-color" : "#f6f7f8",
				color : "#969696",
				"font-weight" : "normal",
			});
			$(".title_wrap h2").text("인플루언서 로그인");
		});
	
		$(".advertiser_tab").on("click", function() {
			$(this).css({
				"background-color" : "#4849e8",
				color : "white",
				"font-weight" : "bold",
			});
			$(".influencer_tab").css({
				"background-color" : "#f6f7f8",
				color : "#969696",
				"font-weight" : "normal",
			});
			$(".title_wrap h2").text("광고주 로그인");
		});
		
		var emailReg = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
		var pwReg = /^(?=.*[a-zA-Z])(?=.*[0-9]).{8,25}$/;
		
		$("#login_btn").click(function(e) {
			e.preventDefault();
			if ($("#userEmail").val() === "") {				
				alert("이메일을 입력해주세요.");
				$("#userEmail").focus();
				return false;
			} else if ($("#password").val() === "") {
				alert("비밀번호를 입력해주세요.");
				$("#password").focus();
				return false;
			} 
				
			$.ajax({
				url: 'login',
				type: 'post',
				async: true,
				dataType: 'text',
				data: { userEmail: $("#userEmail").val(), 
						password: $("#password").val(), 
						type: $("input:radio[name='type']:checked").val()
					  },
				success: function(result) {
					if (result == 'false') {
						alert("로그인에 실패하였습니다.");
						return false;
					} else {
						// 로그인 성공 시
						location.href = "/fiin/main";
						alert("로그인에 성공하였습니다.")
					}
				},
				error: function(err) {
					console.log(err);
				}
			})
		})
	});
</script>
</head>
<body>
    <div class="signin_container">
        <div class="title_wrap">
          <h2>인플루언서 로그인</h2>
          <a href="main.jsp">
            <img src="${pageContext.request.contextPath}/image/closeIcon.svg" alt="닫기아이콘" />
          </a>
        </div>

        <form action="login" class="signin_form" method="post">
		  <div class="tab_wrap">
		  	<input type="radio" class="radio_btn" name="type" value="influencer" id="type_influencer" checked="checked" style="appearence: none;-webkit-appearance: none;-moz-appearance: none;"/>
		  	<label for="type_influencer" class="influencer_tab" style="width: 49%; background-color: #ddf344;color: white;border-radius: 4px;font-weight: bold;padding: 10px 0;cursor: pointer;">인플루언서</label>
	        <input type="radio" class="radio_btn" name="type" value="advertiser" id="type_advertiser" style="appearence: none;-webkit-appearance: none;-moz-appearance: none;"/>
	        <label for="type_advertiser" class="advertiser_tab" style="width: 49%;background-color: #f6f7f8;border-radius: 4px;padding: 10px 0;color: #969696;cursor: pointer;">광고주</label>
          </div>
          <input type="text" class="signin_input" placeholder="이메일" name="userEmail" id="userEmail" />
          <input type="password" class="signin_input" placeholder="비밀번호" name="password" id="password" />
          <div class="findinfo_wrap">
            <a href="/fiin/findId">아이디</a>
            <span></span>
            <a href="/fiin/findPassword">비밀번호를 잊으셨나요?</a>
          </div>
          <button type="submit" id="login_btn">로그인 하기</button>
        </form>
        <div class="signup_btn">
          <a href="joinInfluencer">인플루언서로 가입하기</a>
          <a href="joinAdvertiser">광고주로 가입하기</a>
        </div>
      </div>
</body>
</html>