<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="UTF-8">
    <title>새늘봄 / 매출분석 - 정기구독</title>
    <%@ include file="../main/b_import.jspf"%>
</head>
<body>
<%@ include file="../main/b_header.jspf"%>
<div id="container" class="mx-auto d-flex">
    <div class="col-8">
        <canvas id="subsByMonth"></canvas>
    </div>
    <div class="col-4">
        <canvas id="subsBySize"></canvas>
    </div>
</div>
<%@ include file="../main/b_footer.jspf"%>
<script>
    const labels = [
        '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'
    ];

    const data = {
        labels: labels,
        datasets: [{
            label: 'my first dataset',
            backgroundColor: 'rgb(255, 99, 132)',
            borderColor: 'rgb(255, 99, 132)',
            data: [1, 10, 5, 2, 20, 30, 45, 33, 48, 20, 2, 33]
        }]
    }

    const config = {
        type: 'bar',
        data,
        options: {}
    }

    const ctxMonth = document.querySelector("#subsByMonth");
    const subsByMonth = new Chart(ctxMonth, config);

    const sizeLabels = ['Small', 'Medium', 'Large'];
    const sizeData = {
        labels: sizeLabels,
        datasets: [
            {
                label: '사이즈별 구독 수량',
                backgroundColor: ['rgb(127,145,232)', 'rgb(97,198,73)', 'rgb(226,224,94)'],
                // borderColor: ,
                data: [20, 30, 60]
            }
        ]
    }
    const sizeConfig = {
        type: 'doughnut',
        data: sizeData
    }
    const ctxSize = document.querySelector("#subsBySize");
    const subsMySize = new Chart(ctxSize, sizeConfig);
</script>
</body>
</html>
