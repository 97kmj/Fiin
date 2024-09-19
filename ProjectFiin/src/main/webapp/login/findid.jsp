<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/findId.css?ver=1">
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
			$(".modal_wrap .title_wrap h2").text("인플루언서 아이디 찾기");
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
			$(".modal_wrap .title_wrap h2").text("광고주 아이디 찾기");
		});
		
		var pnReg = /^(01[016789]{1})-?[0-9]{3,4}-?[0-9]{4}$/;
		$(".findId_btn").click(function(e) {
			e.preventDefault();
		
			if ($('#name').val() === "") {
				alert("이름을 입력해주세요.");
				$("#name").focus();
				return false;
			} else if ($("#mobileNumber").val() === "") {
				alert("휴대폰번호를 입력해주세요.");
				$("#mobileNumber").focus();
				return false;
			} else if (!pnReg.test($("#mobileNumber").val())) {
				alert("휴대폰번호를 확인해주세요.");
				$("#mobileNumber").focus();
				return false;
			}
			
			$.ajax({
				url: 'findId',
				type: 'post',
				async: true,
				dataType: 'text',
				data: { name: $("#name").val(), 
						mobileNumber: $("#mobileNumber").val(), 
					  	type: $("input:radio[name='type']:checked").val()
					  },
				success: function(result) {
					if (result == 'false') {
						// 이메일 찾기 실패 시
						alert("이메일 찾기가 실패하였습니다. 이름, 회원유형 또는 휴대폰번호를 확인해주세요.");
					} else {
						// 이메일 찾기 성공 시	
						$('.modal_wrap').css('display', 'flex');
						$('.modal_content').css('display', 'block');
						$('.email').text(result);
					
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
    <div class="findId_container">
        <div class="title_wrap">
          <h2>인플루언서 아이디 찾기</h2>
          <a href="login">
            <img src="${pageContext.request.contextPath}/image/closeIcon.svg" alt="닫기아이콘" />
          </a>
        </div>
        <form action="findId" class="findId_form">
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
   		  <label for="mobileNumber" class="input_label">
            휴대폰번호<span>*</span> <span class="br_style"><br /></span>
            <input
              type="text"
              id="mobileNumber"
              placeholder="(-)를 제외한 휴대폰번호를 입력해주세요."
              class="input_style"
              name="mobileNumber"
            />
          </label>	
          <a href="findPassword" class="find_password">비밀번호를 잊으셨나요?</a>
          <button type="submit" class="findId_btn">아이디 찾기</button>  
        </form>
        
        <!-- 아이디 찾기 모달 -->
        <div class="modal_wrap">
        	<div class="modal_content">
        		<div class="title_wrap">
		          <h2>인플루언서 아이디 찾기</h2>
		          <a href="login" id="modal_close_btn">
		            <img src="${pageContext.request.contextPath}/image/closeIcon.svg" alt="닫기아이콘" />
		          </a>
        		</div>
		        <p>입력하신 정보와 일치하는 이메일(아이디)입니다.</p>
		       	<div class="email"></div>
		        	<a href="findPassword" class="find_password">비밀번호를 잊으셨나요?</a>
		        </div>
        	</div>
      </div>
</body>
</html>