<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>새늘봄
        |자주 묻는 질문</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <%@ include file="../main/b_import.jspf" %>
    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
    <script>
        async function goFaqList(faqType) {
                let category = {
                    category : faqType.getAttribute("id")
            }

            let options = {
                method : 'POST',
                body: new URLSearchParams(category)
            };

            let response = await fetch("/community/api/gogoFaq", options);
            let result = await response.json();
            console.log(result);

            let dispHtml = "";
            for (let data of result) {
                dispHtml += '<ul class="dropdown-menu">';
                dispHtml += "<li>";
                dispHtml += data.answer;
                dispHtml += "</li>";
                dispHtml += "</ul>";
                dispHtml += "</div>";

                dispHtml += "<li>";
                dispHtml += "<p>" + data.question + "</p>";
                dispHtml += '<p><label for="idx' + data.idx +'">';
                dispHtml += '<input type="radio" name="idx" value="' + data.idx + '"id="idx' + data.idx +'">' + data.answer;
                dispHtml += '</label>';
                dispHtml += "</p>"
                dispHtml += "</li>";
            }
            document.querySelector("#accordionFlushExample").innerHTML = dispHtml;
        }

        $(function () {
            let startFaqType = document.querySelector("#FAQ");
            goFaqList(startFaqType);
        });
    </script>
</head>


<body>
<%@ include file="../main/b_header.jspf" %>
<div class="d-flex justify-content-center">
    <div id="container">
        <h2>자주 묻는 질문</h2>
        <div>
            <form method="post">
            <ul class="nav justify-content-around faqBox">
                <c:forEach var="category" items="${category}">
                    <li class="nav-item-3" id="${category}">
                        <a class="nav-link" id="${category}" href="#" onclick="goFaqList(this)">${category}</a>
                    </li>
                </c:forEach>
            </ul>
                <div class="accordion accordion-flush" id="accordionFlushExample"></div>
                <div>
                    <button type="button" class="btn btn-secondary"
                            onclick="goUpdate(this.form)">수정
                    </button>
                    <button type="button" class="btn btn-outline-danger"
                            onclick="goDelete(this.form)">삭제
                    </button>
                    <button type="button" class="btn btn-outline-danger"
                            onclick="goWrite()">추가
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>

<%@ include file="../main/b_footer.jspf"%>
</body>
<script>
// JSON.stringify(obj)  =>  {"a":"hi", "b":,"hello"}
// new URLSearchParams(obj) => a=hi&b=hello
function goDelete(form) {
    if($(':radio[name="idx"]:checked').length < 1){
        alert('카테고리를 선택해주세요');
        return;
    }

    let formData = $("form").serialize();
    $.ajax({
        url: '/admin/faq/api/Delete',
        type: 'POST',
        dataType: "json",
        data: formData,
        success: function (data) {
            location.href="/adnin/community/goFaq";
        }
    });
}

function goWrite() {
    location.href="/admin/faq/write"
}
function goUpdate(form) {
    if($(':radio[name="idx"]:checked').length < 1){
        alert('카테고리를 선택해주세요');
        return;
    }
    form.action="/admin/faq/Update";
    form.submit();
}


</script>
</html>

