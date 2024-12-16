<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.Map" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" type="image/x-icon" href="img/1.png">
 <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f7f9fc;
            color: #333;
            margin: 0;
            padding: 20px;
        }
        h1, h2 {
            color: #2c3e50;
            margin-bottom: 15px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        table th, table td {
            border: 1px solid #e1e4ea;
            padding: 12px;
            text-align: left;
        }
        table th {
            background-color: #34495e;
            color: #ecf0f1;
        }
        table tbody tr:nth-child(even) {
            background-color: #f2f4f8;
        }
        .no-data {
            text-align: center;
            font-style: italic;
            color: #aaa;
        }
        .chart-container {
            width: 90%;
            max-width: 800px;
            margin: 25px auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
        }
        .table-container {
            margin-bottom: 40px;
        }
    </style>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
 <%
        Map<String, Double> revenueByDate = (Map<String, Double>) request.getAttribute("revenueByDate");
        StringBuilder dates = new StringBuilder();
        StringBuilder revenues = new StringBuilder();
        if (revenueByDate != null && !revenueByDate.isEmpty()) {
            for (Map.Entry<String, Double> entry : revenueByDate.entrySet()) {
                dates.append("'").append(entry.getKey()).append("',");
                revenues.append(entry.getValue()).append(",");
            }
        }
    %>
    <h2>Biểu Đồ Doanh Thu Theo Ngày</h2>
    <div class="chart-container">
        <canvas id="revenueChart"></canvas>
    </div>
    <script>
        var ctx = document.getElementById('revenueChart').getContext('2d');
        var revenueChart = new Chart(ctx, {
            type: 'line',
            data: {
                labels: [<%= dates.toString() %>],
                datasets: [{
                    label: 'Doanh Thu (VNĐ)',
                    data: [<%= revenues.toString() %>],
                    borderColor: '#3498db',
                    borderWidth: 3,
                    tension: 0.1,
                    fill: false
                }]
            },
            options: {
                responsive: true,
                plugins: {
                    legend: {
                        display: true
                    }
                },
                scales: {
                    x: {
                        title: {
                            display: true,
                            text: 'Ngày'
                        }
                    },
                    y: {
                        title: {
                            display: true,
                            text: 'Doanh Thu (VNĐ)'
                        },
                        beginAtZero: true
                    }
                }
            }
        });
    </script>

</body>
</html>