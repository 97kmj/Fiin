<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/mypage_info.css?ver=1">
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
		            $("#addressdetail").focus();
		        }
	    	}).open();
		})
		
		var pwReg = /^(?=.*[a-zA-Z])(?=.*[0-9]).{8,25}$/;
		var nameReg = /^[가-힣]{2,4}$/;
		var pnReg = /^(01[016789]{1})-?[0-9]{3,4}-?[0-9]{4}$/;
		
		$(".edit_btn").click(function(e) {
			e.preventDefault();

			if ($("#password").val() === "") {
				alert("비밀번호를 입력해주세요.");
				$("#password").focus();
				return false;
			} else if (!pwReg.test($("#password").val())) {
				alert("비밀번호는 영문, 숫자포함 최소 8자리 이상 입력해주세요.");
				$("password").focus();
				return false;
			} else if ($("#name").val() === "") {
				alert("이름을 입력해주세요.");
				$("#name").focus();
				return false;
			} else if (!nameReg.test($("#name").val())) {
				alert("이름을 확인해주세요.(한글 2~4자 이내)");
				$("#name").focus();
				return false;
			} else if ($("#companyName").val() === "") {
				alert("회사명을 입력해주세요.");
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
			} else if ($("#address").val() === "") {
				alert("주소를 검색해주세요.");
				$("#address").focus();
				return false;
			} 
				
			$(".edit_form").submit();
		})
	})
</script>
</head>
<body>
	<%@ include file="../include/header.jsp" %>
	<div class="edit_container">
		<%@ include file="../include/sidebar_advertiser.jsp" %>
		
		<div class="main">
			<h2>프로필 관리</h2>
			<form action="mypageAdvertiserInfo" class="edit_form" method="post">
				  <!-- 광고주 번호 숨겨놓는 input -->
				  <input type="hidden" id="advertiserNum" name="advertiserNum" value="${advertiser.advertiserNum}" />
				  
				  <label for="userEmail" class="input_label">
		            이메일<span>*</span> <span class="br_style"><br /></span>
		            <input
		              type="text"
		              id="userEmail"
		              value="${advertiser.userEmail}"
		              class="input_style"
		              name="userEmail"
		              disabled
		            />
		          </label>
				  <label for="password" class="input_label">
           			 	비밀번호<span>*</span> <span class="br_style"><br /></span>
			             <input
			                type="password"
			                id="password"
			                value="${advertiser.password}"
			                class="input_style"
			       			name="password"
			             />
	          	  </label>
		          <label for="name" class="input_label">
		            이름<span>*</span> <span class="br_style"><br /></span>
		            <input
		              type="text"
		              id="name"
		              value="${advertiser.name}"
		              class="input_style"
		              name="name"
		            />
		          </label>
		          <label for="companyName" class="input_label">
		            업체명<span>*</span> <span class="br_style"><br /></span>
		            <input
		              type="text"
		              id="companyName"
		              value="${advertiser.companyName}"
		              class="input_style"
		              name="companyName"
		            />
		          </label>
		          <label for="mobileNumber" class="input_label">
		            휴대폰번호<span>*</span> <span class="br_style"><br /></span>
		              <input
		                type="text"
		                id="mobileNumber"
						value="${advertiser.mobileNumber}"
		                class="input_style"
		                name="mobileNumber"
		              />
		          </label>
		          <label for="address" class="input_label">
		            주소<span>*</span> <span class="br_style"><br /></span>
		            <div class="input_btn_wrap">
		              <input
		                type="text"
		                value="${advertiser.address}"
		                class="input_btn_style"
		                name="address"
		                id="address"
		                readonly="readonly"
		              />
		              <button type="button" class="address_btn">주소검색</button>
		            </div>
		            <input
			            type="text"
			            value="${advertiser.addressDetail}"
			            class="input_btn_style"
			            name="addressDetail"
			            id="addressDetail"
		          	/>
		          </label>
          		  <input type="submit" class="edit_btn" value="수정하기">
			</form>
		</div>
	</div>
</body>
</html>