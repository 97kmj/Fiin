<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/reset.css">
<link rel="stylesheet" href="../css/mypage_info.css?ver=1">
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
	<%@ include file="../include/header_login.jsp" %>
	<div class="edit_container">
		<%@ include file="../include/sidebar_advertiser.jsp" %>
		
		<div class="main">
			<h2>프로필 관리</h2>
			<form action="#" class="edit_form">
				  <label for="email" class="input_label">
		            이메일<span>*</span> <span class="br_style"><br /></span>
		            <input
		              type="text"
		              id="email"
		              value="kosta@kosta.com"
		              class="input_style"
		              name="email"
		              disabled
		            />
		          </label>
				  <label for="password" class="input_label">
           			 	비밀번호<span>*</span> <span class="br_style"><br /></span>
			             <input
			                type="password"
			                id="password"
			                value="***********"
			                class="input_style"
			       			name="password"
			             />
	          	  </label>
		          <label for="name" class="input_label">
		            이름<span>*</span> <span class="br_style"><br /></span>
		            <input
		              type="text"
		              id="name"
		              value="홍길동"
		              class="input_style"
		              name="name"
		            />
		          </label>
		          <label for="name" class="input_label">
		            업체명<span>*</span> <span class="br_style"><br /></span>
		            <input
		              type="text"
		              id="companyname"
		              value="코스타"
		              class="input_style"
		              name="companyname"
		            />
		          </label>
		          <label for="number" class="input_label">
		            휴대폰번호<span>*</span> <span class="br_style"><br /></span>
		              <input
		                type="text"
		                id="number"
						value="01012345678"
		                class="input_style"
		                name="number"
		              />
		          </label>
		          <label for="address" class="input_label">
		            주소<span>*</span> <span class="br_style"><br /></span>
		            <div class="input_btn_wrap">
		              <input
		                type="text"
		                value="서울특별시 금천구 가산디지털1로 70"
		                class="input_btn_style"
		                name="address"
		                id="address"
		                disabled
		              />
		              <button type="button" class="address_btn">주소검색</button>
		            </div>
		            <input
			            type="text"
			            value="호서대벤처타워 9층"
			            class="input_btn_style"
			            name="addressdetail"
			            id="addressdetail"
			            disabled
		          	/>
		          </label>
          		  <input type="submit" class="edit_btn" value="수정하기">
			</form>
		</div>
	</div>
</body>
</html>