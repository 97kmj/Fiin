<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Main Page</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/influencer_register.css?ver=1">
  	 <link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css">

</head>
<body>

<%@ include file="../include/header.jsp" %>


<div class="bodyBackground">

    <div id="main">

        <form action="" method="post"
              enctype="multipart/form-data">

            <div class="main_first_line">
                <div class="first_line">
                    <div class="influencer_register">
                        <h2>인플루언서 등록하기</h2>
                    </div>

                    <div class="short_introduction">
                        <label for="short_introduction">한 줄 소개</label>
                        <input type="text" id="short_introduction" name="한줄요약">
                    </div>
                </div>

                <div class="first_line_image">
                    <img id="uploadImage" src="${pageContext.request.contextPath}/image/upload.png" alt="Upload Image" style="cursor: pointer">
                    <input type="file" id="fileInput" style="display: none;"/>
                </div>
            </div>


            <%--            --활동채널~채널URL // 유튜브--%>
            <div class="main_second_line">
                <div class="select_channel">
                    <input type="checkbox" id="active_youtube">
                    <label for="active_youtube">활동 채널</label>
                    <img src="${pageContext.request.contextPath}/image/youtube.png" alt="youtube" class="radio-image">
                </div>

                <div class="channel_name">
                    <label for="youtube_channel">채널명</label>
                    <input type="text" id="youtube_channel">

                    <label for="youtube_subscriber">구독자 수</label>
                    <input type="text" id="youtube_subscriber">

                </div>

                <div class="channel_url">
                    <label for="youtube_url">채널 URL</label>
                    <input type="text" id="youtube_url">
                </div>
            </div>

            <%--            --활동채널~채널URL // 인스타--%>
            <div class="main_second_line">
                <div class="select_channel">
                    <input type="checkbox" id="active_instagram">
                    <label for="active_instagram">활동 채널</label>
                    <img src="${pageContext.request.contextPath}/image/instagram.png" alt="instagram" class="radio-image">
                </div>

                <div class="channel_name">
                    <label for="instagram_channel">채널명</label>
                    <input type="text" id="instagram_channel">

                    <label for="instagram_subscriber">구독자 수</label>
                    <input type="text" id="instagram_subscriber">

                </div>

                <div class="channel_url">
                    <label for="instagram_url">채널 URL</label>
                    <input type="text" id="instagram_url">
                </div>
            </div>


            <%--            --활동채널~채널URL // 블로그--%>
            <div class="main_second_line">
                <div class="select_channel">
                    <input type="checkbox" id="active_blog">
                    <label for="active_blog">활동 채널</label>
                    <img src="${pageContext.request.contextPath}/image/blog.png" alt="youtube" class="radio-image">
                </div>

                <div class="channel_name">
                    <label for="blog_channel">채널명</label>
                    <input type="text" id="blog_channel">

                    <label for="blog_subscriber">구독자 수</label>
                    <input type="text" id="blog_subscriber">

                </div>

                <div class="channel_url">
                    <label for="blog_url">채널 URL</label>
                    <input type="text" id="blog_url">
                </div>
            </div>


            <h1 class="categoryH1">주요 활동 카테고리</h1>

            <div class="categoryContainer">
                <%--    <div class="contentHeader">--%>

                <%--    <p>등록하고자 하는 캠페인 주제를 한 가지 선택해주세요.</p>--%>
                <%--    </div>--%>


                <div class="first3">
                    <div class="category">
                        <label for="beauty">
                            <img src="${pageContext.request.contextPath}/image/beauty.png" alt="뷰티" class="radio-image">
                        </label>
                        <input type="radio" id="beauty" name="category" value="beauty">
                    </div>

                    <div class="category">
                        <label for="fashion">
                            <img src="${pageContext.request.contextPath}/image/fashion.png" alt="패션" class="radio-image">
                        </label>
                        <input type="radio" id="fashion" name="category" value="fashion">
                    </div>

                    <div class="category">
                        <label for="sport">
                            <img src="${pageContext.request.contextPath}/image/sport.png" alt="스포츠" class="radio-image">
                        </label>
                        <input type="radio" id="sport" name="category" value="sport">
                    </div>
                </div>

                <div class="second3">
                    <div class="category">
                        <label for="travel">
                            <img src="${pageContext.request.contextPath}/image/travel.png" alt="여행" class="radio-image">
                        </label>
                        <input type="radio" id="travel" name="category" value="travel">
                    </div>

                    <div class="category">
                        <label for="food">
                            <img src="${pageContext.request.contextPath}/image/food.png" alt="식품" class="radio-image">
                        </label>
                        <input type="radio" id="food" name="category" value="food">
                    </div>

                    <div class="category">
                        <label for="life">
                            <img src="${pageContext.request.contextPath}/image/life.png" alt="생활용품" class="radio-image">
                        </label>
                        <input type="radio" id="life" name="category" value="life">
                    </div>
                </div>
            </div>

            <%--</form>--%>


            <div class="requirement">
                <div class="requirement-label">소개글 작성</div>
                <label>
                    <textarea class="requirement-field" placeholder="소개글을 작성 해주세요."></textarea>
                </label>
            </div>

            <div class="bottom-button">
                <button>등록하기</button>
                <button>뒤로가기</button>
            </div>

            <%--    //body background--%>
        </form>

        <%--    </div>--%>

        <%--        <!-- 외부 JavaScript 파일 링크 -->--%>


    </div>
</div>

<%@ include file="../include/footer.jsp" %>

<script>
	//이미지 클릭 시, "찾기"로 이동
	document.getElementById('uploadImage').addEventListener('click', function() {
	  document.getElementById('fileInput').click();
	});
</script>
</body>
</html>
