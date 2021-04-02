<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>1:1</title>
    <%@ include file="../main/b_import.jspf" %>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <style>
        .bottom-line{
            border-bottom:1px solid silver;
        }

        .toggleBtn {
            display: none;
        }
        .disflex {
            display: flex;
        }
        .nopadding {
            padding: 0px;
        }
        .checkpadding{
            padding-right: 120px;
        }

        @media (min-width: 1024px) {
            .reBoard {
                padding-right: 80px;
            }
        }
    </style>
    <script>
        $(function (){
            $('.accoque').click(function () {
                  let angle = 0;
                console.log(angle);

                if ($(this).next(".toggleBtn").is(":visible")) {
                      angle += 360;
                      // $(this).find('.checkv').rotate(angle);
                      $(this).find('.checkv').css({'transform': 'rotate(' + angle + 'deg)'});
                      $(this).next(".toggleBtn").slideUp("fast");
                  } else {
                      // $(this).next(".toggleBtn").removeClass("d-none");
                      angle += 180;
                      $(this).find('.checkv').css({'transform': 'rotate(' + angle + 'deg)'});
                      $(this).next(".toggleBtn").slideDown("fast");
                  }
            });
        });

    </script>
</head>
<body>
<%@ include file="../main/b_header.jspf" %>
<div class="d-flex justify-content-center">
    <div id="container">
        <h2>1:1 관리자 문의 게시판 입니다.</h2>
        <div class="mx-5">
            <ul class="nav justify-content-around reviewBox">
                <li class="nav-item-3">
                    <a class="nav-link" id="${param.category}" href="#" onclick='goNoAnswer("noAnswer")'>미답변</a>
                </li>
                <li class="nav-item-3">
                    <a class="nav-link" id="${param.category}" href="#" onclick='goAnswer("answer")'>답변</a>
                </li>
            </ul>
            <div class="row row-cols-6 mx-auto bottom-line reBoard">
                <span class="text-center col-2 nopadding">번호</span>
                <span class="text-center col-2 nopadding">작성일</span>
                <span class="text-center col-5 nopadding">제목</span>
                <span class="text-center col-3 nopadding checkpadding">상태</span>
            </div>
            <ul class="nav row table mx-auto">
                <c:forEach var="quList" items="${questlist}">
                    <li class="list">

                        <div class="row mx-auto row-cols-5 bottom-line accoque reBoard">
                            <span class="text-center col-2 mx-auto">${quList.idx}</span>
                            <span class="text-center col-2 mx-auto">작성일</span>
                            <span class="text-center col-5">${quList.name}</span>
                            <span class="text-center col-2">미답변</span>
                            <span class="text-center col-1"><img src="/static/icons/up.svg" class="rounded- mx-auto checkv" alt="V" title="V"></span>
                        </div>

                        <div class="row bottom-line text-center toggleBtn disflex" style="display: none">
                            <c:if test="${not empty quList.image}">
                            <div class="col">
                                <img src="${quList.image}" class="rounded-" alt="questimg" title="문의사진">
                            </div>
                            </c:if>
                            <div class="col">
                                내용내용내용내용내용질문내용
                            </div>
                        </div>

                        <div>
                            <div class="row row-cols-5 mx-auto bottom-line accoque reBoard nopadding">
                                <span class="text-center col-2 nopadding">
                                    <img src="/static/icons/right.svg" alt="answer" title="화살표">
                                </span>
                                <span class="text-center col-2 nopadding">작성일</span>
                                <span class="text-center col-5 nopadding">답변ㅇㅇㅇㅇ</span>
                                <span class="text-center col-2 nopadding">답변ㅇㅇㅇㅇ</span>
                                <span class="text-center col-1 nopadding checkpadding"><img src="/static/icons/up.svg" class="rounded- mx-auto checkv" alt="V" title="V"></span>
                            </div>

                            <div class="bottom-line toggleBtn">
                                <div>
                                    <div>
                                        답변내용답변내용답변내용답변내용답변내용답변내용답변내용답변내용답변내용
                                    </div>
                                </div>
                                <div>
                                    <div>
                                        <form>

                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </li>
                </c:forEach>
            </ul>
        </div>
    </div>
</div>

<%@ include file="../main/b_footer.jspf"%>
</body>
</html>



<%--

<!DOCTYPE HTML>
<html lang="ko">
<head>
    <title>새늘봄
        |1 vs 1</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">


</head>
--%>




