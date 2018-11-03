<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ctrl_Stats.ascx.cs" Inherits="ctrl_Stats" %>
<asp:HiddenField Value="" ID="CountHidden" runat="server" ClientIDMode="Static" />
<div style="width: 100%; height: 200px">
    <canvas id="myCounterChart"></canvas>
</div>
<div id="VisibleChart"></div>

<script>
    var CanvasCounter = document.getElementById("myCounterChart");
    var CounterValues = $("#CountHidden").val().split(",");
    var CounterChart = new Chart(CanvasCounter,
        {
            "type": "bar",
            "data":
                {
                    "labels": ["Comment", "Bug", "Task", "Done"],
                    "datasets": [
                        {
                            "label": "Estadisticas de posteo",
                            "data": CounterValues,
                            "fill": false,
                            "backgroundColor": [
                                "rgba(255, 99, 132, 0.2)",
                                "rgba(255, 159, 64, 0.2)",
                                "rgba(255, 205, 86, 0.2)",
                                "rgba(75, 192, 192, 0.2)"

                            ],
                            "borderColor": [
                                "rgb(255, 99, 132)",
                                "rgb(255, 159, 64)",
                                "rgb(255, 205, 86)",
                                "rgb(75, 192, 192)"
                            ],
                            "borderWidth": 1
                        }]
                },
            "options":
                {
                    "maintainAspectRatio": false,
                    "scales": {
                        "yAxes": [
                            {
                                "ticks": {
                                    "beginAtZero": true
                                }
                            }]
                    },
                    "animation": { "duration": 2000 }
                }
        });

    CounterChart.reset();
    $(document).ready(function () {
        CounterChart.update();
        CounterChart.render({
            duration: 3000,
            lazy: false,
            easing: 'easeOutBounce'
        });
    }
    );

</script>

