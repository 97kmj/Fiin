<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Main Page</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/mypage_advertiser_requestedInfluencer.css?ver=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css">


</head>
<body>

<%@ include file="../include/header.jsp" %>

<div class = "mid">
<%@ include file="../include/sidebar_advertiser.jsp" %>
    <div id="main">
        <h2 style="font-weight:bold;text-align:left">요청한 인플루언서 목록</h2>

        <div id="mainwrap">
            <div id="campaignwrap">

                <div class="campaign-row">

                <div class="campaign" id="campaignNum1">
                    <div class = "campaign_name">
                        <text style="color: #F95757; font-weight: bold;">캠페인명</text>
                        <text style="margin-top: 10px;">오휘 콜라겐 패치 리뷰</text>
                    </div>

                    <div class="img"><img src="${pageContext.request.contextPath}/logo/influencer_image.png"
                                          style="width:200px;height:200px"></div>
                    <div class="category">뷰티  |  패션</div>
                    <div class="channel">채널명</div>

                    <div class="subject">직장인 데일리룩 올리는 블로거</div>
                    <div class="subscriberConut">구독자 수 8,000명</div>
                    <div class="status">대기 중</div>

                    <div class="applylist">
                        <table>
                            <thead>
                            <th>이름</th>
                            <th>구독자 수</th>
                            <th>채널</th>
                            <th>수락/거절</th>
                            </thead>
                            <tr>
                                <td>홍길동</td>
                                <td>10,000</td>
                                <td>유튜브</td>
                                <td><span class="btn">수락</span><span class="btn">거절</span></td>
                            </tr>
                        </table>
                    </div>
                </div>

                <div class="campaign" id="campaignNum2">
                    <div class = "campaign_name">
                        <text style="color: #F95757; font-weight: bold;">캠페인명</text>
                        <text style="margin-top: 10px;">하이센스 TV 제품 리뷰</text>
                    </div>
                    <div class="img"><img src="${pageContext.request.contextPath}/logo/influencer_image.png"
                                          style="width:200px;height:200px"></div>
                    <div class="category">뷰티  |  패션</div>
                    <div class="channel">채널명</div>

                    <div class="subject">직장인 데일리룩 올리는 블로거</div>
                    <div class="subscriberConut">구독자 수 8,000명</div>
                    <div class="status">수락</div>


                    <div class="applylist">
                        <table>
                            <thead>
                            <th>이름</th>
                            <th>구독자 수</th>
                            <th>채널</th>
                            <th>수락/거절</th>
                            </thead>
                            <tr>
                                <td>홍길동</td>
                                <td>10,000</td>
                                <td>유튜브</td>
                                <td><span class="btn">수락</span><span class="btn">거절</span></td>
                            </tr>
                            <tr>
                                <td>홍길동</td>
                                <td>10,000</td>
                                <td>유튜브</td>
                                <td><span class="btn">수락</span><span class="btn">거절</span></td>
                            </tr>
                        </table>
                    </div>
                </div>

                <div class="campaign" id="campaignNum3">
                    <div class = "campaign_name">
                        <text style="color: #F95757; font-weight: bold;">캠페인명</text>
                        <text style="margin-top: 10px;">하이센스 TV 제품 리뷰</text>
                    </div>
                    <div class="img"><img src="${pageContext.request.contextPath}/logo/influencer_image.png"
                                          style="width:200px;height:200px"></div>
                    <div class="category">뷰티  |  패션</div>
                    <div class="channel">채널명</div>

                    <div class="subject">직장인 데일리룩 올리는 블로거</div>
                    <div class="subscriberConut">구독자 수 8,000명</div>
                    <div class="statusReject">거절</div>

