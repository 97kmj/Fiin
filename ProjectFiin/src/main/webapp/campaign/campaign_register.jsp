<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Main Page</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/campaign_register.css?ver=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css">
</head>
<body>

<%@ include file="../include/header.jsp" %>

<div class="bodyBackground">

    <!-- 통합된 폼 -->
    <form action="/submit" method="post" enctype="multipart/form-data">
		<h2>캠페인 등록하기</h2>
        <div id="adChannel">
            <h3>희망 광고 채널</h3>
            <div id="channel">
                <label class="label" for="youtube">
                    <div><img src="${pageContext.request.contextPath}/image/youtube.png" alt=""></div>
                    <input type="checkbox" name="ad" id="youtube" value="youtube">
                </label>
                <label class="label" for="insta">
                    <div><img src="${pageContext.request.contextPath}/image/instagram.png" alt=""></div>
                    <input type="checkbox" name="ad" id="insta" value="insta">
                </label>
                <label class="label" for="blog">
                    <div><img src="${pageContext.request.contextPath}/image/blog.png" alt=""></div>
                    <input type="checkbox" name="ad" id="blog" value="blog">
                </label>
            </div>
        </div>

        <div class="companyInfo">
            <div class="campaignField">
                <div class="form-group">
                    <label for="companyName">업체명</label>
                    <input type="text" id="companyName" name="companyName">
                </div>
                <div class="form-group">
                    <label for="companyUrl">업체 URL</label>
                    <input type="text" id="companyUrl" name="companyUrl">
                </div>
                <div class="form-group">
                    <label for="campaignName">캠페인 이름</label>
                    <input type="text" id="campaignName" name="campaignName">
                </div>
                <div class="form-group">
                    <label for="productName">상품명</label>
                    <input type="text" id="productName" name="productName">
                </div>
            </div>
            <img id="uploadImage" src="${pageContext.request.contextPath}/image/upload.png" alt="">
            <!-- 파일 입력 필드 -->
            <input type="file" id="fileInput" name="fileInput"/>
        </div>

        <div class="form-group-group">
            <div class="form-group1">
                <label for="uploadPeriod">업로드 기간</label>
                <select id="uploadPeriod" name="uploadPeriod">
                    <option value="1주일">1주일 500 point</option>
                    <option value="2주일">2주일 1000 point</option>
                    <option value="3주일">3주일 1500 point</option>
                </select>
            </div>

            <div class="form-group1">
                <label for="adPeriod">광고 기간</label>
                <select id="adPeriod" name="adPeriod">
                    <option value="select">select Date</option>
                    <option value="start_date">start Date</option>
                    <option value="end_date">end Date</option>
                </select>
            </div>
        </div>

        <div class="categoryContainer">
            <div class="contentHeader">
                <h3 class="categoryH1">컨텐츠 카테고리 선택</h3>
                <p>등록하고자 하는 캠페인 주제를 한 가지 선택해주세요.</p>
            </div>
            <div class="first3">
                <div class="category">
                    <input type="radio" id="beauty" name="category" value="beauty"
                           class="radio-input">
                    <label for="beauty" class="radio-label">
                        <img src="${pageContext.request.contextPath}/image/beauty.png" alt="뷰티" class="radio-image">
                    </label>

                </div>
                <div class="category">
                    <input type="radio" id="fashion" name="category" value="fashion"
                           class="radio-input">
                    <label for="fashion" class="radio-label">
                        <img src="${pageContext.request.contextPath}/image/fashion.png" alt="패션" class="radio-image">
                    </label>
                </div>
                <div class="category">
                    <input type="radio" id="sport" name="category" value="sport"
                           class="radio-input">
                    <label for="sport" class="radio-label">
                        <img src="${pageContext.request.contextPath}/image/sport.png" alt="스포츠" class="radio-image">
                    </label>
                </div>
            </div>
            <div class="second3">
                <div class="category">
                    <input type="radio" id="travel" name="category" value="travel"
                           class="radio-input">
                    <label for="travel" class="radio-label">
                        <img src="${pageContext.request.contextPath}/image/travel.png" alt="여행" class="radio-image">
                    </label>
                </div>
                <div class="category">
                    <input type="radio" id="food" name="category" value="food" class="radio-input">
                    <label for="food" class="radio-label">
                        <img src="${pageContext.request.contextPath}/image/food.png" alt="식품" class="radio-image">
                    </label>
                </div>
                <div class="category">
                    <input type="radio" id="life" name="category" value="life" class="radio-input">
                    <label for="life" class="radio-label">
                        <img src="${pageContext.request.contextPath}/image/life.png" alt="생활용품" class="radio-image">
                    </label>
                </div>
            </div>
        </div>

        <div class="requirement">
            <div class="requirement-label">요구 사항</div>
            <label>
                <textarea class="requirement-field" name="requirement"
                          placeholder="여기에 요구 사항을 작성하세요..."></textarea>
            </label>
        </div>

        <div class="bottom-button">
            <button type="submit">등록하기</button>
            <button type="button" onclick="window.history.back()">뒤로가기</button>
        </div>



    </form>

</div>

<%@ include file="../include/footer.jsp" %>

<%--    //푸터가 정 사이즈가 아니고, 그리고 우선 form안에 정보 다 넣었음--%>
<%--    // 사이즈 조정 필요--%>
</body>
</html>