<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
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
		/* 주소 검색 */
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
		            $("#addressDetail").attr("readonly", false);
		            $("#addressDetail").focus();
		        }
	    	}).open();
		})
		
		/* 이메일 중복 확인 */
		$("#emailCheck").click(function(e) {
			e.preventDefault();
			
			if (!emailReg.test($("#userEmail").val())) {
				alert("이메일 형식이 올바르지 않습니다.");
				$("#userEmail").focus();
				return false;
			}
			
			$.ajax({
				url: 'emailCheck',
				type: 'post',
				async: true,
				dataType: 'text',
				data: {userEmail: $("#userEmail").val()},
				success: function(result) {
					if (result == 'true') {
						alert("사용중인 아이디입니다.");
					} else {
						alert("사용가능한 아이디입니다.");
					}
				},
				error: function(err) {
					console.log(err);
				}
			})
		})
		
		/* 휴대폰 인증 메세지 보내기 */
		$("#sendSms").click(function(e) {
			e.preventDefault();
			
			if ($("#mobileNumber").val() === "") {
				alert("휴대폰번호를 입력해주세요.");
				$("#mobileNumber").focus();
				return false;
			}  else if (!pnReg.test($("#mobileNumber").val())) {
				alert("휴대폰번호를 확인해주세요.");
				$("#mobileNumber").focus();
				return false;
			} else {
				$("#sendSms").attr('disabled', true);
				$("#sendSms").css({'background-color': '#f6f7f8', 'border': '1px solid #e5e5e5', 'color': '#737373'});
				$(".codeinput_btn_wrap").css('display', 'flex');
				$("#confirmCode").attr('disabled', false);
			}
			
			/* 인증 타이머 */
			var counter = 0;
			var timeleft = 180; // 제한 시간 지정 값
			
			function convertSeconds(s){
				if (s === 0) {
					clearInterval(setTimer);	// 시간 끝났을 때 멈추기
					$("#confirmCode").attr('disabled', true);
					$("#confirmCode").css({'border': '1px solid #e5e5e5', 'color': '#737373'});
					$("#sendSms").attr('disabled', false);
					$("#sendSms").css({'background-color': '#4849e8', 'border': '1px solid #4849e8', 'color': 'white'});
				}
			    var min = Math.floor(s / 60);
			    var sec = s % 60;
			    return min +  ':' + String(sec).padStart(2, '0');
			}

			$("#time").html(convertSeconds(timeleft - counter));

			function timeIt(){
			    counter++;
			    $("#time").html(convertSeconds(timeleft - counter));
			}
			var setTimer = setInterval(timeIt, 1000);
			
			/* ajax로 인증코드 요청하고 결과 확인하기 */
			$.ajax({
				url: 'sendSms',
				type: 'post',
				async: true,
				dataType: 'text',
				data: {mobileNumber: $("#mobileNumber").val()},
				success: function(result) {
					console.log(result);
					$("#confirmCode").click(function(e) {
						e.preventDefault();
						
						if ($("#code").val() === "") {				
							alert("인증코드를 입력해주세요.");
							$("#code").focus();
							return false;
						} else if (result === $("#code").val()) {
							alert("인증이 성공하였습니다.");
							clearInterval(setTimer);
							$("#time").css('display', 'none');
							$("#sendSms").css({'background-color': '#f6f7f8', 'border': '1px solid #e5e5e5', 'color': '#737373'});
							$("#confirmCode").attr('disabled', true);
							$("#confirmCode").css({'border': '1px solid #e5e5e5', 'color': '#737373'});
							$(".codeinput_btn_wrap").css('display', 'none');
						} else {
							alert("인증에 실패하였습니다. 인증코드를 확인해주세요.");
							$("#code").focus();
							return false;
						}
					})
				},
				error: function(err) {
					console.log(err);
				}
			})
		})
		
		/* 회원가입 유효성 검증 */
		var pwReg = /^(?=.*[a-zA-Z])(?=.*[0-9]).{8,25}$/;
		var emailReg = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
		var nameReg = /^[가-힣]{2,4}$/;
		var pnReg = /^(01[016789]{1})-?[0-9]{3,4}-?[0-9]{4}$/;
		
		$(".signup_btn").click(function(e) {
			e.preventDefault();
			if ($("#userEmail").val() === "") {				
				alert("이메일을 입력해주세요.");
				$("#userEmail").focus();
				return false;
			} else if (!emailReg.test($("#userEmail").val())) {
				alert("이메일 형식이 올바르지 않습니다.");
				$("#userEmail").focus();
				return false;
			} else if ($("#password").val() === "") {
				alert("비밀번호를 입력해주세요.");
				$("#password").focus();
				return false;
			} else if (!pwReg.test($("#password").val())) {
				alert("비밀번호는 영문, 숫자포함 최소 8자리 이상 입력해주세요.");
				$("password").focus();
				return false;
			} else if ($("#passwordCheck").val() === "" || $("#passwordCheck").val() != $("#password").val()) {
				alert("비밀번호가 일치하지 않습니다.");
				$("#passwordCheck").focus();
				return false;
			} else if ($("#name").val() === "") {
				alert("이름을 입력해주세요.");
				$("#name").focus();
				return false;
			} else if (!nameReg.test($("#name").val())) {
				alert("이름을 확인해주세요.(한글 2~4자 이내)");
				$("#name").focus();
				return false;
			} else if ($("#nickname").val() === "") {
				alert("닉네임을 입력해주세요.");
				$("#nickname").focus();
				return false;
			} else if ($("#companyName").val() === "") {
				alert("업체명을 입력해주세요.");
				$("#companyName").focus();
				return false;
			} else if ($("#mobileNumber").val() === "") {
				alert("휴대폰번호를 입력해주세요.");
				$("#mobileNumber").focus();
				return false;
			} else if (!pnReg.test($("#mobileNumber").val())) {
				alert("휴대폰번호를 확인해주세요.");
				$("#mobileNumber").focus();
				return false;
			} else if ($("#code").val() === "") {
				alert("휴대폰번호 인증을 완료해주세요.");
				return false;
			} else if ($("#address").val() === "") {
				alert("주소를 검색해주세요.");
				$("#address").focus();
				return false;
			} else if (!$("#terms_necessary").is(":checked")) {
				alert("필수 이용약관에 동의해주세요.");
				return false;
			}
				
			$(".signup_form").submit();
		})
	})
