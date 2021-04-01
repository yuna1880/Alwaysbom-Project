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

        .left {
            text-align : left;
        }
    </style>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>

    </script>
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
                            <a href="#" onclick="goBestList()">전체</a>
                        </li>
                        <li class="nav-item">
                            <a href="#" onclick='goBestList("정기구독")'>정기구독</a>
                        </li>
                        <li class="nav-item">
                            <a href="#" onclick='goBestList("꽃다발")'>꽃다발</a>
                        </li>
                        <li class="nav-item">
                            <a href="#" onclick='goBestList("클래스")'>클래스</a>
                        </li>
                        <li class="nav-item">
                            <a href="#" onclick='goBestList("소품샵")'>소품샵</a>
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
                            <a class="nav-link" href="/community/goReview">베스트 리뷰</a>
                        </li>
                        <li class="nav-item-3">
                            <a class="nav-link" id="${category}" href="#" onclick="goAllList(${category})">전체리뷰</a>
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
                                            <img src="${bestAllList.image}">
                                        </div>
                                    </c:if>
                                </div>
                            </div>
                        </li>
                        </c:forEach>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</div>

<%@ include file="../main/footer.jspf"%>
</body>
<script>
    function goAllList(paramType) {
        let dataParam = {
            category : paramType
        };
        $.ajax({
            url: '/community/api/category/goAllReview',
            type: 'post',
            dataType: "json",
            data: dataParam,
            success: function (result) {
                alert("제발 나와라요~~~~~~~~~~")
            }
        });
    }

    function goBestList(paramType) {

    }

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