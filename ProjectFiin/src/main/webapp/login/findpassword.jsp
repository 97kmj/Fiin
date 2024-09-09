<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/findPassword.css?ver=1">
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
			$(".title_wrap h2").text("인플루언서 비밀번호 찾기");
			$(".modal_wrap .title_wrap h2").text("인플루언서 비밀번호 찾기");
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
			$(".title_wrap h2").text("광고주 비밀번호 찾기");
			$(".modal_wrap .title_wrap h2").text("광고주 비밀번호 찾기");
		});
		
		$(".findpassword_btn").click(function(e) {
			e.preventDefault();
			
			if ($('#userEmail').val() === "") {
				alert("아이디(이메일)을 입력해주세요.");
				$("#userEmail").focus();
				return false;
			}
			
			$.ajax({
				url: 'findPassword',
				type: 'post',
				async: true,
				dataType: 'text',
				data: { userEmail: $("#userEmail").val(), 
					  	type: $("input:radio[name='type']:checked").val()
					  },
				success: function(result) {
					if (result == 'false') {
						// 비밀번호 찾기 실패 시
						alert("비밀번호 찾기가 실패하였습니다. 이메일 또는 회원유형을 확인해주세요.");
					} else {
						// 비밀번호 찾기 성공 시	
						$('.modal_wrap').css('display', 'flex');
						$('.modal_content').css('display', 'block');
						$('.password').text(result);
					
						$('#modal_close_btn').click(function(){
							$('.modal_wrap').css('display', 'none');
							$('.modal_content').css('display', 'none');
							location.href = "/ffin/login";
						});
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
    <div class="findpassword_container">
        <div class="title_wrap">
          <h2>인플루언서 비밀번호 찾기</h2>
          <a href="/fiin/login">
            <img src="${pageContext.request.contextPath}/image/closeIcon.svg" alt="닫기아이콘" />
          </a>
        </div>
        <form action="findpassword_result.jsp" class="findpassword_form"> 
          <div class="tab_wrap">
		  	<input type="radio" class="radio_btn" name="type" value="influencer" id="type_influencer" checked="checked" style="appearence: none;-webkit-appearance: none;-moz-appearance: none;"/>
		  	<label for="type_influencer" class="influencer_tab" style="width: 49%; background-color: #ddf344;color: white;border-radius: 4px;font-weight: bold;padding: 10px 0;cursor: pointer;">인플루언서</label>
	        <input type="radio" class="radio_btn" name="type" value="advertiser" id="type_advertiser" style="appearence: none;-webkit-appearance: none;-moz-appearance: none;"/>
	        <label for="type_advertiser" class="advertiser_tab" style="width: 49%;background-color: #f6f7f8;border-radius: 4px;padding: 10px 0;color: #969696;cursor: pointer;">광고주</label>
          </div>           
          <label for="name" class="input_label">
            아이디(이메일)<span>*</span> <span class="br_style"><br /></span>
            <input
              type="email"
              id="userEmail"
              placeholder="아이디(이메일)를 입력해주세요."
              class="input_style"
              name="userEmail"
            />
          </label>
          <button type="submit" class="findpassword_btn">확인</button>  
        </form>
        
        <!-- 비밀번호 찾기 모달 -->
        <div class="modal_wrap">
        	<div class="modal_content">
		        <div class="title_wrap">
		          <h2>인플루언서 비밀번호 찾기</h2>
		          <a href="/fiin/login">
		            <img src="${pageContext.request.contextPath}/image/closeIcon.svg" alt="닫기아이콘" />
		          </a>
		        </div>
		        <p>입력하신 정보와 일치하는 비밀번호입니다.</p>
		       	<div class="password"></div>
		       	<!-- <div class="password">kosta********</div> -->
		       	<a href="/fiin/login" class="login_btn">로그인 하기</a>
		    </div>
		</div>
	</div>
</body>
</html>