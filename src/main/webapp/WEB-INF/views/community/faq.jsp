<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>새늘봄
        |자주 묻는 질문</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <%@ include file="../main/import.jspf" %>
    <script>
        async function goFaqList(faqType) {
            let category = {
                category : faqType.getAttribute("id")
            }

            let options = {
                method : 'POST',
                body: new URLSearchParams(category)
            };

            let response = await fetch("/gogoFaq", options);
            let result = await response.json();
            console.log(result);

            let dispHtml = ""
            for (let data of result) {
                dispHtml += "<li>";
                dispHtml += "<p>" + data.question + "</p>";
                dispHtml += "<p>" + data.answer + "</p>";
                dispHtml += "</li>";
            }
            document.querySelector("#faqList").innerHTML = dispHtml;

            /*
            $.ajax({
                url: '/gogoFaq',
                type: 'POST',
                dataType: "json",
                data: category,
                success: function (data) {
                    console.log(data);
                    let dispHtml = "<li>"
                    $.each(data, function () {
                        dispHtml += "<p>" + this.question + "</p>";
                        dispHtml += "<p>" + this.answer + "</p>";
                        dispHtml += "</li>";
                    });
                    $("#faqList").html(dispHtml);
                }
            });
            */
        }

        $(function () {
            let startFaqType = document.querySelector("#FAQ");
            goFaqList(startFaqType);
        });
    </script>
</head>


<body>

    <div>
        <h2>자주 묻는 질문</h2>
        <div>
            <ul class="nav justify-content-around faqBox">
                <c:forEach var="category" items="${category}"
                >
                    <li class="nav-item-3" id="${category}">
                        <a class="nav-link" id="${category}" href="#" onclick="goFaqList(this)">${category}</a>
                    </li>
                </c:forEach>
            </ul>
            <div>
                <ul id="faqList">
                </ul>
            </div>
        </div>
        <div>
            <a href="#" class="btn">1:1 문의하기</a><%--로그인 처리--%>
        </div>
    </div>
</body>
<script>
let obj = {
    a : 'hi',
    b : 'hello'
}

// JSON.stringify(obj)  =>  {"a":"hi", "b":,"hello"}
// new URLSearchParams(obj) => a=hi&b=hello


</script>
</html>

