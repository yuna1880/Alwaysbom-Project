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
<div id="container" class="mx-auto d-flex p-3 bg-white">
    <div class="col-8 p-4">
        <canvas id="subsByMonth"></canvas>
    </div>
    <div class="col-4 p-4">
        <canvas id="subsBySize"></canvas>
    </div>
</div>
<%@ include file="../main/b_footer.jspf"%>
<script>

    fetch("/statistics/api/subsByMonth").then(response => {
        response.json().then(result => {
            console.log(result);

            const labels = result.map((v, i) => v.month);
            const datas = result.map((v, i) => v.subsCount);

            const data = {
                labels: labels,
                datasets: [{
                    label: "월별 구독 수 추이",
                    backgroundColor: '#ff6384',
                    border: 'none',
                    data: datas
                }]
            }

            const config = {
                type: 'bar',
                data,
                options: {
                    plugins: {
                        title: {
                            display: true,
                            text: '월별 구독 수 추이'
                        }
                    }
                }
            }

            const ctxMonth = document.querySelector("#subsByMonth");
            const subsByMonth = new Chart(ctxMonth, config);

        })
    })

    // const labels = Array.from({length: 6}, (v, i) => (((new Date().getMonth() + 1) - (5 - i) + 12 - 1) % 12 + 1) + "월")
    //
    // const data = {
    //     labels: labels,
    //     datasets: [{
    //         label: "월별 구독 수 추이",
    //         backgroundColor: '#ff6384',
    //         border: 'none',
    //         data: [1, 10, 5, 2, 20, 30]
    //     }]
    // }
    //
    // const config = {
    //     type: 'bar',
    //     data,
    //     options: {
    //         plugins: {
    //             title: {
    //                 display: true,
    //                 text: '월별 구독 수 추이'
    //             }
    //         }
    //     }
    // }
    //
    // const ctxMonth = document.querySelector("#subsByMonth");
    // const subsByMonth = new Chart(ctxMonth, config);

    const sizeLabels = ['Small', 'Medium', 'Large'];
    const sizeData = {
        labels: sizeLabels,
        datasets: [
            {
                backgroundColor: ['rgb(127,145,232)', 'rgb(97,198,73)', 'rgb(226,224,94)'],
                border: 'none',
                data: [20, 30, 60]
            }
        ]
    }
    const sizeConfig = {
        type: 'doughnut',
        data: sizeData,
        options: {
            plugins: {
                title: {
                    display: true,
                    text: '사이즈별 구독 수량'
                }
            }
        }
    }
    const ctxSize = document.querySelector("#subsBySize");
    const subsMySize = new Chart(ctxSize, sizeConfig);
</script>
</body>
</html>
