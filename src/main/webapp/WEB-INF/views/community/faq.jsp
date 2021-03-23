<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>새늘봄
                 |자주 묻는 질문</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="../../../static/bootstrap-5.0.0/css/bootstrap.min.css">
    <script src="../../../static/bootstrap-5.0.0/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(function (){
            let category = $("#FAQ").attr('id');

            $.ajax({
                url : 'gogoFaq',
                type : 'POST',
                dataType : "json",
                data : category,
                success : function(data){
        /*            $.each(returnValue, function(index, obj){
                        alert(this.idx);
                    });*/
                }
            });
        });
    </script>
</head>
<body>

    <div>
        <h2>자주 묻는 질문</h2>
        <div>
            <ul class="nav justify-content-around">
                <c:forEach var="category" items="${category}">
                <li class="nav-item-3" id="${category}">
                    <a class="nav-link" href="">${category}</a>
                </li>
                </c:forEach>
                <%--<li class="nav-item-3">
                    <a class="nav-link" href="#">상품</a>
                </li>
                <li class="nav-item-3">
                    <a class="nav-link" href="#">주문.결제</a>
                </li>
                <li class="nav-item-3">
                    <a class="nav-link" href="#">정기구독</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">배송</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">취소/환불</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">클래스</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">기타</a>
                </li>--%>
            </ul>
        </div>
    </div>

</body>
</html>
