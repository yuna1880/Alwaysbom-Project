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

        #ulTable, #ulTablebar {margin-top:10px;}


        #ulTablebar > li:first-child > ul > li {
            background-color:#c9c9c9;
            font-weight:bold;
            text-align:center;
        }
        #ulTable > li:first-child > ul > li {
            text-align:center;
        }

        #ulTable > li > ul > button, #ulTablebar > li > ul {
            clear:both;
            padding:0px;
            position:relative;
            min-width:40px;
        }
        #ulTable > li > ul > button > li, #ulTablebar > li > ul > li {
            float:left;
            font-size:10pt;
            border-bottom:1px solid silver;
            vertical-align:baseline;
        }

        #ulTable > li > ul > button > li:first-child, #ulTablebar > li > ul > li:first-child               {width:10%;} /*No 열 크기*/
        #ulTable > li > ul > button > li:first-child +li, #ulTablebar > li > ul > li:first-child +li           {width:40%;} /*제목 열 크기*/
        #ulTable > li > ul > button > li:first-child +li+li, #ulTablebar > li > ul > li:first-child +li+li        {width:20%;} /*작성일 열 크기*/
        #ulTable > li > ul > button > li:first-child +li+li+li, #ulTablebar > li > ul > li:first-child +li+li+li     {width:20%;} /*작성자 열 크기*/
        #ulTable > li > ul > button > li:first-child +li+li+li+li, #ulTablebar > li > ul > li:first-child +li+li+li+li{width:10%;} /*조회수 열 크기*/
        .headacco {
            padding: 0px;
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
                            <a class="nav-link" id="${param.category}" href="#" onclick='goBestList("best", "${param.category}")'>베스트 리뷰</a>
                        </li>
                        <li class="nav-item-3">
                            <a class="nav-link" id="${param.category}" href="#" onclick='goAllList("allList", "${param.category}")'>전체리뷰</a>
                        </li>
                    </ul>
                    <ul id ="ulTablebar">
                        <li>
                            <ul>
                                <li>별점</li>
                                <li>제목</li>
                                <li>작성일</li>
                                <li>작성자</li>
                                <li>좋아요</li>
                            </ul>
                        </li>
                    </ul>
                        <!-- 게시물이 출력될 영역 -->
                    <ul id="ulTable" class="accordion">
                        <c:forEach var="bestAllList" items="${bestRList}">
                        <li class='allBoxes accordion-item'>
                            <ul id="head${bestAllList.idx}" class="accordion-header headacco">
                                <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#col${bestAllList.idx}" aria-expanded="false" aria-controls="col${bestAllList.idx}">
                                    <li class="text-center">
                                        <div>
                                            <c:if test="${bestAllList.star eq 5}">
                                                <img src="/static/icons/starstar.png" class="" alt="star"
                                                     title="별" height="15" width="15">
                                                <img src="/static/icons/starstar.png" class="" alt="star"
                                                     title="별" height="15" width="15">
                                                <img src="/static/icons/starstar.png" class="" alt="star"
                                                     title="별" height="15" width="15">
                                                <img src="/static/icons/starstar.png" class="" alt="star"
                                                     title="별" height="15" width="15">
                                                <img src="/static/icons/starstar.png" class="" alt="star"
                                                     title="별" height="15" width="15">
                                            </c:if>
                                            <c:if test="${bestAllList.star eq 4}">
                                                <img src="/static/icons/starstar.png" class="" alt="star"
                                                     title="별" height="15" width="15">
                                                <img src="/static/icons/starstar.png" class="" alt="star"
                                                     title="별" height="15" width="15">
                                                <img src="/static/icons/starstar.png" class="" alt="star"
                                                     title="별" height="15" width="15">
                                                <img src="/static/icons/starstar.png" class="" alt="star"
                                                     title="별" height="15" width="15">
                                                <img src="/static/icons/sibalstar.png" class="" alt="star"
                                                     title="별" height="15" width="15">
                                            </c:if>
                                            <c:if test="${bestAllList.star eq 3}">
                                                <img src="/static/icons/starstar.png" class="" alt="star"
                                                     title="별" height="15" width="15">
                                                <img src="/static/icons/starstar.png" class="" alt="star"
                                                     title="별" height="15" width="15">
                                                <img src="/static/icons/starstar.png" class="" alt="star"
                                                     title="별" height="15" width="15">
                                                <img src="/static/icons/sibalstar.png" class="" alt="star"
                                                     title="별" height="15" width="15">
                                                <img src="/static/icons/sibalstar.png" class="" alt="star"
                                                     title="별" height="15" width="15">
                                            </c:if>
                                            <c:if test="${bestAllList.star eq 2}">
                                                <img src="/static/icons/starstar.png" class="" alt="star"
                                                     title="별" height="15" width="15">
                                                <img src="/static/icons/starstar.png" class="" alt="star"
                                                     title="별" height="15" width="15">
                                                <img src="/static/icons/sibalstar.png" class="" alt="star"
                                                     title="별" height="15" width="15">
                                                <img src="/static/icons/sibalstar.png" class="" alt="star"
                                                     title="별" height="15" width="15">
                                                <img src="/static/icons/sibalstar.png" class="" alt="star"
                                                     title="별" height="15" width="15">
                                            </c:if>
                                            <c:if test="${bestAllList.star eq 1}">
                                                <img src="/static/icons/starstar.png" class="" alt="star"
                                                     title="별" height="15" width="15">
                                                <img src="/static/icons/sibalstar.png" class="" alt="star"
                                                     title="별" height="15" width="15">
                                                <img src="/static/icons/sibalstar.png" class="" alt="star"
                                                     title="별" height="15" width="15">
                                                <img src="/static/icons/sibalstar.png" class="" alt="star"
                                                     title="별" height="15" width="15">
                                                <img src="/static/icons/sibalstar.png" class="" alt="star"
                                                     title="별" height="15" width="15">
                                            </c:if>
                                            <c:if test="${bestAllList.star eq 0}">
                                                <img src="/static/icons/sibalstar.png" class="" alt="star"
                                                     title="별" height="15" width="15">
                                                <img src="/static/icons/sibalstar.png" class="" alt="star"
                                                     title="별" height="15" width="15">
                                                <img src="/static/icons/sibalstar.png" class="" alt="star"
                                                     title="별" height="15" width="15">
                                                <img src="/static/icons/sibalstar.png" class="" alt="star"
                                                     title="별" height="15" width="15">
                                                <img src="/static/icons/sibalstar.png" class="" alt="star"
                                                     title="별" height="15" width="15">
                                            </c:if>
                                        </div>
                                    </li>
                                    <li class="text-center">${bestAllList.name}</li>
                                    <li class="text-center"><div>${bestAllList.regDate}</div></li>
                                    <li class="text-center"><div>${bestAllList.memberId}</div></li>
                                    <li class="text-center"><div>${bestAllList.likeCount}</div></li>
                                </button>
                            </ul>
                            <div id="col${bestAllList.idx}" class="accordion-collapse collapse" aria-labelledby="head${bestAllList.idx}" data-bs-parent="#ulTable">
                                <div class="accordion-body">
                                    <div>
                                        <p>${bestAllList.content}</p>
                                    </div>

                                    <div>
                                        <c:if test="${not empty bestAllList.image}">
                                            <div>

                                                <img src="/static/upload/community/review/${bestAllList.image}" alt="아아아아악">

                                            </div>
                                        </c:if>
                                    </div>
                                </div>
                            </div>
                        </li>
                        </c:forEach>
                    </ul>
                    <%--페이징 처리--%>
                </li>
                <li>
                </li>
            </ul>
           <button id="searchMoreNotify" class="btn btn-outline-primary btn-block col-sm-10 mx-auto" style="display: none">더 보기</button>

       </div>
    </div>
</div>

<%@ include file="../main/footer.jspf"%>
</body>
<script>
    function goCateBest(category) {
        location.href="/community/category/goReview?category="+category;
    }

    function goAllList(tab, paramType) {
        $('.allBoxes').remove();
        $("#searchMoreNotify").css("display", "block");
        let startIndex = 1;	// 인덱스 초기값
        let searchStep = 1;	// 5개씩 로딩
        let _endIndex = 1;
        goApiAllList(startIndex, searchStep, _endIndex);
        // $(".accordion_count").css("display", "none");
    }

    function goApiAllList(startIndex, searchStep, _endIndex){
        // 읽은 알림 총 갯수
        let oldListCnt = '${oldListCnt}';
        console.log('${oldListCnt}');

        // 조회 인덱스
        // let startIndex = 1;	// 인덱스 초기값
        // let searchStep = 1;	// 5개씩 로딩

        // 페이지 로딩 시 첫 실행
        readOldNotify(startIndex, _endIndex);

        // $(".accordion_count").css("display", "none");

        // 더보기 클릭시
        $('#searchMoreNotify').click(function(e){
            e.stopPropagation();
            e.preventDefault();
            e.stopImmediatePropagation();
            startIndex = 1;
            _endIndex += searchStep;	// endIndex설정



            console.log(startIndex + "클릭할떄 발생" + searchStep);
            readOldNotify(startIndex, _endIndex);
            if(_endIndex >= oldListCnt){
                $("#searchMoreNotify").css("display", "none");
            }
            // $(".accordion_count").css("display", "none");
        });

        // 더보기 실행함수 **
        function readOldNotify(index, _endIndex){
            // _endIndex = index+searchStep-1;	// endIndex설정
            // $(".accordion_count").css("display", "none");
            console.log(index + "index");
            console.log(searchStep + "search")
            console.log(_endIndex + "_endIndex");
            $.ajax({
                type: "post",
                async: "true",
                dataType: "json",
                data: {
                    category : '${category}',
                    startIndex: index,
                    endIndex: _endIndex
                },
                url: "/community/api/category/goAllReview",
                success: function (data) {
                    console.dir(data);
                    let dispHtml = "";
                    $.each(data, function () {
                        dispHtml += '<li class="allBoxes accordion-item">';
                        dispHtml +=   '<ul id="head' + this.idx + '" class="accordion-header headacco">';
                        dispHtml += '<button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#col' + this.idx + '" aria-expanded="false" aria-controls="col' + this.idx + '">'
                        dispHtml +=   '<li class="text-center"><div>';
                        if(this.star == 5){
                            dispHtml += '<img src="/static/icons/starstar.png" class="" alt="star" title="별" height="15" width="15">'
                                + '<img src="/static/icons/starstar.png" class="" alt="star" title="별" height="15" width="15">'
                                + '<img src="/static/icons/starstar.png" class="" alt="star" title="별" height="15" width="15">'
                                + '<img src="/static/icons/starstar.png" class="" alt="star" title="별" height="15" width="15">'
                                + '<img src="/static/icons/starstar.png" class="" alt="star" title="별" height="15" width="15">'
                        }
                        if(this.star == 4){
                            dispHtml += '<img src="/static/icons/starstar.png" class="" alt="star" title="별" height="15" width="15">'
                                + '<img src="/static/icons/starstar.png" class="" alt="star" title="별" height="15" width="15">'
                                + '<img src="/static/icons/starstar.png" class="" alt="star" title="별" height="15" width="15">'
                                + '<img src="/static/icons/starstar.png" class="" alt="star" title="별" height="15" width="15">'
                                + '<img src="/static/icons/sibalstar.png" class="" alt="star" title="별" height="15" width="15">'
                        }
                        if(this.star == 3){
                            dispHtml += '<img src="/static/icons/starstar.png" class="" alt="star" title="별" height="15" width="15">'
                                + '<img src="/static/icons/starstar.png" class="" alt="star" title="별" height="15" width="15">'
                                + '<img src="/static/icons/starstar.png" class="" alt="star" title="별" height="15" width="15">'
                                + '<img src="/static/icons/sibalstar.png" class="" alt="star" title="별" height="15" width="15">'
                                + '<img src="/static/icons/sibalstar.png" class="" alt="star" title="별" height="15" width="15">'
                        }
                        if(this.star == 2){
                            dispHtml += '<img src="/static/icons/starstar.png" class="" alt="star" title="별" height="15" width="15">'
                                + '<img src="/static/icons/starstar.png" class="" alt="star" title="별" height="15" width="15">'
                                + '<img src="/static/icons/sibalstar.png" class="" alt="star" title="별" height="15" width="15">'
                                + '<img src="/static/icons/sibalstar.png" class="" alt="star" title="별" height="15" width="15">'
                                + '<img src="/static/icons/sibalstar.png" class="" alt="star" title="별" height="15" width="15">'
                        }
                        if(this.star == 1){
                            dispHtml += '<img src="/static/icons/starstar.png" class="" alt="star" title="별" height="15" width="15">'
                                + '<img src="/static/icons/sibalstar.png" class="" alt="star" title="별" height="15" width="15">'
                                + '<img src="/static/icons/sibalstar.png" class="" alt="star" title="별" height="15" width="15">'
                                + '<img src="/static/icons/sibalstar.png" class="" alt="star" title="별" height="15" width="15">'
                                + '<img src="/static/icons/sibalstar.png" class="" alt="star" title="별" height="15" width="15">'
                        }
                        if(this.star == 0){
                            dispHtml += '<img src="/static/icons/sibalstar.png" class="" alt="star" title="별" height="15" width="15">'
                                + '<img src="/static/icons/sibalstar.png" class="" alt="star" title="별" height="15" width="15">'
                                + '<img src="/static/icons/sibalstar.png" class="" alt="star" title="별" height="15" width="15">'
                                + '<img src="/static/icons/sibalstar.png" class="" alt="star" title="별" height="15" width="15">'
                                + '<img src="/static/icons/sibalstar.png" class="" alt="star" title="별" height="15" width="15">'
                        }


                        dispHtml += '</div></li>';
                        dispHtml +=   '<li class="text-center">' + this.name + '</li>'
                            + '<li class="text-center"><div>' + this.regDate + '</div></li>'
                            + '<li class="text-center"><div>' +this.memberId + '</div></li>'
                            + '<li class="text-center"><div>' +  this.likeCount + '</div></li></<button>'
                            + '</ul>'
                            + '<div id="col' + this.idx + '" class="accordion-collapse collapse" aria-labelledby="head' + this.idx + '" data-bs-parent="#ulTable">'
                            + '<div class="accordion-body">'
                            + '<div>'
                            +   '<p>' + this.content + '</p>'
                            + '</div>'
                            + '<div>';
                        if(this.image != null) {
                            dispHtml += '<div>'
                                + '<img src="/static/upload/community/review/' + this.image + '" alt="아아아아악">'
                                + '</div>';
                        }
                        dispHtml += "</div></div></div></li>";
                    });

                    // $(dispHtml).html("#ulTable");
                    $("#ulTable").html(dispHtml);
                                      // 더보기 버튼 삭제
                    if(_endIndex > oldListCnt){
                        $("#searchMoreNotify").css("display", "none");
                    }
                    //$(".accordion_count").css("display", "none");

                    // $(".accordion ul").click(function(){
                    //     $(this).next(".accordion_count").slideToggle("fast")
                    //         .siblings(".accordion_count:visible").slideUp("fast")
                    //     $(this).stop().toggleClass("active");
                    // });
                }
            });
        }
    }
    
    function goBestList(tab, paramType) {
        $("#searchMoreNotify").css("display", "none");
        console.log(paramType);
        let dataParam = {
            category : paramType
        };
        $.ajax({
            url: '/community/api/category/goBestReview',
            type: 'post',
            dataType: "json",
            data: dataParam,
            success: function (result) {
               let dispHtml = "";
                $.each(result, function () {
                    dispHtml += '<li class="allBoxes accordion-item">';
                    dispHtml +=   '<ul id="head' + this.idx + '" class="accordion-header headacco">';
                    dispHtml += '<button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#col' + this.idx + '" aria-expanded="false" aria-controls="col' + this.idx + '">'
                    dispHtml +=   '<li class="text-center"><div>';
                    if(this.star == 5){
                        dispHtml += '<img src="/static/icons/starstar.png" class="" alt="star" title="별" height="15" width="15">'
                            + '<img src="/static/icons/starstar.png" class="" alt="star" title="별" height="15" width="15">'
                            + '<img src="/static/icons/starstar.png" class="" alt="star" title="별" height="15" width="15">'
                            + '<img src="/static/icons/starstar.png" class="" alt="star" title="별" height="15" width="15">'
                            + '<img src="/static/icons/starstar.png" class="" alt="star" title="별" height="15" width="15">'
                    }
                    if(this.star == 4){
                        dispHtml += '<img src="/static/icons/starstar.png" class="" alt="star" title="별" height="15" width="15">'
                            + '<img src="/static/icons/starstar.png" class="" alt="star" title="별" height="15" width="15">'
                            + '<img src="/static/icons/starstar.png" class="" alt="star" title="별" height="15" width="15">'
                            + '<img src="/static/icons/starstar.png" class="" alt="star" title="별" height="15" width="15">'
                            + '<img src="/static/icons/sibalstar.png" class="" alt="star" title="별" height="15" width="15">'
                    }
                    if(this.star == 3){
                        dispHtml += '<img src="/static/icons/starstar.png" class="" alt="star" title="별" height="15" width="15">'
                            + '<img src="/static/icons/starstar.png" class="" alt="star" title="별" height="15" width="15">'
                            + '<img src="/static/icons/starstar.png" class="" alt="star" title="별" height="15" width="15">'
                            + '<img src="/static/icons/sibalstar.png" class="" alt="star" title="별" height="15" width="15">'
                            + '<img src="/static/icons/sibalstar.png" class="" alt="star" title="별" height="15" width="15">'
                    }
                    if(this.star == 2){
                        dispHtml += '<img src="/static/icons/starstar.png" class="" alt="star" title="별" height="15" width="15">'
                            + '<img src="/static/icons/starstar.png" class="" alt="star" title="별" height="15" width="15">'
                            + '<img src="/static/icons/sibalstar.png" class="" alt="star" title="별" height="15" width="15">'
                            + '<img src="/static/icons/sibalstar.png" class="" alt="star" title="별" height="15" width="15">'
                            + '<img src="/static/icons/sibalstar.png" class="" alt="star" title="별" height="15" width="15">'
                    }
                    if(this.star == 1){
                        dispHtml += '<img src="/static/icons/starstar.png" class="" alt="star" title="별" height="15" width="15">'
                            + '<img src="/static/icons/sibalstar.png" class="" alt="star" title="별" height="15" width="15">'
                            + '<img src="/static/icons/sibalstar.png" class="" alt="star" title="별" height="15" width="15">'
                            + '<img src="/static/icons/sibalstar.png" class="" alt="star" title="별" height="15" width="15">'
                            + '<img src="/static/icons/sibalstar.png" class="" alt="star" title="별" height="15" width="15">'
                    }
                    if(this.star == 0){
                        dispHtml += '<img src="/static/icons/sibalstar.png" class="" alt="star" title="별" height="15" width="15">'
                            + '<img src="/static/icons/sibalstar.png" class="" alt="star" title="별" height="15" width="15">'
                            + '<img src="/static/icons/sibalstar.png" class="" alt="star" title="별" height="15" width="15">'
                            + '<img src="/static/icons/sibalstar.png" class="" alt="star" title="별" height="15" width="15">'
                            + '<img src="/static/icons/sibalstar.png" class="" alt="star" title="별" height="15" width="15">'
                    }

                    dispHtml += '</div></li>';

                    dispHtml +=   '<li class="text-center">' + this.name + '</li>'
                        + '<li class="text-center"><div>' + this.regDate + '</div></li>'
                        + '<li class="text-center"><div>' +this.memberId + '</div></li>'
                        + '<li class="text-center"><div>' +  this.likeCount + '</div></li></<button>'
                        + '</ul>'
                        + '<div id="col' + this.idx + '" class="accordion-collapse collapse" aria-labelledby="head' + this.idx + '" data-bs-parent="#ulTable">'
                        + '<div class="accordion-body">'
                        + '<div>'
                        +   '<p>' + this.content + '</p>'
                        + '</div>'
                        + '<div>';
                    if(this.image != null) {
                        dispHtml += '<div>'
                            + '<img src="/static/upload/community/review/' + this.image + '" alt="아아아아악">'
                            + '</div>';
                    }
                    dispHtml += "</div></div></div></li>";
                });
                $("#ulTable").html(dispHtml);
                // 아코디언
                // $(".accordion ul").next(".accordion_count").slideToggle("fast")
                //     .siblings(".accordion_count:visible").slideUp("fast");
                // $(".accordion ul").click(function(){
                //     $(this).next(".accordion_count").slideToggle("fast")
                //         .siblings(".accordion_count:visible").slideUp("fast")
                //     $(this).toggleClass("active");
                // });
            }
        });
    }

    // $().ready(function (){
    //     $(".paging").css("display", "none");
    // });

    // $(document).ready(function (){
    //     $(".accordion ul").next(".accordion_count").slideToggle("fast")
    //         .siblings(".accordion_count:visible").slideUp("fast");
    // });
    //
    //
    // $(".accordion ul").click(function(){
    //     $(this).next(".accordion_count").slideToggle("fast");
    //         //.siblings(".accordion_count:visible").slideUp("fast");
    //     $(this).toggleClass("active");
    // });


</script>

</html>