<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="UTF-8">
    <title>Letter</title>
</head>
<body>
    <div>
    <c:forEach begin="0" end="2" var="idx">
        <form class="letter">
            <div><input type="hidden" name="idx" value="${idx}" aria-label="idx"></div>
            <div><input type="text" name="name" aria-label="name"></div>
            <div><textarea name="content" ></textarea></div>
        </form>
        <hr>
    </c:forEach>
        <button type="button" onclick="request()">전송</button>
    </div>

    <script>
        function request() {
            let letters = document.querySelectorAll(".letter");
            let datas = [];
            for (let letter of letters) {
                let data = {
                    idx: letter.idx.value,
                    name: letter.name.value,
                    content: letter.content.value
                };
                datas.push(data);
            }

            fetch("/test/letter3", {
                method: 'post',
                //json타입으로 변경
                body: JSON.stringify(datas),
                headers: {
                    //json 타입을 사용할거라는 표시.
                    'Content-Type': 'application/json'
                }
            }).then(function (response) { //성공했을때 !
                response.text().then(function (result) {
                    document.body.innerHTML = result;
                    console.log(result);
                });

            }).catch(function (err) { //실패했을때 !
                alert("실패입니다 : " + err);
            })
        }
    </script>
</body>
</html>
