<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>상품 후기</title>
    <%@ include file="../main/import.jspf" %>
</head>
<body>
<%@ include file="../main/header.jspf" %>
<div id="container" class="mx-auto d-flex flex-column h-100 user-select-none">
    <%@ include file="../member/mypage_header.jspf" %>
    <div class="h-85 d-flex">
        <%@ include file="../member/mypage_menu.jspf" %>
        <div class="col-10 border-info d-flex justify-content-center p-4">
            <div class="col-12 h-100" id="contentPane">
                <div class="col-12 border-info d-flex justify-content-center p-4">
                    <div class="col-12">
                        <div class="d-flex text-secondary">
                            <span class="h5">상품 후기</span>
                        </div>
                        <hr class="hr1"/>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    async function goMyClassList(e) {
        e.preventDefault();
        let $contentPane = document.querySelector("#contentPane");

        let response = await fetch("/fclass/orders");
        $contentPane.innerHTML = await response.text();
        let $innerScript = $contentPane.querySelector("#innerScript");

        let $script = document.createElement("script");
        $script.appendChild(document.createTextNode($innerScript.innerHTML));
        $innerScript.replaceWith($script);
    }
</script>
</body>
<%@ include file="../main/footer.jspf"%>
</html>