</script>
</head>
<body>
    <div class="signup_container">
        <div class="title_wrap">
          <c:choose>
          	<c:when test="${sessionScope.type eq 'influencer'}"><h2>인플루언서 회원가입</h2></c:when>
          	<c:otherwise><h2>광고주 회원가입</h2></c:otherwise>
          </c:choose>
      
          <a href="login">
            <img src="${pageContext.request.contextPath}/image//closeIcon.svg" alt="닫기아이콘" />
          </a>
        </div>
        <form action="join" class="signup_form" method="post">
          <label for="userEmail" class="input_label">
            이메일<span>*</span> <span class="br_style"></span><br />
            <div class="input_btn_wrap">
              <input
                type="text"
                id="userEmail"
                placeholder="이메일을 입력해주세요."
                class="input_btn_style"
                name="userEmail"
              />
              <button type="button" id="emailCheck">확인</button>
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
          <label for="passwordCheck" class="input_label">
            비밀번호 확인<span>*</span> <span class="br_style"><br /></span>
            <input
              type="password"
              id="passwordCheck"
              placeholder="비밀번호를 다시 입력해주세요."
              class="input_style"
              name="passwordCheck"
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
          <c:choose>
          	<c:when test="${sessionScope.type eq 'influencer'}">
          		<label for="nickname" class="input_label">
		            닉네임<span>*</span> <span class="br_style"><br /></span>
		            <input
		              type="text"
		              id="nickname"
		              placeholder="닉네임을 입력해주세요."
		              class="input_style"
		              name="nickname"
		            />
          		</label>
          	</c:when>
          	<c:otherwise>
          		<label for="companyName" class="input_label">
		            업체명<span>*</span> <span class="br_style"><br /></span>
		            <input
		              type="text"
		              id="companyName"
		              placeholder="업체명을 입력해주세요."
		              class="input_style"
		              name="companyName"
		            />
          		</label>
          	</c:otherwise>
          </c:choose>
          <label for="mobileNumber" class="input_label">
            휴대폰번호<span>*</span> <span class="br_style"><br /></span>
            <div class="input_btn_wrap">
              <input
                type="text"
                id="mobileNumber"
                placeholder="휴대폰번호를 입력해주세요."
                class="input_btn_style"
                name="mobileNumber"
              />
              <button type="button" id="sendSms">인증</button>
            </div>
          </label>
          <div class="codeinput_btn_wrap">
          	  <div class="code_wrap">
	              <input
	                type="text"
	                id="code"
	                placeholder="인증코드를 입력해주세요."
	                class="input_btn_style"
	                name="code"
	              />
	              <span id="time"></span>
              </div>
              <button type="button" id="confirmCode">확인</button>
          </div> 
          <label for="address" class="input_label">
            주소<span>*</span> <span class="br_style"><br /></span>
            <div class="input_btn_wrap">
              <input
                type="text"
                placeholder="주소를 검색해주세요."
                class="input_btn_style"
                name="address"
                id="address"
                readonly="readonly"
              />
              <button type="button" class="address_btn">주소검색</button>
            </div>
            <input
            type="text"
            class="input_btn_style"
            name="addressDetail"
            id="addressDetail"
            readonly="readonly"
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
          <input type="submit" class="signup_btn" value="가입하기" style="cursor: pointer;"> 
        </form>
      </div>	      
</body>
</html>