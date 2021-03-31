<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>리뷰게시판</title>
    <%@ include file="../main/import.jspf"%>
    <style type="text/css">

        ul, li{
            list-style:none;
/*            text-align:center;
            padding:0;
            margin:0;*/
        }

        #mainWrapper{
            width: 1000px;
            margin: 0 auto; /*가운데 정렬*/
        }

        #mainWrapper > ul > li:first-child {
            text-align: center;
            font-size:14pt;
            height:40px;
            vertical-align:middle;
            line-height:30px;
        }

        #ulTable {margin-top:10px;}


        #ulTable > li:first-child > ul > li {
            background-color:#c9c9c9;
            font-weight:bold;
            text-align:center;
        }

        #ulTable > li > ul {
            clear:both;
            padding:0px;
            position:relative;
            min-width:40px;
        }
        #ulTable > li > ul > li {
            float:left;
            font-size:10pt;
            border-bottom:1px solid silver;
            vertical-align:baseline;
        }

        #ulTable > li > ul > li:first-child               {width:10%;} /*No 열 크기*/
        #ulTable > li > ul > li:first-child +li           {width:40%;} /*제목 열 크기*/
        #ulTable > li > ul > li:first-child +li+li        {width:20%;} /*작성일 열 크기*/
        #ulTable > li > ul > li:first-child +li+li+li     {width:20%;} /*작성자 열 크기*/
        #ulTable > li > ul > li:first-child +li+li+li+li{width:10%;} /*조회수 열 크기*/

        #divPaging {
            clear:both;
            margin:0 auto;
            width:220px;
            height:50px;
        }

        #divPaging > div {
            float:left;
            width: 30px;
            margin:0 auto;
            text-align:center;
        }

        #liSearchOption {clear:both;}
        #liSearchOption > div {
            margin:auto;
            margin: 0px 0px 0px 40px;
            width:auto;
            height:10px;
        }

        .paging {
            list-style: none;
            display: flex;
            justify-content: center;
        }
        .paging>li {
            border: 1px solid #606060;
            width: 3em;
            height: 3em;
            text-align: center;
            line-height: 3em;
            margin-right: 0.25em;
        }
        .paging>li:first-child, .paging>li:nth-child(2),
        .paging>li:nth-last-child(2), .paging>li:last-child
        {
            border: none;
            width: 2.2em;
            font-size: 1.2em;
            line-height: 2.6em;
        }
        .paging li i {
            color: #808080;
        }
        .paging li>a {
            text-decoration: none;
            color: #606060;
            font-weight: 400;
        }
        .now {
            background-color: #1f1f1f;
            color: whitesmoke;
            font-weight: 500;
            text-decoration: underline;
        }
        .paging li:not(li.now):hover {
            cursor: pointer;
            text-decoration: underline;
        }
        .paging .disable {
            display: none;
        }
    </style>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<%@ include file="../main/header.jspf" %>
<div class="d-flex justify-content-center">
    <div id="container">
       <div id="mainWrapper">
            <ul>
                <!-- 게시판 제목 -->
                <li>리뷰 게시판</li>
                <!-- 게시판 목록  -->
                <li>
                    <ul class="nav nav-pills nav-justified">
                        <li class="nav-item">
                            <a href="/community/goReview">전체</a>
                        </li>
                        <li class="nav-item">
<%--                            <a href="#" onclick='goAllList("best", "정기구독")'>정기구독</a>--%>
                            <a href="#" onclick='goCateBest("정기구독")'>정기구독</a>
                        </li>
                        <li class="nav-item">
<%--                            <a href="#" onclick='goAllList("best", "꽃다발")'>꽃다발</a>--%>
                            <a href="#" onclick='goCateBest("꽃다발")'>꽃다발</a>
                        </li>
                        <li class="nav-item">
<%--                            <a href="#" onclick='goAllList("best", "클래스")'>클래스</a>--%>
                            <a href="#" onclick='goCateBest("클래스")'>클래스</a>
                        </li>
                        <li class="nav-item">
<%--                            <a href="#" onclick='goAllList("best", "소품샵")'>소품샵</a>--%>
                            <a href="#" onclick='goCateBest("소품샵")'>소품샵</a>
                        </li>
                        <!-- 검색 폼 영역 -->
                        <form class="d-flex">
                            <li id='liSearchOption' class="list-group list-group-horizontal">
                                <div>
                                    <select id='selSearchOption' >
                                        <option value='A'>제목+내용</option>
                                        <option value='T'>제목</option>
                                        <option value='C'>내용</option>
                                    </select>
