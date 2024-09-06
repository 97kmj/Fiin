<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/reset.css">
<link rel="stylesheet" href="../css/findId.css?ver=1">
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
			$(".title_wrap h2").text("인플루언서 아이디 찾기");
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
			$(".title_wrap h2").text("광고주 아이디 찾기");
		});
		
		$(".findId_btn").click(function() {
			e.preventDefault();
			$.ajax({
				url: 'findId',
				type: 'post',
				async: true,
				dataType: 'text',
				data: { userEmail: $("#userEmail").val(), 
						password: $("#password").val(), 
					  	type: $("input:radio[name='type']:checked").val()
					  },
				success: function(result) {
					if (result == 'true') {
						//
					} else {
						//
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
    <div class="findId_container">
        <div class="title_wrap">
          <h2>인플루언서 아이디 찾기</h2>
          <a href="login.jsp">
            <img src="${pageContext.request.contextPath}/image/closeIcon.svg" alt="닫기아이콘" />
          </a>
        </div>
        <form action="findid_result.jsp" class="findId_form">
          <div class="tab_wrap">
		  	<input type="radio" class="radio_btn" name="type" value="influencer" id="type_influencer" checked="checked" style="appearence: none;-webkit-appearance: none;-moz-appearance: none;"/>
		  	<label for="type_influencer" class="influencer_tab" style="width: 49%; background-color: #ddf344;color: white;border-radius: 4px;font-weight: bold;padding: 10px 0;cursor: pointer;">인플루언서</label>
	        <input type="radio" class="radio_btn" name="type" value="advertiser" id="type_advertiser" style="appearence: none;-webkit-appearance: none;-moz-appearance: none;"/>
	        <label for="type_advertiser" class="advertiser_tab" style="width: 49%;background-color: #f6f7f8;border-radius: 4px;padding: 10px 0;color: #969696;cursor: pointer;">광고주</label>
          </div>  
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