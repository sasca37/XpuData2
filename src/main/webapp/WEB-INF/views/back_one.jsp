
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>

<script type="text/javascript" src="/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/resources/js/jquery.form.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<meta charset="utf-8">

<head>
<style>
      .chart1{
        border: 5px solid orange;
        float: left;
        margin: 30px;
      }
      
</style>
    <script type="text/javascript">
    $(document).ready(function () {
        getXpu();
    });
    </script>
    


<script type="text/javascript">
	google.charts.load('current', {packages: ['corechart']});
	google.charts.setOnLoadCallback(function(){ drawChart1(new_option1)});
   // google.charts.setOnLoadCallback(function(){ drawChart2(new_option2)});
	//google.charts.setOnLoadCallback(function(){ drawChart1(new_option3)});
	
	var Gpu1;
    var Gpu0;
    var Cpu;
    var value1 = 0;
    var value2 = 0;
    var value3 = 0;

    function getXpu() {
        $.ajax({
            url: "/xpu/getXpu",
            data: $("#xpuForm").serialize(),
            dataType: "JSON",
            cache: false,
            async: true,
            type: "POST",
            success: function (obj) {
                getXpuCallback(obj);
                console.log(obj);
            },
            error: function (xhr, status, error) {
            }

        });
    }

    function getXpuCallback(obj) {
         Gpu0 = obj[0].per;
         Gpu1 = obj[1].per;
         Cpu = obj[2].per;
        
        console.log(Gpu0);
        console.log(Gpu1);
        console.log(Cpu);
    }
    
    setInterval(getXpu, 1000);
    
    var chartOption = function(target, maxValue, color, name){
        this.name = name;
        this.target = target;
        this.data = null;
        this.chart = null;
        this.options = {
        	title : name,
        	titlePosition : 'out',
        	fontSize : 15,
          legend: { position: 'none'},
          vAxis: {minValue:0, maxValue:maxValue},
          hAxis: {
            textStyle: {
              fontSize: 11
            }
          },
          colors: [color],
          animation: {
            duration: 500,
            easing: 'in',
            startup: true
          }
        }
      }
    var chartOption2 = function(target, maxValue, color, name){
        this.name = name;
        this.target = target;
        this.data = null;
        this.chart = null;
        this.options = {
        	title : name,
        	titlePosition : 'out',
        	fontSize : 15,
          legend: { position: 'none'},
          vAxis: {minValue:0, maxValue:maxValue},
          hAxis: {
            textStyle: {
              fontSize: 11
            }
          },
          colors: [color],
          animation: {
            duration: 500,
            easing: 'in',
            startup: true
          }
        }
      }
    var new_option1 = new chartOption('chart1', 100, '#FF5E00', 'Cpu');
    //var new_option2 = new chartOption2('chart1', 100, '#00FF4C', 'Gpu0');
    //var new_option3 = new chartOption('chart1', 100, '#FFD500', 'Gpu1');
    
    function drawChart1(option) {
        var o = option;
       
        if(o != null){
          //초기값일때만 처리
          if(o.chart == null && o.data == null){
            o.data = new google.visualization.DataTable();
            o.data.addColumn('string', 'time');
            o.data.addColumn('number', o.name);
            o.data.addRow(['', 0]);
            o.chart = new google.visualization.LineChart(document.getElementById(o.target));
          }
		 
          o.chart.draw(o.data, o.options);
          
        }
      }

      function animateRenewal(option){
        var o = option;
        
        if (o.data.getNumberOfRows() >= 10) {
          o.data.removeRow(0);
        }
        value0 = Cpu;
        console.log(value0);
        o.data.insertRows(o.data.getNumberOfRows(), [[getNowTime1(), value0]]);
        drawChart1(o);
      }
      setInterval(function(){
          animateRenewal(new_option1, new_option2);
        }, 1000);
      function getNowTime1(){
        var d = new Date();
        var sep = ":";
        var hh = d.getHours();
        var mm = d.getMinutes();
        var ss = d.getSeconds();
        return hh + sep + mm + sep + ss;
      }
 
</script>
 
</head>
<body>
     <div id="chart1" class="chart1" style="width: 800px; height: 300px"></div>
    
</body>
</html>


       
       
       
       