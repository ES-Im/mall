// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#858796';

// Pie Chart Example
/*document.addEventListener("DOMContentLoaded", function () {*/
    fetch('../getGenderRation')
        .then(response => response.json())  // JSON 응답을 객체로 변환
        .then(data => {
             
            const labels = Object.keys(data);  // male, female
            const values = Object.values(data);  // 71.4, 28.6
			console.log('Labels:', labels); // 디버깅용 출력
			console.log('Values:', values); // 디버깅용 출력
            // Chart.js를 사용해 도넛 차트 생성
            var ctx = document.getElementById("myPieChart");
            var myPieChart = new Chart(ctx, {
                type: 'doughnut',
                data: {
                    labels: labels,
                    datasets: [{
                        data: values,
                        backgroundColor: ['#4c5b6c', '#9fa4a3'],
                        hoverBackgroundColor: ['#3a3a3a', '#717b7f'],
                        hoverBorderColor: "rgba(234, 236, 244, 1)",
                    }],
                },
                options: {
                    maintainAspectRatio: false,
                    tooltips: {
                        backgroundColor: "rgb(255,255,255)",
                        bodyFontColor: "#858796",
                        borderColor: '#dddfeb',
                        borderWidth: 1,
                        xPadding: 15,
                        yPadding: 15,
                        displayColors: false,
                        caretPadding: 10,
                    },
                    legend: {
                        display: false
                    },
                    cutoutPercentage: 80,
                },
            });
        })
        .catch(error => console.error('데이터 가져오기 실패:', error));
/*});*/
