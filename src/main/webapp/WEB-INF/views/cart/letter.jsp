<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="UTF-8">
    <title>Letter</title>
</head>
<body>

    <!-- 편지 폼 0-3까지 생성 -->
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
        <button type="button" onclick="submitForm()">전송(submit)</button>
    </div>
    <script>
        //쓸수 있는 것.
        function submitForm() {
            //lette클래스의 폼을 전부 선택.
            let letters = document.querySelectorAll(".letter");
            let datas = [];
            for (let letter of letters) { // 위에서 선택한 폼들을 자바스크립트 객체로 꺼내준다. -> 그리고 datas 배열에 넣어준다.
                let data = {
                    idx: letter.idx.value,
                    name: letter.name.value,
                    content: letter.content.value
                };
                datas.push(data);
            }

            //폼 동적으로 만들기
            let form = document.createElement("form");
            form.action = "/test/letterForm";
            form.method = "post";
            let data = document.createElement("input");
            data.name = "data";
            data.type = "text";
            //위에서 생성해준 datas 배열을 JSON타입 문자열로 변
            data.value = JSON.stringify(datas);
            //위에서 변환해준 JSON타입 문자열을 동적으로 생성한 form 안에 넣어준다.
            form.appendChild(data);

            // <form action="/test/letterForm" method="post">
            // <input type='text' name='data' value='[{"idx":1,"name":"폴인로즈 에디션","content":"아무거나입력한것"}]'>
            // </form>

            // 위의 form을 body안에 넣어준다.
            document.body.appendChild(form);
            //그리고 submit -> 컨트롤러로 이동!
            form.submit();
        }




        //참고
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
