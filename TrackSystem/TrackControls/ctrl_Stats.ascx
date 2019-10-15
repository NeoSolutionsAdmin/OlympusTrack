<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ctrl_Stats.ascx.cs" Inherits="ctrl_Stats" %>
<asp:HiddenField Value="" ID="CountHidden" runat="server" ClientIDMode="Static" />
<asp:HiddenField Value="" ID="CountSprintHidden" runat="server" ClientIDMode="Static" />;
<div style="width: 100%; height: 200px">
    <canvas id="myCounterChart"></canvas>
</div>
<div style="width:100%; height:200px;margin-top:50px">
    <canvas id="myCounterChartSpring"></canvas>
</div>


<script>
    var CanvasCounterSprint = document.getElementById("myCounterChartSpring");
    var CounterValuesSprint = $("#CountSprintHidden").val().split(",");
    var CounterChartSprint = new Chart(CanvasCounterSprint,
        {
            "type": "pie",
            "data":
                {
                    "labels": ["Pausado", "En Análisis", "Desarrollo", "Finalizado", "Feature"],
                    "datasets": [
                        {
                            "label": "Estadisticas de sprints",
                            "data": CounterValuesSprint,
                            "fill": false,
                            "backgroundColor": [
                                "rgba(102, 102, 153, 0.2)",
                                "rgba(102, 102, 255, 0.2)",
                                "rgba(102, 255, 102, 0.2)",
                                "rgba(255, 255, 255, 0.2)",
                                "rgba(255, 255, 0, 0.2)"

                            ],
                            "borderColor": [
                                "rgb(102, 102, 153)",
                                "rgb(102, 102, 255)",
                                "rgb(102, 255, 102)",
                                "rgb(255, 255, 255)",
                                "rgb(255, 255, 0)"
                            ],
                            "borderWidth": 1
                        }]
                },
            "options":
                {
                    "maintainAspectRatio": false,
                   
                    "animation": { "duration": 2000 }
                }
        });

    
   



    //PARA CHART DE POST
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
                            "label":"POSTEOS",
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

    CounterChartSprint.reset();
    CounterChart.reset();

    $(document).ready(function () {
        CounterChart.update();
        CounterChart.render({
            duration: 3000,
            lazy: false,
            easing: 'easeOutBounce'
        });
         CounterChartSprint.update();
        CounterChartSprint.render({
            duration: 3000,
            lazy: false,
            easing: 'easeOutBounce'
        });
    }
    );

</script>