<%--                                    <input id='txtKeyWord' type="text" name="searchtxt" value=""/>
                                    <input type='button' value='검색'/>--%>
                                </div>
                            </li>
                            <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                            <button class="btn btn-outline-success" type="submit">검색</button>
                        </form>
                    </ul>
                    <ul class="nav justify-content-around reviewBox">
                        <li class="nav-item-3">
                            <a class="nav-link" id="${param.category}" href="#" onclick='goAllList("best", "${param.category}")'>베스트 리뷰</a>
                        </li>
                        <li class="nav-item-3">
                            <a class="nav-link" id="${param.category}" href="#" onclick='goAllList("allList", "${param.category}")'>전체리뷰</a>
                        </li>
                    </ul>
                    <ul id ="ulTable" class="accordion">
                        <li>
                            <ul>
                                <li>별점</li>
                                <li>제목</li>
                                <li>작성일</li>
                                <li>작성자</li>
                                <li>좋아요</li>
                            </ul>
                        </li>
                        <!-- 게시물이 출력될 영역 -->
                        <c:forEach var="bestAllList" items="${bestRList}">
                        <li>
                            <ul id="acco_click">
                                <li class="text-center"><div>${bestAllList.star}</div></li>
                                <li class="text-center">${bestAllList.name}</li>
                                <li class="text-center"><div>${bestAllList.regDate}</div></li>
                                <li class="text-center"><div>${bestAllList.memberId}</div></li>
                                <li class="text-center"><div>${bestAllList.likeCount}</div></li>
                            </ul>
                            <div class="accordion_count">
                                <div>
                                    <p>${bestAllList.content}</p>
                                </div>

                                <div>
                                    <c:if test="${not empty bestAllList.image}">
                                        <div>
                                            <img src="/static/upload/community/review/${bestAllList.image}">
                                        </div>
                                    </c:if>
                                </div>
                            </div>
                        </li>
                        </c:forEach>
                    </ul>
                    <%--페이징 처리--%>
                    <ol class="paging">
                        <c:choose>
                            <c:when test="${pvo.nowBlock eq 1}">
                                <li class="disable"><i class="fas fa-angle-double-left"></i></li>
                                <li class="disable"><i class="fas fa-angle-left"></i></li>
                            </c:when>
                            <c:when test="${pvo.nowBlock > 1}">
                                <li onclick='goPage("allList", "${param.category}", "1")'><i class="fas fa-angle-double-left"></i></li>
                                <li onclick='goPage("allList", "${param.category}", "${pvo.nowPage - 5}")'><i class="fas fa-angle-left"></i></li>
                            </c:when>
                        </c:choose>

                        <c:forEach var="pageNo" begin="${pvo.beginPage}" end="${pvo.endPage}">
                            <c:if test="${pageNo == pvo.nowPage }">
                                <li class="now">${pageNo}</li>
                            </c:if>
                            <c:if test="${pageNo ne pvo.nowPage}">
                                <li onclick='goPage("allList", "${param.category}", "${pageNo}")'>${pageNo}</li>
                            </c:if>
                        </c:forEach>

                        <c:choose>
                            <c:when test="${pvo.nowBlock eq pvo.totalBlock}">
                                <li class="disable"><i class="fas fa-angle-right"></i></li>
                                <li class="disable"><i class="fas fa-angle-double-right"></i></li>
                            </c:when>
                            <c:when test="${pvo.nowBlock < pvo.totalBlock}">
                                <li onclick='goPage("allList", "${param.category}", "${pvo.nowPage + 5}")'><i class="fas fa-angle-right"></i></li>
                                <li onclick='goPage("allList", "${param.category}", "${pvo.totalPage}")'><i class="fas fa-angle-double-right"></i></li>
                            </c:when>
                        </c:choose>
                    </ol>
                </li>
            </ul>
        </div>
    </div>
</div>
<script>

</script>


<%@ include file="../main/footer.jspf"%>
</body>
<script>
    
    function goCateBest(category) {
        location.href="/community/category/goReview?category="+category;
    }

    function goPage(tab, paramType, page) {
        goAllList(tab, paramType, page)
    }

    function goAllList(tab, paramType, page) {
        $(".paging").css("display", "flex");
        if(tab == "best"){
            $(".paging").css("display", "none");
        }
        console.log(paramType);
        let dataParam = {
            category : paramType,
            tab : tab,
            page : page
        };
        $.ajax({
            url: '/community/api/category/goAllReview',
            type: 'get',
            dataType: "json",
            data: dataParam,

            success: function (result) {
               let dispHtml = "";
                dispHtml += '<li><ul><li>별점</li><li>제목</li><li>작성일</li><li>작성자</li><li>좋아요</li></ul></li>';
                $.each(result, function () {
                    dispHtml += "<li>";
                    dispHtml +=   '<ul id="acco_click">';
                    dispHtml +=   '<li class="text-center"><div>' + this.star + '</div></li>';
                    dispHtml +=   '<li class="text-center">' + this.name + '</li>'
                                + '<li class="text-center"><div>' + this.regDate + '</div></li>'
                                + '<li class="text-center"><div>' +this.memberId + '</div></li>'
                                + '<li class="text-center"><div>' +  this.likeCount + '</div></li>'
                                + '</ul>'
                                + '<div class="accordion_count">'
                                    + '<div>'
                                        + '<p>' + this.content + '</p>'
                                    + '</div>'
                                    + '<div>';
                        if(this.image != null) {
                                dispHtml += '<div>'
                                             + '<img src="/static/upload/community/review/' + this.image + '">'
                                          + '</div>';
                        }
                    dispHtml += "</div></div></li>";
                });
                // $("#ulTable").html(dispHtml);
                $("#ulTable").innerText(result);

                $(".accordion ul").next(".accordion_count").slideToggle("fast")
                    .siblings(".accordion_count:visible").slideUp("fast");
                $(".accordion ul").click(function(){
                    $(this).next(".accordion_count").slideToggle("fast")
                        .siblings(".accordion_count:visible").slideUp("fast");
                    $(this).toggleClass("active");
                });
            }
        });
    }

    $().ready(function (){
        $(".paging").css("display", "none");
    });

    $(document).ready(function (){
        $(".accordion ul").next(".accordion_count").slideToggle("fast")
            .siblings(".accordion_count:visible").slideUp("fast");
    });


    $(".accordion ul").click(function(){
        $(this).next(".accordion_count").slideToggle("fast")
            .siblings(".accordion_count:visible").slideUp("fast");
        $(this).toggleClass("active");
    });



</script>

</html>