<%--                    <div class="applylist">--%>
<%--                        <table>--%>
<%--                            <thead>--%>
<%--                            <th>이름</th>--%>
<%--                            <th>구독자 수</th>--%>
<%--                            <th>채널</th>--%>
<%--                            <th>수락/거절</th>--%>
<%--                            </thead>--%>
<%--                            <tr>--%>
<%--                                <td>홍길동</td>--%>
<%--                                <td>10,000</td>--%>
<%--                                <td>유튜브</td>--%>
<%--                                <td><span class="btn">수락</span><span class="btn">거절</span></td>--%>
<%--                            </tr>--%>
<%--                            <tr>--%>
<%--                                <td>홍길동</td>--%>
<%--                                <td>10,000</td>--%>
<%--                                <td>유튜브</td>--%>
<%--                                <td><span class="btn">수락</span><span class="btn">거절</span></td>--%>
<%--                            </tr>--%>
<%--                            <tr>--%>
<%--                                <td>홍길동</td>--%>
<%--                                <td>10,000</td>--%>
<%--                                <td>유튜브</td>--%>
<%--                                <td><span class="btn">수락</span><span class="btn">거절</span></td>--%>
<%--                            </tr>--%>
<%--                        </table>--%>
<%--                    </div>--%>




                    <div class="applylist">
                        <table>
                            <thead>
                            <th>이름</th>
                            <th>구독자 수</th>
                            <th>채널</th>
                            <th>수락/거절</th>
                            </thead>
                            <tr>
                                <td>홍길동</td>
                                <td>10,000</td>
                                <td>유튜브</td>
                                <td><span class="btn">수락</span><span class="btn">거절</span></td>
                            </tr>
                            <tr>
                                <td>홍길동</td>
                                <td>10,000</td>
                                <td>유튜브</td>
                                <td><span class="btn">수락</span><span class="btn">거절</span></td>
                            </tr>
                            <tr>
                                <td>홍길동</td>
                                <td>10,000</td>
                                <td>유튜브</td>
                                <td><span class="btn">수락</span><span class="btn">거절</span></td>
                            </tr>
                            <tr>
                                <td>홍길동</td>
                                <td>10,000</td>
                                <td>유튜브</td>
                                <td><span class="btn">수락</span><span class="btn">거절</span></td>
                            </tr>
                        </table>
                    </div>
                </div>
                </div>

                <div class="campaign-row1">

                <div class="campaign" id="campaignNum4">

                    <div class = "campaign_name">
                        <text style="color: #F95757; font-weight: bold;">캠페인명</text>
                        <text style="margin-top: 10px;">오휘 콜라겐 패치 리뷰</text>
                    </div>

                    <div class="img"><img src="${pageContext.request.contextPath}/logo/influencer_image.png"
                                          style="width:200px;height:200px"></div>
                    <div class="category">뷰티  |  패션</div>
                    <div class="channel">채널명</div>

                    <div class="subject">직장인 데일리룩 올리는 블로거</div>
                    <div class="subscriberConut">구독자 수 8,000명</div>
                    <div class="status">대기 중</div>

                    <div class="applylist">
                        <table>
                            <thead>
                            <th>이름</th>
                            <th>구독자 수</th>
                            <th>채널</th>
                            <th>수락/거절</th>
                            </thead>
                            <tr>
                                <td>홍길동</td>
                                <td>10,000</td>
                                <td>유튜브</td>
                                <td><span class="btn">수락</span><span class="btn">거절</span></td>
                            </tr>
                        </table>
                    </div>
                </div>

                <div class="campaign" id="campaignNum5">
                    <div class = "campaign_name">
                        <text style="color: #F95757; font-weight: bold;">캠페인명</text>
                        <text style="margin-top: 10px;">하이센스 TV 제품 리뷰</text>
                    </div>
                    <div class="img"><img src="${pageContext.request.contextPath}/logo/influencer_image.png"
                                          style="width:200px;height:200px"></div>
                    <div class="category">뷰티  |  패션</div>
                    <div class="channel">채널명</div>

                    <div class="subject">직장인 데일리룩 올리는 블로거</div>
                    <div class="subscriberConut">구독자 수 8,000명</div>
                    <div class="status">수락</div>


                    <div class="applylist">
                        <table>
                            <thead>
                            <th>이름</th>
                            <th>구독자 수</th>
                            <th>채널</th>
                            <th>수락/거절</th>
                            </thead>
                            <tr>
                                <td>홍길동</td>
                                <td>10,000</td>
                                <td>유튜브</td>
                                <td><span class="btn">수락</span><span class="btn">거절</span></td>
                            </tr>
                            <tr>
                                <td>홍길동</td>
                                <td>10,000</td>
                                <td>유튜브</td>
                                <td><span class="btn">수락</span><span class="btn">거절</span></td>
                            </tr>
                        </table>
                    </div>
                </div>

                <div class="campaign" id="campaignNum6">
                    <div class = "campaign_name">
                        <text style="color: #F95757; font-weight: bold;">캠페인명</text>
                        <text style="margin-top: 10px;">하이센스 TV 제품 리뷰</text>
                    </div>
                    <div class="img"><img src="${pageContext.request.contextPath}/logo/influencer_image.png"
                                          style="width:200px;height:200px"></div>
                    <div class="category">뷰티  |  패션</div>
                    <div class="channel">채널명</div>

                    <div class="subject">직장인 데일리룩 올리는 블로거</div>
                    <div class="subscriberConut">구독자 수 8,000명</div>
                    <div class="statusReject">거절</div>

                    <div class="applylist">
                        <table>
                            <thead>
                            <th>이름</th>
                            <th>구독자 수</th>
                            <th>채널</th>
                            <th>수락/거절</th>
                            </thead>
                            <tr>
                                <td>홍길동</td>
                                <td>10,000</td>
                                <td>유튜브</td>
                                <td><span class="btn">수락</span><span class="btn">거절</span></td>
                            </tr>
                            <tr>
                                <td>홍길동</td>
                                <td>10,000</td>
                                <td>유튜브</td>
                                <td><span class="btn">수락</span><span class="btn">거절</span></td>
                            </tr>
                            <tr>
                                <td>홍길동</td>
                                <td>10,000</td>
                                <td>유튜브</td>
                                <td><span class="btn">수락</span><span class="btn">거절</span></td>
                            </tr>
                        </table>
                    </div>
                </div>


                <div class="applylist">
                    <table>
                        <thead>
                        <th>이름</th>
                        <th>구독자 수</th>
                        <th>채널</th>
                        <th>수락/거절</th>
                        </thead>
                        <tr>
                            <td>홍길동</td>
                            <td>10,000</td>
                            <td>유튜브</td>
                            <td><span class="btn">수락</span><span class="btn">거절</span></td>
                        </tr>
                        <tr>
                            <td>홍길동</td>
                            <td>10,000</td>
                            <td>유튜브</td>
                            <td><span class="btn">수락</span><span class="btn">거절</span></td>
                        </tr>
                        <tr>
                            <td>홍길동</td>
                            <td>10,000</td>
                            <td>유튜브</td>
                            <td><span class="btn">수락</span><span class="btn">거절</span></td>
                        </tr>
                        <tr>
                            <td>홍길동</td>
                            <td>10,000</td>
                            <td>유튜브</td>
                            <td><span class="btn">수락</span><span class="btn">거절</span></td>
                        </tr>
                    </table>
                </div>
            </div>

            <div id="showlist">
            </div>
                </div>
            </div>
        </div>
</div>

<%@ include file="../include/footer.jsp" %>


<!-- 외부 JavaScript 파일 링크 -->
<script src="../../script.js"></script>

</body>
</html>
