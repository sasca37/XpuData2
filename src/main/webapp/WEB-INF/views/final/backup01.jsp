
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
      
      .chart2{
        border: 5px solid orange;
        float: left;
        margin: 30px;
      }
      
      .chart3{
        border: 5px solid orange;
        float: left;
        margin: 30px;
      }
      /*
      .chart4{
        border: 5px solid orange;
        float: left;
        margin: 30px;
      }
      
      .chart5{
        border: 5px solid orange;
        float: left;
        margin: 30px;
      }
      */
</style>
    

    <script type="text/javascript">
    $(document).ready(function () {
        getXpu();
    });
	
    </script>
    


<script type="text/javascript">
	google.charts.load('current', {packages: ['corechart']});
	google.charts.setOnLoadCallback(function(){ drawChart1(new_option1)});
	google.charts.setOnLoadCallback(function(){ drawChart2(new_option2)});
	google.charts.setOnLoadCallback(function(){ drawChart3(new_option3)});
	
	var Gpu3;
	var Gpu2;
	var Gpu1;
    var Gpu0;
    var Cpu;
    var value1 = 0;
    var value2 = 0;
    var value3 = 0;
    var value4 = 0;
    var value5 = 0;
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
    	
       Gpu1 = obj[0].per;
       Gpu0 = obj[1].per;
      	Cpu = obj[2].per;        
       //Gpu2 = obj[3].per;
      // Gpu3 = obj[4].per;
      //    
        
        
        
        
        console.log(Gpu1);
        console.log(Gpu0);
        console.log(Cpu);
      //  console.log(Gpu2);
      //  console.log(Gpu3);
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
    
    var new_option1 = new chartOption('chart1', 100, '#FF5E00', 'Cpu');
    var new_option2 = new chartOption('chart2', 100, '#00FF4C', 'Gpu0');
    var new_option3 = new chartOption('chart3', 100, '#FFD500', 'Gpu1');
    var new_option4 = new chartOption('chart4', 100, '#FF5E00', 'Gpu2');
    var new_option5 = new chartOption('chart5', 100, '#00FF4C', 'Gpu3');
    
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
       
       
        value1 = Cpu;
        console.log(value1);
        
        o.data.insertRows(o.data.getNumberOfRows(), [[getNowTime1(), value1]]);
        drawChart1(o);
        
      }
      setInterval(function(){
          animateRenewal(new_option1);
        }, 1000);
      
      function getNowTime1(){
        var d = new Date();
        var sep = ":";
        var hh = d.getHours();
        var mm = d.getMinutes();
        var ss = d.getSeconds();
        return hh + sep + mm + sep + ss;
      }
      
      // 2
    
      function drawChart2(option) {
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

      function animateRenewal2(option){
        var o = option;
        
        if (o.data.getNumberOfRows() >= 10) {
          o.data.removeRow(0);
        }
       
       
        value2 = Gpu0;
        console.log(value2);
        
        o.data.insertRows(o.data.getNumberOfRows(), [[getNowTime2(), value2]]);
        drawChart2(o);
        
      }
      setInterval(function(){
          animateRenewal2(new_option2);
        }, 1000);
      
      function getNowTime2(){
        var d = new Date();
        var sep = ":";
        var hh = d.getHours();
        var mm = d.getMinutes();
        var ss = d.getSeconds();
        return hh + sep + mm + sep + ss;
      }
      
   // 3
      
      function drawChart3(option) {
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

      function animateRenewal3(option){
        var o = option;
        
        if (o.data.getNumberOfRows() >= 10) {
          o.data.removeRow(0);
        }
       
       
        value3 = Gpu1;
        console.log(value3);
        
        o.data.insertRows(o.data.getNumberOfRows(), [[getNowTime3(), value3]]);
        drawChart3(o);
        
      }
      setInterval(function(){
          animateRenewal3(new_option3);
        }, 1000);
      
      function getNowTime3(){
        var d = new Date();
        var sep = ":";
        var hh = d.getHours();
        var mm = d.getMinutes();
        var ss = d.getSeconds();
        return hh + sep + mm + sep + ss;
      }
      /*
 // 4
      
      function drawChart4(option) {
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

      function animateRenewal4(option){
        var o = option;
        
        if (o.data.getNumberOfRows() >= 10) {
          o.data.removeRow(0);
        }
       
       
        value4 = Gpu2;
        console.log(value4);
        
        o.data.insertRows(o.data.getNumberOfRows(), [[getNowTime4(), value4]]);
        drawChart4(o);
        
      }
      setInterval(function(){
          animateRenewal4(new_option4);
        }, 1000);
      
      function getNowTime4(){
        var d = new Date();
        var sep = ":";
        var hh = d.getHours();
        var mm = d.getMinutes();
        var ss = d.getSeconds();
        return hh + sep + mm + sep + ss;
      }
      
 // 5
      
      function drawChart5(option) {
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

      function animateRenewal5(option){
        var o = option;
        
        if (o.data.getNumberOfRows() >= 10) {
          o.data.removeRow(0);
        }
       
       
        value5 = Gpu3;
        console.log(value5);
        
        o.data.insertRows(o.data.getNumberOfRows(), [[getNowTime3(), value3]]);
        drawChart5(o);
        
      }
      setInterval(function(){
          animateRenewal5(new_option5);
        }, 1000);
      
      function getNowTime5(){
        var d = new Date();
        var sep = ":";
        var hh = d.getHours();
        var mm = d.getMinutes();
        var ss = d.getSeconds();
        return hh + sep + mm + sep + ss;
      }
      */
</script>
 
</head>
<body>
	 
     <div id="chart1" class="chart1" style="width: 900px; height: 300px; margin:2px"></div>
     <div id="chart2" class="chart2" style="width: 900px; height: 300px; margin:2px"></div>
     <div id="chart3" class="chart3" style="width: 900px; height: 300px; margin:2px"></div>
     <div id="chart4" class="chart4" style="width: 900px; height: 300px; margin:2px"></div>
     <div id="chart5" class="chart5" style="width: 900px; height: 300px; margin:2px"></div>
</body>
</html>


       
       
       
       