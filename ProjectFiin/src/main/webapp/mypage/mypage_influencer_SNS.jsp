<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>MyPage Influencer SNS</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/mypage_influencer_SNS.css?ver=1">

</head>
<body>

<%@ include file="../include/header.jsp" %>

<div id="container">

    <%@ include file="../include/sidebar_influencer.jsp" %>

    <div id="main">
        <h2>SNS 관리</h2>

        <div id="mainwrap">

            <div class="blog">
                <div class="blog-first">
                    <img src="${pageContext.request.contextPath}/logo/blog_icon.png" alt="">
                    <div class="blogText">블로그</div>
                </div>


                <div class="blog-link">
                    <a href="">https:blog.naver.com/</a>
                    <input type="text" value="kosta123">
                </div>

                <div class="blog_bottom">
                    <input type="button" value="연동하기" id="connect_to_blog">
                </div>
            </div>


            <div class="instagram">
                <div class="instagram-first">
                    <img src="${pageContext.request.contextPath}/logo/instagram_icon.png" alt="">
                    <div class="instaText">인스타그램</div>
                </div>


                <div class="insta-link">
                    <a href="">https:instagram.naver.com/</a>
                    <input type="text" value="kosta123">
                </div>

                <div class="insta_bottom">
                    <input type="button" value="연동하기" id="connect_to_insta">
                </div>
            </div>


            <div class="youtube">
                <div class="youtube-first">
                    <img src="${pageContext.request.contextPath}/logo/youtube_icon.png" alt="">
                    <div class="youtubeText">유튜브</div>
                </div>


                <div class="youtube-link">
                    <a href="">https:blog.youtube.com/</a>
                    <input type="text" value="kosta123">
                </div>

                <div class="youtube_bottom">
                    <input type="button" value="연동하기" id="connect_to_youtube">
                </div>
            </div>

        </div>
        <div id="showlist">
        </div>


    </div>
</div>

</div>


<%@ include file="../include/footer.jsp" %>


<!-- 외부 JavaScript 파일 링크 -->
<script src="../../script.js"></script>

</body>
</html>
