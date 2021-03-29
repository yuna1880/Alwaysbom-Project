<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
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
            width: 800px;
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
        #ulTable > li > ul > li:first-child +li           {width:45%;} /*제목 열 크기*/
        #ulTable > li > ul > li:first-child +li+li        {width:20%;} /*작성일 열 크기*/
        #ulTable > li > ul > li:first-child +li+li+li     {width:15%;} /*작성자 열 크기*/
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
                        <li class="nav-item">전체</li>
                        <li class="nav-item">정기 구독</li>
                        <li class="nav-item">꽃다발</li>
                        <li class="nav-item">클래스</li>
                        <li class="nav-item">소품샵</li>
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
                            <a class="nav-link" id="${ddd}" href="#" onclick="goAllList(this)">전체리뷰</a>
                        </li>
                    </ul>
                    <ul id ="ulTable">
                        <li>
                            <ul>
                                <li>별점</li>
                                <li>제목</li>
                                <li>작성일</li>
                                <li>작성자</li>
                                <li>조회수</li>
                            </ul>
                        </li>
                        <!-- 게시물이 출력될 영역 -->
                        <li>
                            <ul>
                                <li class="text-center">1</li>
                                <li class="text-center">제목제목제목제목1</li>
                                <li class="text-center">2014.07.09</li>
                                <li class="text-center">자바</li>
                                <li class="text-center">0</li>
                            </ul>
                        </li>


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
        console.log(paramType);
        console.log(paramType.getAttribute('id'));
        if (paramType.getAttribute('id') == ""){
            $.ajax({
                url: '',
                type: 'POST',
                dataType: "json",
                data: paramType,
                success: function (data) {
                }
            });
        }
    }

</script>

</html>